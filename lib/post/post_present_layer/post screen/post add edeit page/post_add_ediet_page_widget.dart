// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/core/localization/applocalization.dart';

import '../../postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';

AppBar buildAppbarAddEdietPage(BuildContext context, bool addorediet) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
        addorediet ? 'add_page_title'.translateex(context) : 'edeit_page_title'.translateex(context)),
    backgroundColor: MyColor.myblue,
    actions: [Image.asset('lib/assets/pic/splash.png')],
  );
}

Widget builBodyInitAddEdeitPage(
    {required BuildContext context,
    required TextEditingController titlecontroller,
    required TextEditingController bodycontroller,
    required bool addorediet,
    required PostEntity? postEntity}) {
  // ignore: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
  return Container(
    child: ListView(children: [
      const SizedBox(
        height: 15,
      ),
      //? post title text edieting /////////////////////////////
      Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: titlecontroller,
          minLines: 3,
          maxLines: 6,
          decoration: InputDecoration(
              hintText: 'title'.translateex(context),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      const SizedBox(
        height: 15,
      ),

      //? ppost pody text edieting /////////////////////////////
      Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: bodycontroller,
          minLines: 6,
          maxLines: 12,
          decoration: InputDecoration(
              label:  Text('body'.translateex(context)),
              hintText: 'body'.translateex(context),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),

      //? build button /////////////////////////////////////

      Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Center(
          child: RaisedButton(
              onPressed: () {
                if (addorediet) {
                  context.read<PostAddEdeitBloc>().add(
                        PostAddEvent(
                          postEntity: PostEntity(
                              id: 101,
                              userId: 1,
                              title: titlecontroller.text,
                              body: bodycontroller.text),
                        ),
                      );
                } else {
                 
                  context
                      .read<PostAddEdeitBloc>()
                      .add(PostEdeitEvent(postEntity: postEntity!));
                }
              },
              color: const Color.fromARGB(255, 135, 236, 98),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(addorediet ? Icons.add : Icons.edit_note),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(addorediet ? 'addbutton'.translateex(context) : 'edeitbutton'.translateex(context))
                ],
              )),
        ),
      )
    ]),
  );
}

Widget buildDeatilsPageFailuerState(
    BuildContext context, String failuer, bool addoredeit) {
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
            style: const TextStyle(
                color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
          child: Center(
            child: RaisedButton(
                onPressed: () {
                  context
                      .read<PostAddEdeitBloc>()
                      .add(PostAddEdietInitialEvent());
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

Widget buildDeatilsPageSucssesState(BuildContext context) {
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
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
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
