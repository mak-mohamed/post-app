import 'package:get_it/get_it.dart';
import 'package:mbook2/post/post_data_layer/post_data_web/post_data_web.dart';
import 'package:mbook2/post/post_domain_layer/post_domain_repositry/post_domain_repositery.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';
import 'package:mbook2/splash/splash%20bloc/bloc/splash_bloc.dart';
import 'package:mbook2/user/user_data_layer/uder_data_local/user_data_local.dart';
import 'package:mbook2/user/user_data_layer/user_data_repositery/User_data_repositery.dart';
import 'package:mbook2/user/user_data_layer/user_data_web/userdataweb.dart';
import 'package:mbook2/user/user_domain_layer/User_Domain_repositery/user_domain_repositery.dart';
import 'package:mbook2/user/user_domain_layer/user_usecases/user_usecasess.dart';
import 'package:mbook2/user/user_present_layer/bloc/login%20bloc/bloc/login_bloc.dart';
import '../../post/post_data_layer/post_data_local/post_data_local.dart';
import '../../post/post_data_layer/post_data_repositery/post_data_repositery.dart';
import '../../post/post_domain_layer/post_usecasess/post_usecasess.dart';
import '../../post/post_present_layer/postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';
import 'package:mbook2/user/user_data_layer/uder_data_local/user_data_local_sharedpref.dart';

final getit = GetIt.instance;
Future<void> init() async {
  //!post /////////
  //? ppresention layer
  getit.registerFactory(() => PostgetBloc(getAllPOstUseCasess: getit()));
  getit.registerFactory(() => PostAddEdeitBloc(
      addPOstUseCasess: getit(),
      updatePOstUseCasess: getit(),
      deletePostUseCasess: getit()));

  //? domain layer
  getit.registerLazySingleton(
      () => GetAllPOstUseCasess(postDomainRepositery: getit()));

  getit.registerLazySingleton(
      () => AddPOstUseCasess(postDomainRepositery: getit()));
  getit.registerLazySingleton(
      () => UpdatePOstUseCasess(postDomainRepositery: getit()));
  getit.registerLazySingleton(
      () => DeletePostUseCasess(postDomainRepositery: getit()));
  //? data layer
  getit.registerLazySingleton<PostDomainRepositery>(
      () => PostDataRepositery(postDataLocal: getit(), postDataWeb: getit()));

  final postDataLocal = PostDataLocal.instance;

  getit.registerLazySingleton(() => PostDataWeb());
  getit.registerLazySingleton(() => postDataLocal);

  final sharedprefinstance = UserSharedPreferncess() ;
  getit.registerLazySingleton(() => sharedprefinstance) ;


  //! auth
  //?login
  //?present bloc
getit.registerFactory(() => LoginBloc(userloginusecasess: getit())) ;


//?data layer use cases 

getit.registerLazySingleton(() =>  UserLoginUsecases(userDomainRepositery: getit()));
getit.registerLazySingleton(() =>  AddUserUseCases(userDomainRepositery: getit(), userModel:  getit()));
getit.registerLazySingleton(() =>  GetUserUseCases(userDomainRepositery: getit()));

//? data layer 
getit.registerLazySingleton<UserDomainRepositery>(() => UserDataRepositery(userDataLocal: getit(),userDataWeb: getit() ,sharedPreferncess: getit()));
getit.registerLazySingleton(() => UserDataWeb()) ; 
final userdadtalocal = UserDataLocal.instance ;
getit.registerLazySingleton(() =>userdadtalocal);



//! splash 
getit.registerFactory(() => SplashBloc(splashUsecases: getit()));
getit.registerLazySingleton(() => SplashUsecases(userDomainRepositery: getit()));

}
