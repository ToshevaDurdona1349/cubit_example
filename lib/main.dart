import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:cubit_example/cubit/cubit.dart';
import 'package:cubit_example/pages/page1.dart';
import 'package:cubit_example/pages/page2.dart';
import 'package:cubit_example/pages/page3.dart';
import 'package:cubit_example/pages/page4.dart';
import 'package:cubit_example/pages/page5.dart';
import 'package:cubit_example/repository/post_repository.dart';
import 'package:cubit_example/service/database_service.dart';
import 'package:cubit_example/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  CounterCubit
  counterCubit = CounterCubit(PostRepository(DatabaseService(),
      NetworkService()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)
    =>
    counterCubit
    ,
    child: DefaultTabController(
      initialIndex: 1,
    length: 5,
    child:Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black38,
    bottom: TabBar(
      isScrollable: true,
    tabs: [
    Tab(
    text: "Post",
    ),

    Tab(
    text: "Comment",
    ),
    Tab(
    text: "Album",
    ),
    Tab(
    text: "Photo",
    ),
      Tab(
        text: "Toto",
      ),
    ],
    ),
    ),
    body:TabBarView(children:[
     Page1(),
     Page2(),
     Page3(),
     Page4(),
     Page5(),
    ],
    ),
    ),
    ),
    );
}
}