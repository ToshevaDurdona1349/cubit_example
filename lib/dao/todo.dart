import 'package:floor/floor.dart';

import '../model/todos.dart';

@dao
abstract class TodoDao{
  @Query("SELECT * FROM TodosModel")
  Future<List<TodosModel>> findAllTodo();


  @Query("DELETE * FROM TodosModel ")
  Future<void> deleteAllTodo();

  @insert
  Future<void> insertTodo(TodosModel todosModel);

  @insert
  Future<void> insertTodoAll(List<TodosModel> todos);

  @delete
  Future<void> deleteTodo(TodosModel todosModel);

  @update
  Future<void> updateTodo(TodosModel todosModel);
}