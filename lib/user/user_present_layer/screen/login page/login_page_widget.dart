// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/user/user_present_layer/bloc/login%20bloc/bloc/login_bloc.dart';
import 'package:mbook2/core/localization/applocalization.dart';
Widget buildBodyLogIn(BuildContext context,
    {required TextEditingController emailcontroller,
    required TextEditingController passWordcontroler}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: MyColor.myblue,
    child: ListView(
      children: [
        SizedBox(
            height: 100, width: 100, child: Image.asset('lib/assets/pic/splash.png')),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildEmailTextfeild(context, emailcontroller),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildPasswordTextfeild(context, passWordcontroler),
        ),
         const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(25),
          child: buildLoginButton(context , emailController:emailcontroller ,passwordontroller: passWordcontroler),
        )
      ],
    ),
  );
}

Widget buildEmailTextfeild(
    BuildContext context, TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    cursorColor: Colors.white,
    decoration:  InputDecoration(
        hintText: 'Email or Username'.translateex(context),
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        )),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  );
}

Widget buildPasswordTextfeild(
    BuildContext context, TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    cursorColor: Colors.white,
    decoration:  InputDecoration(
        hintText: 'password'.translateex(context),
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        )),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  );
  
}

buildLoginButton(BuildContext context,{ required  TextEditingController emailController ,required TextEditingController passwordontroller} ) {
  return Center(
    child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 100, 105, 118),
               
                textStyle: const TextStyle(
                fontSize: 22,
               )),
        child: Row(mainAxisAlignment: MainAxisAlignment.center ,
            children: [const Icon(Icons.login), const SizedBox(width: 10),  Text('LogIn'.translateex(context))]),
        onPressed: () {

context.read<LoginBloc>().add(UserLoginEvent(password:passwordontroller.text ,usernameoremail: emailController.text)) ;


        }),
  );
}


Widget buildLoadingState(BuildContext context ){
  Timer(Duration(seconds: 15), () {
  context.read<LoginBloc>().add(UserLogInEndTimeWaiting()) ;
  },) ;
  return   Container(height: double.infinity,width: double.infinity,color: 
  MyColor.myblue,child: Center(child: CircularProgressIndicator(color: Colors.white),)) ;
}




