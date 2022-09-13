
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';

class UserModel extends UserEntity {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
 

  const UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
   
      required this.phone,
      required this.website,
      })
      : super(
           
            email: email,
            id: id,
            name: name,
            phone: phone,
            username: username,
            website: website,
         );

  factory UserModel.fronJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
     
      phone: json['phone'],
      website: json['website'],

    );
  }

 
}
