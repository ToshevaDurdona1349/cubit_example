import 'package:dio/dio.dart';

import '../model/album.dart';
import '../model/comments.dart';
import '../model/photos.dart';
import '../model/post_model.dart';
import '../model/todos.dart';

class NetworkService {
  static final NetworkService _networkService = NetworkService._internal();

  factory NetworkService() {
    return _networkService;
  }

  NetworkService._internal();

  final _dio = Dio();

//Post uchun
  Future<List<PostModel>?> getPostModel() async {
    // _dio.interceptors.add(alice.getDioInterceptor());
    try {
      var response =
      await _dio.get("https://jsonplaceholder.typicode.com/posts");

      List<PostModel> postModelList = [];

      for (var element in (response.data as List)) {
        postModelList.add(PostModel.fromJson(element));
      }

      return postModelList;
    } catch (e) {
      print(e);
      return null;
    }
  }
  //bu Comment uchun

  Future<List<CommentModel>?> getCommentModel() async {
    // _dio.interceptors.add(alice.getDioInterceptor());
    try {
      var response =
      await _dio.get("https://jsonplaceholder.typicode.com/comments");

      List<CommentModel> commentList = [];

      for (var element in (response.data as List)) {
        commentList.add(CommentModel.fromJson(element));
      }

      return commentList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //bu Album uchun
  Future<List<AlbumModel>?> getAlbumModel() async {
    try {
      var response =
      await _dio.get("https://jsonplaceholder.typicode.com/albums");

      List<AlbumModel> albumlList = [];

      for (var element in (response.data as List)) {
        albumlList.add(AlbumModel.fromJson(element));
      }

      return albumlList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Photos uchun
  Future<List<PhotosModel>?> getPhotosModel() async {
    try {
      var response =
      await _dio.get("https://jsonplaceholder.typicode.com/photos"); //bu malumotni o'qib olish
      List<PhotosModel> photosList = [];
      for (var element in (response.data as List)) {
        photosList.add(PhotosModel.fromJson(element));//bu json malumotni dartga o'girib olish
      }
      return photosList;
    } catch (e) {
      return null;
    }
  }

  //todos
  Future<List<TodosModel>?> getTodosModel() async {
    try {
      var response =
      await _dio.get("https://jsonplaceholder.typicode.com/todos");

      List<TodosModel> todoslList = [];

      for (var element in (response.data as List)) {
        todoslList.add(TodosModel.fromJson(element));
      }

      return todoslList;
    } catch (e) {
      print(e);
      return null;
    }
  }

}