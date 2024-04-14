import 'dart:js_interop';

import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      bloc: context.read<CounterCubit>()..getPosts(),
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
                  return Text(state.posts![index].runtimeType.toString() );
                },
                itemCount: state.posts?.length ?? 0,
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
