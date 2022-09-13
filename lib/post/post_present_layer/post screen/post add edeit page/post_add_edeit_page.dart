import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';

import '../../postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';
import 'post_add_ediet_page_widget.dart';

class PostAddEdeitPage extends StatelessWidget {
  final bool addorediet ; 
  final PostEntity? postEntity ; 
  const PostAddEdeitPage({Key? key, required this.addorediet, this.postEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController titlecontrol = TextEditingController(text: addorediet?null:postEntity!.title);
    TextEditingController bodycontroler = TextEditingController(text: addorediet?null:postEntity!.body); 
    return Scaffold(appBar: buildAppbarAddEdietPage(context,addorediet),
    body: BlocConsumer<PostAddEdeitBloc, PostAddEdeitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
      if (state is PostAddEdeitInitialState) {
      
       return   builBodyInitAddEdeitPage(context: context , titlecontroller:  titlecontrol ,
     bodycontroller:  bodycontroler,addorediet: addorediet , postEntity: postEntity ) ;
      } else  if (state is PostSucsessState){
       return buildDeatilsPageSucssesState(context);
      }    else  if (state is POstFailuerState){
    return buildDeatilsPageFailuerState(context,state.failuer.toString(),addorediet) ;
      } 

         return   builBodyInitAddEdeitPage(context: context , titlecontroller:  titlecontrol ,
     bodycontroller:  bodycontroler,addorediet: addorediet , postEntity: postEntity ) ;
      },
    )
    )  ;
  }
}


