import 'package:bloc/bloc.dart';
import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:cubit_example/model/album.dart';
import 'package:cubit_example/model/photos.dart';
import 'package:cubit_example/model/todos.dart';
import 'package:cubit_example/repository/post_repository.dart';
import '../model/comments.dart';
import '../model/post_model.dart';


class CounterCubit extends Cubit<CounterState>{
 CounterCubit(this.postRepository):super(CounterState());
 PostRepository postRepository;

 getPosts()async{
   emit(state.copyWith(isLoding: true));
   List<PostModel> list=await postRepository.getAllPost();
   emit(state.copyWith(isLoding: false,posts: list));

 }
 getComments()async{
   emit(state.copyWith(isLoding: true));
   List<CommentModel> list=await postRepository.getAllComment();
   emit(state.copyWith(isLoding: false,comments: list));
 }
 getAlbums()async{
   emit(state.copyWith(isLoding: true));
   List<AlbumModel> list=await postRepository.getAllAlbum();
   emit(state.copyWith(isLoding: false,albums: list));
 }
 getPhotos()async{
   emit(state.copyWith(isLoding: true));
   List<PhotosModel> list=await postRepository.getAllPhotos();
   emit(state.copyWith(isLoding: false,photos: list));
 }
 getTodos()async{
   emit(state.copyWith(isLoding: true));
   List<TodosModel> list=await postRepository.getAllTodos();
   emit(state.copyWith(isLoding: false,todos: list));
 }

}