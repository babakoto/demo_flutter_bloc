import 'package:capgemini_flutter_bloc/errors/failure.dart';
import 'package:capgemini_flutter_bloc/models/item.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ItemRepository {
  Future<Result<Failure, List<Item>>> findItems();
}
