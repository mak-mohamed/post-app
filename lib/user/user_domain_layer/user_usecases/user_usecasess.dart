import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:mbook2/user/user_domain_layer/User_Domain_repositery/user_domain_repositery.dart';


import '../user_Entity/UserEntity.dart';



class UserLoginUsecases {
  final UserDomainRepositery userDomainRepositery;

  UserLoginUsecases({required this.userDomainRepositery});

  Future<Either<UserFailuer, UserEntity >> Call(
      {required String username, required String password}) async {
    return await userDomainRepositery.userLogin(
        username: username, password: password);
  }
}

class AddUserUseCases {
  final UserDomainRepositery userDomainRepositery;
  final UserModel userModel ;
  AddUserUseCases({required this.userDomainRepositery ,required  this.userModel});

  Future<Either<UserFailuer, Unit>> Call(
      {required String username, required String password}) async {
    return await userDomainRepositery.AddUser(
     userModel: userModel);
  }
}

class GetUserUseCases {
  final UserDomainRepositery userDomainRepositery;

  GetUserUseCases({required this.userDomainRepositery});

  Future<Either<UserFailuer, UserEntity>> Call({required int id}) async {
    return await userDomainRepositery.getUser(id: id);
  }
}

class SplashUsecases {
  final UserDomainRepositery userDomainRepositery ;

  SplashUsecases({required this.userDomainRepositery});
  Future<Either<UserFailuer,String>> Call ()async {
    return await userDomainRepositery.splash();
  }
  
}
