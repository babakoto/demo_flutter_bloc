import 'package:capgemini_flutter_bloc/models/item.dart';
import 'package:capgemini_flutter_bloc/repositories/items/item_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;
  ItemBloc({required this.repository})
      : super(const ItemState(
          items: [],
          status: ItemStatus.init,
        )) {
    on<OnFindItems>(_onFindItems);
  }

  Future<void> _onFindItems(
    OnFindItems event,
    Emitter<ItemState> emit,
  ) async {
    emit(state.copyWith(status: ItemStatus.loading));
    final result = await repository.findItems();
    if (result.isSuccess()) {
      emit(state.copyWith(status: ItemStatus.loaded, items: result.get()));
    } else {
      emit(state.copyWith(status: ItemStatus.serverError));
    }
  }
}
