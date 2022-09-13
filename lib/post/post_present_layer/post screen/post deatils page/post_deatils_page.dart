// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_present_layer/post%20screen/post%20deatils%20page/post_Deatils_Widget.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';

class PostDeatilsPage extends StatelessWidget {
  
  final bool userpostorno;
  final PostEntity postEntity;
   PostDeatilsPage(
      {required this.postEntity, required this.userpostorno})
      : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbarDeatilsPage(context),
      body: BlocConsumer<PostAddEdeitBloc,PostAddEdeitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is PostDeatilsInitialState) {
            return buildBody(context:context ,postEntity:postEntity ,state: state  ,userpostorno:userpostorno );
            
          } else if (state is PostSucsessState) {
            return buildDeatilsPageSucssesState(context);
            
          } else if (state is POstFailuerState) {
            return buildDeatilsPageFailuerState(context , state.failuer.runtimeType.toString()); 
          // ignore: curly_braces_in_flow_control_structures
          } else return buildBody(context:context ,postEntity:postEntity ,state: PostDeatilsInitialState()   ,userpostorno:userpostorno );
        
        },
      ),
    );
  }
}




