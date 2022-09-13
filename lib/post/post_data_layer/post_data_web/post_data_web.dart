import 'package:dartz/dartz.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';

import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';

class PostDataWeb {
  final String endpoint = 'https://jsonplaceholder.typicode.com/posts/';

  Future<List<PostModel>> getAllPosts() async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
 
      return list
          .map((e) => PostModel(
              userId: e['userId'],
              id: e['id'],
              title: e['title'],
              body: e['body']))
          .toList();
    } else {
      return throw ServerException();
    }
  }

  Future<Unit> addPost({required PostModel postModel}) async {
    final response = await http.post(Uri.parse(endpoint),
        body: jsonEncode(postModel.toJson(postModel)),
        headers: {
         'Content-type': 'application/json; charset=UTF-8',
        }
       );

    if (response.statusCode == 201) {
      print('on add post and return unit');
      return unit;
    } else {
      throw ServerException();
    }
  }

  Future<Unit> updatePost({required PostModel postModel}) async {
    int postid = postModel.id!;
    final response = await http.put(Uri.parse(endpoint + postid.toString()),
        body: jsonEncode(postModel.toJson(postModel)),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return unit;
    }
    throw ServerException();
  }

  Future<Unit> deletePost({required int postId}) async {
    String id = postId.toString();
    final response = await http.delete(Uri.parse(endpoint + id));
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}
