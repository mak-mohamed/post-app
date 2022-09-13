import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';

abstract class PostDomainRepositery {
  Future<Either<PostFailuer, List<PostEntity>>> getAllPosts() {  throw UnimplementedError();}
  Future<Either<PostFailuer, Unit>> addPost ({required PostEntity postEntity}) { throw UnimplementedError();}
  Future<Either<PostFailuer, Unit>> updatePost({required PostEntity postEntity}) { throw UnimplementedError();}
  Future<Either<PostFailuer, Unit>> deletePost({required int postId}) { throw UnimplementedError();}
}
