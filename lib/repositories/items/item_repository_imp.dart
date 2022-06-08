import 'dart:convert';
import 'dart:io';

import 'package:capgemini_flutter_bloc/errors/failure.dart';
import 'package:capgemini_flutter_bloc/models/item.dart';
import 'package:capgemini_flutter_bloc/repositories/items/item_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:http/http.dart' as http;

class ItemRepositoryImp implements ItemRepository {
  final http.Client client;

  const ItemRepositoryImp({
    required this.client,
  });

  @override
  Future<Result<Failure, List<Item>>> findItems() async {
    try {
      final response =
          await client.get(Uri.parse("http://localhost:3000/items"));
      List<Item> items = (jsonDecode(response.body) as List)
          .map((item) => Item.fromJson(item))
          .toList();
      return Success(items);
    } on SocketException {
      return Error(ServerFailure());
    }
  }
}
