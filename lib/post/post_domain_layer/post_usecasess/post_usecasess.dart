import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_domain_layer/post_domain_repositry/post_domain_repositery.dart';

class GetAllPOstUseCasess {
  final PostDomainRepositery postDomainRepositery;

  GetAllPOstUseCasess({required this.postDomainRepositery});

  Future<Either<PostFailuer, List<PostEntity>>> getAllPosts() async {
    return await postDomainRepositery.getAllPosts();
  }
}

class AddPOstUseCasess {
  final PostDomainRepositery postDomainRepositery;
  AddPOstUseCasess({required this.postDomainRepositery});

  Future<Either<PostFailuer, Unit>> addPost(
      {required PostEntity postEntity}) async {
    return await postDomainRepositery.addPost(postEntity: postEntity);
  }
}

class UpdatePOstUseCasess {
  final PostDomainRepositery postDomainRepositery;
  UpdatePOstUseCasess({required this.postDomainRepositery});

  Future<Either<PostFailuer, Unit>> updatePost(
      {required PostEntity postEntity}) async {
    return await postDomainRepositery.updatePost(postEntity: postEntity);
  }
}

class DeletePostUseCasess {
  final PostDomainRepositery postDomainRepositery;

  DeletePostUseCasess({required this.postDomainRepositery});

  Future<Either<PostFailuer, Unit>> call({required int postId}) async {
    return await postDomainRepositery.deletePost(postId: postId);
  }
}
