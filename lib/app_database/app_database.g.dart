// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PostDao? _postDaoInstance;
  // CommentDao? _commentDaoInstance;
  //
  // AlbumDao? _albumDaoInstance;
  //
  // PhotosDao? _photosDaoInstance;
  //
  // TodoDao? _todosInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PostModel` (`dbId` INTEGER PRIMARY KEY AUTOINCREMENT, `userId` INTEGER, `id` INTEGER, `title` TEXT, `body` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PostDao get postDao {
    return _postDaoInstance ??= _$PostDao(database, changeListener);
  }

  @override
  // TODO: implement albumpostDao
  AlbumDao get albumpostDao => throw UnimplementedError();

  @override
  // TODO: implement commentDao
  CommentDao get commentDao => throw UnimplementedError();

  @override
  // TODO: implement photopostDao
  PhotosDao get photopostDao => throw UnimplementedError();

  @override
  // TODO: implement todoDao
  TodoDao get todoDao => throw UnimplementedError();

  @override
  // TODO: implement photoDao
  PhotosDao get photoDao => throw UnimplementedError();
}

class _$PostDao extends PostDao {
  _$PostDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _postModelInsertionAdapter = InsertionAdapter(
            database,
            'PostModel',
            (PostModel item) => <String, Object?>{
                  'dbId': item.dbId,
                  'userId': item.userId,
                  'id': item.id,
                  'title': item.title,
                  'body': item.body
                }),
        _postModelUpdateAdapter = UpdateAdapter(
            database,
            'PostModel',
            ['dbId'],
            (PostModel item) => <String, Object?>{
                  'dbId': item.dbId,
                  'userId': item.userId,
                  'id': item.id,
                  'title': item.title,
                  'body': item.body
                }),
        _postModelDeletionAdapter = DeletionAdapter(
            database,
            'PostModel',
            ['dbId'],
            (PostModel item) => <String, Object?>{
                  'dbId': item.dbId,
                  'userId': item.userId,
                  'id': item.id,
                  'title': item.title,
                  'body': item.body
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PostModel> _postModelInsertionAdapter;

  final UpdateAdapter<PostModel> _postModelUpdateAdapter;

  final DeletionAdapter<PostModel> _postModelDeletionAdapter;

  @override
  Future<List<PostModel>> findAllPosts() async {
    return _queryAdapter.queryList('SELECT * FROM PostModel',
        mapper: (Map<String, Object?> row) => PostModel(
            userId: row['userId'] as int?,
            id: row['id'] as int?,
            title: row['title'] as String?,
            body: row['body'] as String?,
            dbId: row['dbId'] as int?));
  }

  @override
  Future<List<PostModel>> findPostsByName(String name) async {
    return _queryAdapter.queryList('SELECT * FROM PostModel WHERE name = ?1',
        mapper: (Map<String, Object?> row) => PostModel(
            userId: row['userId'] as int?,
            id: row['id'] as int?,
            title: row['title'] as String?,
            body: row['body'] as String?,
            dbId: row['dbId'] as int?),
        arguments: [name]);
  }

  @override
  Future<void> deleteAllPosts() async {
    await _queryAdapter.queryNoReturn('DELETE * FROM PostModel');
  }

  @override
  Future<void> insertPosts(PostModel post) async {
    await _postModelInsertionAdapter.insert(post, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPostsAllPosts(List<PostModel> posts) async {
    await _postModelInsertionAdapter.insertList(
        posts, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePosts(PostModel post) async {
    await _postModelUpdateAdapter.update(post, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePosts(PostModel post) async {
    await _postModelDeletionAdapter.delete(post);
  }
}
