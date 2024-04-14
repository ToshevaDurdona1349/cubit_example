import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      bloc: context.read<CounterCubit>()..getComments(),
      builder: (context, state) {
        print(state);
        return Scaffold(
          body: Center(
            child: (state.isLoding ?? true)
                ? CircularProgressIndicator()
                : RefreshIndicator(
              onRefresh: () async {
                context.read<CounterCubit>().getPosts();
              },
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Text(state.comments![index].name ?? "");
                },
                itemCount: state.comments?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ),

        );
      },
    );
  }
}
