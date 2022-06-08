import 'package:capgemini_flutter_bloc/injections.dart';
import 'package:capgemini_flutter_bloc/repositories/items/item_repository.dart';
import 'package:capgemini_flutter_bloc/sigle_observer.dart';
import 'package:capgemini_flutter_bloc/views/app.dart';
import 'package:capgemini_flutter_bloc/views/items/item_bloc.dart';
import 'package:capgemini_flutter_bloc/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => context.read<ItemBloc>()..add(OnFindItems()))
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
