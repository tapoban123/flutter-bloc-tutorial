import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/models/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavoriteAppStates extends Equatable {
  final List<FavouriteItemModel> favItems;
  final ListStatus listStatus;

  const FavoriteAppStates({
    this.favItems = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteAppStates copyWith({
    List<FavouriteItemModel>? favItems,
    ListStatus? listStatus,
  }) {
    return FavoriteAppStates(
      favItems: favItems ?? this.favItems,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favItems, listStatus];
}
