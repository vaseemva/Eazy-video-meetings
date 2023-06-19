import 'package:flutter/material.dart';
import 'package:zoom_clone/models/user_model.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get getUser {
    return _user!;
  }

  set setUser(UserModel userModel) {
    _user = userModel;
  }

  UserProvider() {
    refreshUser();
  }

  Future<void> refreshUser() async {
    UserModel user = await AuthMethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
