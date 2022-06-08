import 'package:capgemini_flutter_bloc/views/items/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ItemBloc, ItemState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == ItemStatus.loading) {
              return Center(child: Text("Loading"));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ItemBloc>().add(OnFindItems());
                },
                child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, int index) {
                      return ListTile(title: Text(state.items[index].name));
                    }),
              );
            }
          }),
    );
  }
}
