
import 'package:floor/floor.dart';

import '../model/comments.dart';


@dao
abstract class CommentDao {
  @Query("SELECT * FROM CommentModel")
  Future<List<CommentModel>> findAllComment();

  @Query("SELECT * FROM CommentModel WHERE name = :name")
  Future<List<CommentModel>> findCommentByName(String name);

  @Query("DELETE FROM CommentModel")
  Future<void> deleteAllComment();

  @insert
  Future<void> insertComment(CommentModel commentModel);

  @insert
  Future<void> insertCommentAll(List<CommentModel> comments);

  @delete
  Future<void> deleteComment(CommentModel commentModel);

  @update
  Future<void> updateComment(CommentModel commentModel);
}