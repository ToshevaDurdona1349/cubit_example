
import 'package:cubit_example/app_database/app_database.dart';
import 'package:cubit_example/model/album.dart';
import 'package:cubit_example/model/comments.dart';
import 'package:cubit_example/model/photos.dart';
import 'package:cubit_example/model/post_model.dart';
import 'package:cubit_example/model/todos.dart';


class DatabaseService {
  static final DatabaseService _networkService = DatabaseService._internal();

  factory DatabaseService() {
    return _networkService;
  }

  DatabaseService._internal();

  late AppDatabase _database;

  Future initDB() async {
    _database =
    await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  /// posts uchun
  ///
  ///
  Future<List<PostModel>> findAllPostModel() async {
    return await _database.postDao.findAllPosts();
  }
  Future<List<PostModel>> findPostModelByName(String name) async {
    return await _database.postDao.findPostsByName(name);
  }
  Future<void> insertPostModel(PostModel personModel) async {
    return await _database.postDao.insertPosts(personModel);
  }
  Future<void> insertPostsAllPosts(List<PostModel> personModel) async {
    return await _database.postDao.insertPostsAllPosts(personModel);
  }
  Future<void> deletePostModel(PostModel personModel) async {
    return await _database.postDao.deletePosts(personModel);
  }

  Future<void> deleteAllPosts() async {
    return await _database.postDao.deleteAllPosts();
  }
  /// comments uchun

  Future<List<CommentModel>> findAllCommentModel() async {
    return await _database.commentDao.findAllComment();
  }


  Future<List<CommentModel>> findCommentModelByName(String name) async {
    return await _database.commentDao.findCommentByName(name);
  }

  Future<void> insertCommentModel(CommentModel commentModel) async {
    return await _database.commentDao.insertComment(commentModel);
  }

  Future<void> insertCommentAllPosts(List<CommentModel> commentModel) async {
    return await _database.commentDao.insertCommentAll(commentModel);
  }

  Future<void> deleteCommentModel(CommentModel commentModel) async {
    return await _database.commentDao.deleteComment(commentModel);
  }

  Future<void> deleteAllComment() async {
    return await _database.commentDao.deleteAllComment();

  }
 
  ///bu album
  ///
  ///
  Future<List<AlbumModel>> findAllAlbumModel() async {
    return await _database.albumpostDao.readAllAlbumModel();
  }

  Future<void> insertAlbumModel(AlbumModel albumModel) async {
    return await _database.albumpostDao.insertAlbumModel(albumModel);
  }

  Future<void> insertAllAlbumModel(List<AlbumModel> albumModel) async {
    return await _database.albumpostDao.insertAllAlbumModel(albumModel);
  }

  Future<void> deleteAlbumModel(AlbumModel albumModel) async {
    return await _database.albumpostDao.deleteAlbumModel(albumModel);
  }

  Future<List<AlbumModel>> deleteAllAlbum() async {
    return await _database.albumpostDao.deleteAllAlbumModel();
  }
  // photos



  Future<List<PhotosModel>> findAllPhotosModel() async {
    return await _database.photoDao.findALLPhotosModel();
  }


  Future<void> insertPhotosModel(PhotosModel photosModel) async {
    try {
      await _database.photoDao.insertPhotosModel(photosModel);
    } catch (e) {
      print('Error inserting PhotosModel: $e');
    }
  }

  Future<void> insertAllPhotosModel(List<PhotosModel> photos) async {
    return await _database.photoDao.insertAllPhotosModel(photos);
  }

  Future<void> deletePhotosModel(PhotosModel photosModel) async {
    return await _database.photoDao.deletePhotosModel(photosModel);
  }

  Future<void> deleteAllPhotosModel() async {
    return await _database.photoDao.deleteALLPhotosModel();
  }

  ///todos

  Future<List<TodosModel>> findAllTodosModel() async {
    return await _database.todoDao.findAllTodo();
  }

  Future<void> insertTodosModel(TodosModel todosModel) async {
    return await _database.todoDao.insertTodo(todosModel);
  }

  Future<void> inserAllTodosModel(List<TodosModel> todomodel) async {
    return await _database.todoDao.insertTodoAll(todomodel);
  }

  Future<void> deleteTodosModel(TodosModel todosModel) async {
    return await _database.todoDao.deleteTodo(todosModel);
  }

  Future<void> deleteAllTodo() async {
    return await _database.todoDao.deleteAllTodo();
  }

}