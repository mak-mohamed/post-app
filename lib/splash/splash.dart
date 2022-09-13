import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/route_constant.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';

import 'splash bloc/bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double x = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        x = MediaQuery.of(context).size.width;
      });
    });
   
  }

  @override
  Widget build(BuildContext context) {
     context.read<SplashBloc>().add(SplashInitEvent()) ; 
    return  BlocConsumer<SplashBloc,SplashState>(
      listener: (context, state) {
      if (state is SplashNouser) {
        print('we are in no user') ;
       Navigator.of(context).pushReplacementNamed('login_page');    
      } else  if (state is SplashUser){
         print('we are in no user') ;
         Navigator.of(context).pushReplacementNamed(postsPage , arguments: UserEntity(id: 1, name: state.username, username: state.username, email: 'email', phone: 'phone', website: 'website'));  
        
      }
      },
      builder: (context, state) {
           return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: MyColor.myblue,
          height: double.infinity,
          width: double.infinity,
        ),
        AnimatedPositioned(
          top: x,
          curve: Curves.easeInOutSine,
          duration: const Duration(seconds: 5),
          child: Image.asset('lib/assets/pic/splash.png'),
        ),
      ],
    );;
      },
    )
    ;
  }
}
