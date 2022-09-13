// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';
import 'package:mbook2/core/localization/applocalization.dart';
import 'package:mbook2/core/localization/localization_shared_prefrencess/localization_sharedpref.dart';

Widget buildLoadinState(BuildContext context) {
  return Center(
    child: Image.asset(
      'lib/assets/pic/loading.gif',
      height: 50,
      width: 50,
    ),
  );
}

Widget buildLoadedState(BuildContext context, List<PostEntity> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //   width: double.infinity,
          // height: double.infinity,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Column(children: [
                InkWell(
                  child: ListTile(
                    leading: Text(posts[index].id.toString()),
                    title: Text(posts[index].title.toString()),
                    subtitle: Text(posts[index].body.toString()),
                  ),
                  onTap: () {Navigator.of(context).pushNamed('deatils_page',arguments: posts[index]);},
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        function: () {},
                        height: 30,
                        textbutton: 'like'.translateex(context)),
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        function: () {},
                        height: 30,
                        textbutton: 'comment'.translateex(context)),
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        height: 30,
                        function: () {},
                        textbutton:'share'.translateex(context)),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        );
      });
}

Widget buildPostPageFailuerState(BuildContext context, String failuer) {

  return Container(
    color: Color.fromRGBO(254, 252, 252, 1),
    child: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Image(
          image: AssetImage('lib/assets/pic/ok.gif'),
          height: 200,
          width: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            failuer,
            style:
                TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(40, 5, 40, 0),
          child: Center(
            child: RaisedButton(
                onPressed: () {
                  context.read<PostgetBloc>().add(PostGetPostsEvent());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(Icons.error),
                    SizedBox(
                      width: 10,
                    ),
                    Text('ok'.translateex(context))
                  ],
                )),
          ),
        )
      ],
    ),
  );
}

Widget buildPostPageSucssesState(BuildContext context) {
  return Container(
    color: Color.fromRGBO(250, 250, 250, 250),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset('lib/assets/pic/ok.gif'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  color: Colors.green[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Icon(Icons.done),
                      Text('ok'.translateex(context))
                    ],
                  ),
                )),
          )
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget MyDrawer(UserEntity user ,BuildContext context  ) {
  String lang = '' ;

  return Drawer(
    // ignore: prefer_const_literals_to_create_immutables
    child: ListView(children: [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Color.fromARGB(255, 13, 56, 92)),
        accountName: Text(user.username.toString()),
        accountEmail: Text(user.email.toString()),
        currentAccountPicture: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('lib/assets/pic/splash.png'),
        ),
      ),
      ExpansionTile(title: Text('Language'.translateex(context)), 
      children: [
        ListTile(leading: Radio(value: 'en', groupValue: lang, onChanged: (String){ lang= 'en' ;    LocalizationSharedPreferncess.saveUserData('en'); }),onTap: (){lang = 'en' ;},title: Text('English'.translateex(context)),),
         ListTile(leading: Radio(value: 'ar', groupValue: lang, onChanged: (String){  lang= 'ar' ;  LocalizationSharedPreferncess.saveUserData('ar'); }),onTap: (){},title: Text('Arabic'.translateex(context)),)
      ]),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text('About Us'.translateex(context)),
      )
    ]),
  );
}

AppBar buildAppbar(BuildContext context , UserEntity user) {
  return AppBar(
    title:  Text("post_page".translateex(context)),
    backgroundColor: MyColor.myblue,

 actions: [  Container( child: Image.asset('lib/assets/pic/splash.png'),)],
    
  );
}

Widget itemtButton(
    {required int flex,
    required double height,
    required void Function()? function,
    required String textbutton}) {
  return Flexible(
      flex: flex,
      child: Container(
          height: height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 228, 225, 240),
            ),
            onPressed: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textbutton,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                )
              ],
            ),
          )));
}
  InkWell buildFloatingBtn(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.of(context).pushNamed('add_page') ;
    },
        child: FloatingActionButton(onPressed: (){Navigator.of(context).pushNamed('add_page');},backgroundColor: MyColor.myblue, child: Icon(Icons.add)),
      
      );
  }

  Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:  Text('Back'.translateex(context)),
                content:  Text('Are you sure you want to go back?'.translateex(context)),
                actions: [
                  TextButton(
                    onPressed: () {
  Future<bool> onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:  Text('Exit'.translateex(context)),
                content:  Text('Are you sure you want to exit ?'.translateex(context)),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }, //<-- SEE HERE
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }, //<-- SEE HERE
                    child:  Text('Yes'.translateex(context)),
                  ),
                ],
              );
            }) ??
        false);
  }
  

                      Navigator.of(context).pop(false);
                    }, //<-- SEE HERE
                    child: Text('No'.translateex(context)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }, //<-- SEE HERE
                    child:  Text('Yes'.translateex(context)),
                  ),
                ],
              );
            }) ??
        false);
  }
