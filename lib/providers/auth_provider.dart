import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/helpers/cloudinary_config.dart';
import 'package:gym_app/helpers/ui_helper.dart';
import 'package:gym_app/screens/admin/admin_home_screen.dart';
import 'package:gym_app/screens/shared/login_screen.dart';
import 'package:gym_app/screens/user/user_home_screen.dart';
import 'package:gym_app/services/storage_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gym_app/services/api_services.dart';

class AuthProvider extends ChangeNotifier {
  final _apiServices = ApiServices();
  final _auth = FirebaseAuth.instance;
  CloudinaryResponse? _response;
  CloudinaryConfig cloudinary = CloudinaryConfig();
  bool _loading = false;
  bool get loading => _loading;
  File? _image;
  File? get image => _image;
  final imagePicker = ImagePicker();
  XFile? pickedImage;
  Future<void> getImage() async {
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage!.path);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future<void> signup(
      BuildContext context, Map<String, dynamic> data, String password) async {
    _loading = true;
    String defaultPhoto =
        "https://res.cloudinary.com/deatjtqsi/image/upload/t_Profile/v1735835775/gym_app/user_rfmlfd.png";
    notifyListeners();
    try {
      if (data['name'].isEmpty ||
          data['email'].isEmpty ||
          password.isEmpty ||
          data['phone'].isEmpty) {
        UiHelper.errorFlushMessage(context, "All fields are required");
        return;
      }
      if (password.length < 6) {
        UiHelper.errorFlushMessage(
            context, "Password must be at least 6 characters");
        return;
      }
      Map<String, dynamic> existingUser =
          await _apiServices.getSingleWhere("users", "email", data['email']);
      if (existingUser.isNotEmpty) {
        UiHelper.errorFlushMessage(context, "User already exists");
        return;
      }
      if (_image == null) {
        data['photoUrl'] = defaultPhoto;
      } else {
        _response = await CloudinaryConfig.uploadImage(_image!.path);
        data['photoUrl'] = _response!.secureUrl;
      }
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: password,
      );
      data['role'] = "user";
      data['coins'] = 0;
      data['membership'] = "none";
      data['uid'] = userCredential.user!.uid;
      data['createdAt'] = DateTime.now();
      userCredential.user!.updateDisplayName(data['name']);
      userCredential.user!.updatePhotoURL(data['photoUrl']);
      await _apiServices
          .addRecord("users", userCredential.user!.uid, data)
          .then((_) {
        Navigator.pop(context);
        UiHelper.successFlushMessage(context, "Registration Successful");
      });
    } catch (e) {
      UiHelper.errorFlushMessage(context, e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> login(BuildContext context, Map<String, dynamic> data) async {
    try {
      _loading = true;
      notifyListeners();
      if (data['email'].isEmpty || data['password'].isEmpty) {
        UiHelper.errorFlushMessage(context, "All fields are required");
        return;
      }
      Map<String, dynamic> user = await _apiServices.getSingleWhere(
        "users",
        "email",
        data['email'],
      );
      if (user.isEmpty) {
        UiHelper.errorFlushMessage(context, "User not found");
        return;
      }
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      if (userCredential.user == null) {
        UiHelper.errorFlushMessage(context, "Invalid Credentials");
        return;
      }
      if (userCredential.user != null) {
        StorageServices().saveData('role', user['role']);
        if (user['role'] == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminHomeScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserHomeScreen(),
            ),
          );
        }
        UiHelper.successFlushMessage(context, "Login Successful");
      }
    } catch (error) {
      UiHelper.errorFlushMessage(context, error.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    await StorageServices().removeData();
    await _auth.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
    UiHelper.successFlushMessage(context, "Logout Successfull");
  }
}
