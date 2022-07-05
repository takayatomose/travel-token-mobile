part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class FetchItems extends ShopEvent {}

class FetchCategories extends ShopEvent {}

class SelectCategory extends ShopEvent {
  final int selectedCategoryIndex;

  SelectCategory(this.selectedCategoryIndex);
}
