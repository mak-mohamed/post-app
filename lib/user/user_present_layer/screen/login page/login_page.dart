import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/user/user_present_layer/bloc/login%20bloc/bloc/login_bloc.dart';
import 'package:mbook2/user/user_present_layer/screen/login%20page/login_page_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passwordcontroler = TextEditingController();
    return Scaffold(
     body : BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginsucsessState) {
            SnackBar sucsess = const SnackBar(
              content: Text('LogIn sucsessfly'),
              backgroundColor: Color.fromARGB(255, 90, 229, 95),
              duration: Duration(seconds: 3),
              padding: EdgeInsets.all(5),
            );
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(sucsess);
            Navigator.pushReplacementNamed(context, 'posts_page',
                arguments: state.user);
          } else if (state is UserLoginFailState) {

            SnackBar sucsess = SnackBar(
              content: Text(state.failmessage),
              backgroundColor: const Color.fromARGB(255, 223, 95, 81),
              duration: const Duration(seconds: 3),
              padding: const EdgeInsets.all(5),
            );
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(sucsess);
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return buildBodyLogIn(context,
                emailcontroller: emailcontroler,
                passWordcontroler: passwordcontroler);
          } else if (state is UserLoginLoadingState) {
   
        return    buildLoadingState(context);
          }
         else if (state is UserLoginFailState ){
           return buildBodyLogIn(context,
              emailcontroller: emailcontroler,
              passWordcontroler: passwordcontroler);}
          return    buildLoadingState(context);    
        },
      ),
    );
  }
}
