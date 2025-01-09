import 'package:flutter_bloc_tutorial/models/favourite_item_model.dart';

class FavoriteItemRepository {
  Future<List<FavouriteItemModel>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));

    return List.of(_items(10));
  }

  List<FavouriteItemModel> _items(int length) => List.generate(
        length,
        (index) => FavouriteItemModel(id: index.toString(), value: "Item $index"),
      );
}
