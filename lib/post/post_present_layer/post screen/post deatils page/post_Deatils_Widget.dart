// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';
import 'package:mbook2/core/localization/applocalization.dart';

import '../../../../core/constant/mycolor.dart';

AppBar buildAppbarDeatilsPage(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title:  Text("Mdeatils_page_title".translateex(context)),
    backgroundColor: MyColor.myblue,
    actions: [Image.asset('lib/assets/pic/splash.png')],
  );
}

Widget buildBody ({required BuildContext context ,required PostDeatilsInitialState state ,required PostEntity postEntity ,required bool userpostorno}){
  return Container(
        color: Colors.white,
        child: ListView(children: [
          buildTitle(context, postEntity),
          buildPOstBodyDeatilsPage(context, postEntity),
          userpostorno?buildEdietDeleteButton(context,postId: postEntity.id,postEntity: postEntity):const SizedBox(),
          buildBackButtom(context),
        ]),
      );
}


Widget buildTitle(BuildContext context, PostEntity postEntity) {
  // ignore: prefer_const_literals_to_create_immutables
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       const SizedBox(
        height: 10,
      ),
       Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('title'.translateex(context)     ,
        
        
            style: const TextStyle(
                color: MyColor.myblue,
                fontSize: 24,
                fontWeight: FontWeight.bold),
                ),
      ),
      const Divider(
          color: Color.fromARGB(255, 138, 45, 14),
          thickness: 4,
          endIndent: 200,
          height: 2),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(postEntity.title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

Widget buildPOstBodyDeatilsPage(BuildContext context, PostEntity postEntity) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 5,
      ),
       Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('body'.translateex(context),
            style: const TextStyle(
                color: MyColor.myblue,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      const Divider(
          color: Color.fromARGB(255, 138, 45, 14),
          thickness: 4,
          endIndent: 50,
          height: 2),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(postEntity.body!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      )
    ],
  );
}

Widget buildEdietDeleteButton(BuildContext context , {required int? postId , required PostEntity postEntity}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
//? edeit buttom//////////////////////////////////////////////////////////////////
        Padding(
    padding: const EdgeInsets.all(10),
    child: RaisedButton(
        color: const Color.fromARGB(197, 88, 127, 171),
        onPressed: () {
          context.read<PostAddEdeitBloc>().add(PostAddEdietInitialEvent()) ;     
         Navigator.of(context).pushNamed('ediet_page', arguments:postEntity );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.edit),
            const SizedBox(
              width: 8,
            ),
             Text('edeitbutton'.translateex(context)),
          ],
        )),
  ) ,

//? delete buttom ////////////////////////////////////////////////////////////////
  Padding(
    padding: const EdgeInsets.all(10),
    child: RaisedButton(
        color: const Color.fromARGB(197, 217, 97, 97),
        onPressed: () {
         context.read<PostAddEdeitBloc>().add(POstDeleteEvent(postId:postId!));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.delete_outline_rounded),
            const SizedBox(
              width: 8,
            ),
             Text('deletebutton'.translateex(context)),
          ],
        )),
  )
      ],
    ),
  );
}

Widget buildBackButtom(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: RaisedButton(
        color: const Color.fromARGB(198, 80, 143, 114),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.arrow_back),
            const SizedBox(
              width: 8,
            ),
             Text('backbutton'.translateex(context)),
          ],
        )),
  );
}



Widget buildDeatilsPageFailuerState(BuildContext context, String failuer) {
  // ignore: prefer_const_literals_to_create_immutables
  return Container(
    color: const Color.fromRGBO(254, 252, 252, 1),
    child: ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Image(
          image: AssetImage('lib/assets/pic/ok.gif'),
          height: 200,
          width: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            failuer,
            style:
                const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
          child: Center(
            child: RaisedButton(
                onPressed: () {
                  context.read<PostAddEdeitBloc>().add(PostDetailsIntialEvent());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(Icons.error),
                    const SizedBox(
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

Widget buildDeatilsPageSucssesState(BuildContext context ) {
  return Container(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset('lib/assets/pic/ok.gif'),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary:  Colors.green[400]),
                onPressed: () {
                  Navigator.of(context).pop();
                //  Navigator.of(context).popAndPushNamed('posts_page');
                },
                child: Container(
                  color: Colors.green[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Icon(Icons.done),
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
