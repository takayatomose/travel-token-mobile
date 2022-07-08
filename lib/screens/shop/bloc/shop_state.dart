part of 'shop_bloc.dart';

enum FetchStatus { initial, success, failure }

class ShopState {
  final FetchStatus fetchItemStatus;
  final FetchStatus fetchCategoryStatus;
  final List<Item> items;
  final List<Category> categories;
  final int selectedCategoryIndex;
  final bool hasReachedMax;

  ShopState({
    this.fetchItemStatus = FetchStatus.initial,
    this.fetchCategoryStatus = FetchStatus.initial,
    this.items = const <Item>[],
    this.selectedCategoryIndex = -1,
    this.categories = const <Category>[],
    this.hasReachedMax = false,
  });
  ShopState copyWith({
    FetchStatus? fetchCategoryStatus,
    FetchStatus? fetchItemStatus,
    List<Item>? items,
    List<Category>? categories,
    int? selectedCategoryIndex,
    bool? hasReachedMax,
  }) {
    return ShopState(
      fetchItemStatus: fetchItemStatus ?? this.fetchItemStatus,
      fetchCategoryStatus: fetchCategoryStatus ?? this.fetchCategoryStatus,
      items: items ?? this.items,
      categories: categories ?? this.categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "hasReachedMax : ${hasReachedMax}";
  }
}
