import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userException.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';

class UserDataWeb {
  final String endpointuser = 'https://jsonplaceholder.typicode.com/users/';

  Future<UserModel> checkIfuserinWebDb(
      {required String usernameoremail, required password}) async {

      
    final response = await http.get(Uri.parse(endpointuser));
    
    if (response.statusCode == 200) {
    
      final List list = json.decode(response.body);
     
      bool check = false ; 
         int save = 0 ;  
        
      List<UserModel> users = list
          .map((e) => UserModel.fronJson(e)) 
          .toList();
   


      for (var element in users) {
        if (((usernameoremail == element.name) ||
            (usernameoremail == element.email))) {
          check = true ; 
          save = element.id ;     
        }
      }
      if (check) {
      
        return   UserModel(id: users[save].id, name:  users[save].name,
         username: users[save].username, email: users[save].email, phone: users[save].phone, website: users[save].website );
         
      } else {
       throw UserWorngDataException() ; 
      }
    } else {
      throw ServerException();
    }
  }

  Future<Unit> userAdd ({required UserModel userModel})async{
  final response =await  http.post(Uri.parse(endpointuser + userModel.id.toString()));
  if (response.statusCode == 201) {
   return unit ;   
  } else {
    throw ServerException()
;  }  
  }


    Future<UserModel> getUsers({required int id}) async {
    final response = await http.get(Uri.parse(endpointuser));

    if (response.statusCode == 200) {
       List list = json.decode(response.body);
      print(list[1]) ;    //  List<UserModel> users = list.map((e) => UserModel.fronJson(e)).toList();

          print('''users''');

  }
  throw ServerException() ;
}
}