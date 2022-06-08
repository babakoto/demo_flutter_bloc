import 'package:capgemini_flutter_bloc/repositories/items/item_repository.dart';
import 'package:capgemini_flutter_bloc/repositories/items/item_repository_imp.dart';
import 'package:capgemini_flutter_bloc/views/items/item_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

final List<RepositoryProvider> repositories = [
  RepositoryProvider<ItemRepository>(
    create: (context) => ItemRepositoryImp(
      client: http.Client(),
    ),
  ),
  RepositoryProvider<ItemBloc>(
    create: (context) => ItemBloc(repository: context.read<ItemRepository>()),
  ),
];
