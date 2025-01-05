import 'package:flutter/material.dart';
import 'package:gym_app/services/api_services.dart';

class UserProvider extends ChangeNotifier {
  final _apiServices = ApiServices();
  bool _loading = false;
  bool get loading => _loading;
}
