import 'dart:math';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userException.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:dartz/dartz.dart';
import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
import 'package:mbook2/user/user_data_layer/uder_data_local/user_data_local.dart';
import 'package:mbook2/user/user_data_layer/uder_data_local/user_data_local_sharedpref.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:mbook2/user/user_data_layer/user_data_web/userdataweb.dart';
import 'package:mbook2/user/user_domain_layer/User_Domain_repositery/user_domain_repositery.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';

class UserDataRepositery implements UserDomainRepositery {
  final UserDataWeb userDataWeb;
  final UserDataLocal userDataLocal;
  final UserSharedPreferncess sharedPreferncess;

  UserDataRepositery(
      {required this.sharedPreferncess,
      required this.userDataWeb,
      required this.userDataLocal});

  @override
  Future<Either<UserFailuer, UserEntity>> getUser({required int id}) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        return Right(await userDataWeb.getUsers(id: id));
      } on UserServerException {
        return Left(UserServerFailuer());
      }
    } else {
      return Left(UserOfflineFailuer());
    }
  }

  @override
  Future<Either<UserFailuer, Unit>> AddUser({required userModel}) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        return right(await userDataWeb.userAdd(userModel: userModel));
      } on UserServerFailuer {
        return Left(UserServerFailuer());
      }
    } else {
      return Left(UserOfflineFailuer());
    }
  }

  @override
  Future<Either<UserFailuer, UserModel>> userLogin(
      {required String username, required String password}) async {
    String? usernamee = await UserSharedPreferncess.getUserData();
    if (usernamee != null) {
      return Right(UserModel(
          id: 1,
          name: username,
          username: username,
          email: 'email',
          phone: 'phone',
          website: 'website'));
    } else {
      if (await InternetConnectionChecker().hasConnection) {
        try {
          UserModel user = await userDataWeb.checkIfuserinWebDb(
              usernameoremail: username, password: 'password');

          UserSharedPreferncess.saveUserData(username);
          return right(user);
        } on UserServerException {
          return Left(UserServerFailuer());
        }
      } else {
        return left(UserOfflineFailuer());
      }
    }
  }

  @override
  Future<Either<UserFailuer, String>> splash() async {
    String? usernamee = await UserSharedPreferncess.getUserData();
    if (usernamee != null) {
      return Right(usernamee);
    } else {
      return Left(UseWorngdataFailuer());
    }
  }
}
