import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';
import 'package:mbook2/post/post_data_layer/post_data_local/post_data_local.dart';
import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
import 'package:mbook2/post/post_data_layer/post_data_web/post_data_web.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:mbook2/post/post_domain_layer/post_domain_repositry/post_domain_repositery.dart';

class PostDataRepositery implements PostDomainRepositery {
  final PostDataWeb postDataWeb;
  final PostDataLocal postDataLocal;

  PostDataRepositery({required this.postDataWeb, required this.postDataLocal});

  @override
  Future<Either<PostFailuer, List<PostModel>>> getAllPosts() async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
       final posts = await postDataWeb.getAllPosts() ;
       if (posts.isNotEmpty) {
          postDataLocal.deletePOsts() ;
         for (var i = 0; i < posts.length; i++) {
          await postDataLocal.insertPosts(postModel: posts[i]) ;
           
         }
          return Right(posts); 
       } else {
         return Left(ServerFailuer()) ;
       }
 
      } on ServerException {
        return Left(ServerFailuer());
      }
    } else {
      List<PostModel> posts = await postDataLocal.getAllPosts();
      if (posts.isNotEmpty) {
        return Right(posts);
      } else {
        return Left(EmptyCashFailuer());
      }
    }
  }

  @override
  Future<Either<PostFailuer, Unit>> addPost(
      {required PostEntity postEntity}) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        return Right(await postDataWeb.addPost(
            postModel: PostModel(
                userId: postEntity.userId,
                id: postEntity.id,
                title: postEntity.title,
                body: postEntity.body)));
      } on ServerException {
        return Left(ServerFailuer());
      }
    } else {
      return Left(OffLineFailuer());
    }
  }

  @override
  Future<Either<PostFailuer, Unit>> deletePost({required int postId}) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        return Right(await postDataWeb.deletePost(postId: postId));
      } on ServerException {
        return Left(ServerFailuer());
      }
    } else {
      return Left(OffLineFailuer());
    }
  }

  @override
  Future<Either<PostFailuer, Unit>> updatePost(
      {required PostEntity postEntity}) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        return Right(
          await postDataWeb.updatePost(
            postModel: PostModel(
                userId: postEntity.userId,
                id: postEntity.id,
                title: postEntity.title,
                body: postEntity.body),
          ),
        );
      } on ServerException {
        return Left(ServerFailuer());
      }
    } else {
      return Left(OffLineFailuer());
    }
  }
}
