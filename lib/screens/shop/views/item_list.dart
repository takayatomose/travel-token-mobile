import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        switch (state.fetchItemStatus) {
          case FetchStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case FetchStatus.success:
            if (state.items.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return GridView.builder(
              padding: EdgeInsets.only(right: 20, left: 20),
              itemBuilder: (BuildContext context, int index) {
                return index >= state.items.length
                    ? BottomLoader()
                    : ShopItem(item: state.items[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.items.length
                  : state.items.length + 1,
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                 crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 158/206
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ShopBloc>().add(FetchItems());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
