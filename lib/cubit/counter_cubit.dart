
import 'package:bloc/bloc.dart';
import 'package:cubit_example/model/album.dart';
import 'package:cubit_example/model/comments.dart';
import 'package:cubit_example/model/photos.dart';
import 'package:cubit_example/model/post_model.dart';
import 'package:cubit_example/model/todos.dart';
import 'package:cubit_example/repository/post_repository.dart';

class CounterState{
  final List<PostModel>? posts;
  final List<CommentModel>? comments;
  final List<AlbumModel>? albums;
  final List<PhotosModel>? photos;
  final List<TodosModel>? todos;
  final bool?isLoding;


  CounterState( {this.posts,
    this.isLoding,
    this.comments,
    this.albums,
    this.photos,this.todos});

  CounterState copyWith(
      {List<PostModel>? posts,
        List<CommentModel>? comments,
        List<AlbumModel>? albums,
        List<PhotosModel>? photos,
        List<TodosModel>? todos,
        bool?isLoding}){
    return CounterState(
        posts: posts??this.posts,
        comments:comments??this.comments,
        albums:albums??this.albums,
        photos:photos??this.photos,
        todos:todos??this.todos,
        isLoding: isLoding??this.isLoding);
  }
}