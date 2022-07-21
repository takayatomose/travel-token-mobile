part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class FetchItems extends ShopEvent {}

class FetchCategories extends ShopEvent {}

class SelectCategory extends ShopEvent {
  final int selectedCategoryIndex;

  SelectCategory(this.selectedCategoryIndex);
}

class SelectSortText extends ShopEvent {
  final String selectSortText;

  SelectSortText(this.selectSortText);
}
class BuyItem extends ShopEvent {
  final int itemId;
  BuyItem({required this.itemId});
}

