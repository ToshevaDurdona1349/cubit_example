import 'package:cubit_example/model/post_model.dart';
import 'package:floor/floor.dart';


@dao
abstract class PostDao {
  @Query("SELECT * FROM PostModel")
  Future<List<PostModel>> findAllPosts();

  @Query("SELECT * FROM PostModel WHERE name = :name")
  Future<List<PostModel>> findPostsByName(String name);

  @Query("DELETE * FROM PostModel ")
  Future<void> deleteAllPosts();

  @insert
  Future<void> insertPosts(PostModel post);

  @insert
  Future<void> insertPostsAllPosts(List<PostModel> posts);

  @delete
  Future<void> deletePosts(PostModel post);

  @update
  Future<void> updatePosts(PostModel post);
}
