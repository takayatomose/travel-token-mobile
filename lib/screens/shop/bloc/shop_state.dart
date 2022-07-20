part of 'shop_bloc.dart';

enum FetchStatus { initial, success, failure }

class ShopState {
  final FetchStatus fetchItemStatus;
  final FetchStatus fetchCategoryStatus;
  final List<Item> items;
  final List<Category> categories;
  final int selectedCategoryIndex;
  final bool hasReachedMax;
  final String sortText;

  ShopState({
    this.fetchItemStatus = FetchStatus.initial,
    this.fetchCategoryStatus = FetchStatus.initial,
    this.items = const <Item>[],
    this.selectedCategoryIndex = -1,
    this.categories = const <Category>[],
    this.hasReachedMax = false,
    this.sortText = '&orderBy=price&sort=ASC',
  });
  ShopState copyWith({
    FetchStatus? fetchCategoryStatus,
    FetchStatus? fetchItemStatus,
    List<Item>? items,
    List<Category>? categories,
    int? selectedCategoryIndex,
    bool? hasReachedMax,
    String? sortText,
  }) {
    return ShopState(
      fetchItemStatus: fetchItemStatus ?? this.fetchItemStatus,
      fetchCategoryStatus: fetchCategoryStatus ?? this.fetchCategoryStatus,
      items: items ?? this.items,
      categories: categories ?? this.categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      sortText: sortText ?? this.sortText,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "hasReachedMax : ${hasReachedMax}";
  }
}
