import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/models/favourite_item_model.dart';

abstract class FavoriteAppEvents extends Equatable {
  const FavoriteAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavoriteAppEvents {}

class MakeItemFavourite extends FavoriteAppEvents {
  final FavouriteItemModel item;

  const MakeItemFavourite({required this.item});

  @override
  List<Object?> get props => [item];
}
