

import 'package:equatable/equatable.dart';

abstract class  UserFailuer extends Equatable  {
    @override
  List<Object?> get props => [];
}


class UserServerFailuer extends UserFailuer {
  
}
class UserOfflineFailuer extends UserFailuer {
  
}


class UseWorngdataFailuer extends UserFailuer {
  
}