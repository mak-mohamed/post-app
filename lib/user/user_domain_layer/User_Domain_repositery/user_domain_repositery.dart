import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';

abstract class UserDomainRepositery {
  Future<Either<UserFailuer, UserEntity>> userLogin (
      {required String username, required String password}) async {
    throw UnimplementedError();
  }

Future<Either<UserFailuer,Unit>> AddUser ( {required UserModel userModel}) async {throw UnimplementedError() ;}



Future<Either<UserFailuer,UserEntity>> getUser ( {required int id}) async {throw UnimplementedError() ;}
Future<Either<UserFailuer,String>> splash ()async{throw UnimplementedError() ;}

}
