import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? name;
  final String? username;
  final String? email;

  final String? phone;
  final String? website;
  
  const UserEntity(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
   
      required this.phone,
      required this.website,
     });

  @override
  List<Object?> get props => [id, name, username, email, phone, website];
}

class Geo extends Equatable {
  final String? lat;
  final String? lng;

  const Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
  @override
  List<Object?> get props => [lat, lng];
}
