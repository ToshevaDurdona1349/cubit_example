import 'package:floor/floor.dart';

import '../model/photos.dart';

@dao
abstract class PhotosDao {
  @Query("SELECT *FROM PhotosModel")
  Future<List<PhotosModel>> findALLPhotosModel();

  @Query("DELETE FROM PhotosModel")
  Future<void> deleteALLPhotosModel();

  @delete
  Future<void> deletePhotosModel(PhotosModel photosModel);

  @insert
  Future<void> insertAllPhotosModel(List<PhotosModel> photos);

  @insert
  Future<void> insertPhotosModel(PhotosModel photosModel);

  @update
  Future<void> updetePhotosModel(PhotosModel photosModel);
}
