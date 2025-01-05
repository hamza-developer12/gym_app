import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/helpers/ui_helper.dart';
import 'package:gym_app/services/api_services.dart';

class CoinsProvider extends ChangeNotifier {
  final _apiServices = ApiServices();
  bool _loading = false;
  bool get loading => _loading;

  Future<void> provideCoins(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      _loading = true;
      notifyListeners();

      if (data['email'].isEmpty || data['coins'].isEmpty) {
        UiHelper.errorFlushMessage(context, "Please fill all fields");
        return;
      }

      Map<String, dynamic> user =
          await _apiServices.getSingleWhere("users", "email", data['email']);

      if (user.isEmpty) {
        UiHelper.errorFlushMessage(context, "User not found");
        return;
      }
      if (user['role'] == "admin") {
        UiHelper.errorFlushMessage(context, "Admins cannot be provided coins");
        return;
      }
      data['coins'] = int.parse(data['coins']);
      if (data['coins'] <= 0) {
        UiHelper.errorFlushMessage(context, "Coins must be greater than 0");
        return;
      }
      _apiServices.updateRecordById(
        "users",
        user['uid'],
        {"coins": user['coins'] + data['coins']},
      ).then((_) {
        Navigator.pop(context);
        UiHelper.successFlushMessage(context, "Coins provided successfully");
      });
    } catch (e) {
      UiHelper.errorFlushMessage(context, e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> requestCoins(BuildContext context, String coins) async {
    // Implement request coins functionality
    try {
      _loading = true;
      notifyListeners();
      if (coins.isEmpty) {
        UiHelper.errorFlushMessage(
            context, "Please enter the number of coins you want to request");
        return;
      }
      int totalCoins = int.parse(coins) ?? 0;

      if (totalCoins <= 0) {
        UiHelper.errorFlushMessage(context, "Coins must be greater than 0");
        return;
      }
      FirebaseAuth auth = FirebaseAuth.instance;

      User? user = auth.currentUser;
      if (user == null) {
        UiHelper.errorFlushMessage(context, "No user is currently signed in");
        return;
      }
      Map<String, dynamic> existinReq = await _apiServices.getSingleWhere(
          "coins_requests", "userId", user.uid);
      if (existinReq.isNotEmpty) {
        UiHelper.errorFlushMessage(context, "You have already requested coins");
        return;
      }

      _apiServices.addRecord("coins_requests", "", {
        "email": user.email,
        "name": user.displayName,
        "coins": totalCoins,
        "userId": user.uid,
        "createdAt": DateTime.now(),
      }).then((_) {
        Navigator.pop(context);
        UiHelper.successFlushMessage(
            context, "Coins request sent successfully");
      });
    } catch (e) {
      UiHelper.errorFlushMessage(context, e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<List> getCoinsRequests() async {
    final requests = await _apiServices.getRecords("coins_requests");

    return requests.map((request) => request.data()).toList();
  }

  Future<void> rejectRequest(BuildContext context, String id) async {
    try {
      _loading = true;
      notifyListeners();
      _apiServices.deleteById("coins_requests", id).then((_) {
        Navigator.pop(context);
        UiHelper.successFlushMessage(context, "Request rejected successfully");
      });
    } catch (e) {
      UiHelper.errorFlushMessage(context, e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> approveRequest(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      _loading = true;
      notifyListeners();

      Map<String, dynamic> user =
          await _apiServices.getRecordById("users", data['userId']);
      if (user.isEmpty) {
        UiHelper.errorFlushMessage(context, "User not found");
        return;
      }

      _apiServices.updateRecordById("users", data['userId'], {
        "coins": user['coins'] + data['coins'],
      }).then((_) {
        _apiServices.deleteById("coins_requests", data['id']).then((_) {
          Navigator.pop(context);
          UiHelper.successFlushMessage(
              context, "Request approved successfully");
        });
      });
    } catch (e) {
      UiHelper.errorFlushMessage(context, e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
