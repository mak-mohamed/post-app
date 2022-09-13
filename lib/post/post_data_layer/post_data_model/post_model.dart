import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';

class PostModel extends PostEntity {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body})
      : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson(PostModel postModel) {
    return {
      'id': postModel.id,
      'userId': postModel.userId,
      'title': postModel.title,
      'body': postModel.body,
    };
  }
}
