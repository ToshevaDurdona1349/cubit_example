
import 'package:cubit_example/dao/album_dao.dart';
import 'package:cubit_example/dao/comment.dart';
import 'package:cubit_example/dao/photo_dao.dart';
import 'package:cubit_example/dao/post_dao.dart';
import 'package:cubit_example/dao/todo.dart';
import 'package:cubit_example/model/album.dart';
import 'package:cubit_example/model/comments.dart';
import 'package:cubit_example/model/photos.dart';
import 'package:cubit_example/model/post_model.dart';
import 'package:cubit_example/model/todos.dart';
import 'package:floor/floor.dart';

// database.dart

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities:
[PostModel,CommentModel,AlbumModel,PhotosModel,TodosModel])
abstract class AppDatabase extends FloorDatabase {
  PostDao get postDao;
  CommentDao get commentDao;
  AlbumDao get albumpostDao;
  PhotosDao get photoDao;
  TodoDao get todoDao;
}
