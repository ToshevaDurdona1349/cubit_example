
import 'package:floor/floor.dart';

import '../model/album.dart';

@dao
abstract class AlbumDao{
  @Query("SELECT * FROM AlbumModel")
  Future<List<AlbumModel>>readAllAlbumModel();

  @Query("DELETE * FROM AlbumModel")
  Future<List<AlbumModel>>deleteAllAlbumModel();

  @insert
  Future<void>insertAllAlbumModel(List<AlbumModel> albums);

  @insert
  Future<void>insertAlbumModel(AlbumModel albumModel);

  @delete
  Future<void>deleteAlbumModel(AlbumModel albumModel);

  @update
  Future<void>updeteAlbumModel(AlbumModel albumModel);



}
