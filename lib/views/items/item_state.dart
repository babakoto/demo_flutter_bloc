part of 'item_bloc.dart';

enum ItemStatus {
  init("Message init"),
  loading("Loading"),
  loaded("Message loaded"),
  serverError("Server down");

  final String message;

  const ItemStatus(this.message);
}

class ItemState extends Equatable {
  final List<Item> items;
  final ItemStatus status;

  ItemState copyWith({
    List<Item>? items,
    ItemStatus? status,
  }) {
    return ItemState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  const ItemState({
    required this.items,
    required this.status,
  });

  @override
  List<Object> get props => [items, status];
}
