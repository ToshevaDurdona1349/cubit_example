
import 'package:cubit_example/model/album.dart';
import 'package:cubit_example/model/comments.dart';
import 'package:cubit_example/model/photos.dart';
import 'package:cubit_example/model/post_model.dart';
import 'package:cubit_example/model/todos.dart';
import 'package:cubit_example/service/database_service.dart';
import 'package:cubit_example/service/network_service.dart';


class PostRepository {
  final DatabaseService databaseService;
  final NetworkService networkService;

  PostRepository(this.databaseService, this.networkService);

////bu Post
  Future<List<PostModel>> getAllPost() async {
    List<PostModel>? list = await networkService.getPostModel();
    if (list != null) {
      databaseService.deleteAllPosts();
      databaseService.insertPostsAllPosts(list);
    } else {
      list = await databaseService.findAllPostModel();
    }
    return list;
  }
  //bu comment
  Future<List<CommentModel>> getAllComment() async {
    List<CommentModel>? list = await networkService.getCommentModel();
    if (list != null) {
      databaseService.deleteAllComment();
      databaseService.insertCommentAllPosts(list);
    } else {
      list = await databaseService.findAllCommentModel();
    }
    return list;
  }

// Album uchun
  Future<List<AlbumModel>> getAllAlbum() async {
    List<AlbumModel>? list = await networkService.getAlbumModel();
    if (list != null) {
      databaseService.deleteAllAlbum();
      databaseService.insertAllAlbumModel(list);
    } else {
      list = await databaseService.findAllAlbumModel();
    }
    return list;
  }

  //bu Photos
  Future<List<PhotosModel>> getAllPhotos() async {
    List<PhotosModel>? list = await networkService.getPhotosModel();
    if (list != null) {
      databaseService.deleteAllPhotosModel();
      databaseService.insertAllPhotosModel(list);
    } else {
      list = await databaseService.findAllPhotosModel();
    }
    return list;
  }

//todos
  Future<List<TodosModel>> getAllTodos() async {
    List<TodosModel>? list = await networkService.getTodosModel();
    if (list != null) {
      databaseService.deleteAllTodo();
      databaseService.inserAllTodosModel(list);
    } else {
      list = await databaseService.findAllTodosModel();
    }
    return list;
  }

}

