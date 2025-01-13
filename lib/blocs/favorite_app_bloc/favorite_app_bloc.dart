import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_events.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_states.dart';
import 'package:flutter_bloc_tutorial/models/favourite_item_model.dart';
import 'package:flutter_bloc_tutorial/repository/favorite_item_repository.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvents, FavoriteAppStates> {
  List<FavouriteItemModel> favItemsList = [];
  final FavoriteItemRepository favoriteItemRepository;

  // This is called Dependency Injection.
  FavoriteAppBloc(this.favoriteItemRepository)
      : super(const FavoriteAppStates()) {
    on<FetchFavouriteList>(fetchList);
    on<MakeItemFavourite>(_makeItemFavourite);
  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavoriteAppStates> emit) async {
    favItemsList = await favoriteItemRepository.fetchItems();

    emit(state.copyWith(
      favItems: favItemsList,
      listStatus: ListStatus.success,
    ));
  }

  void _makeItemFavourite(
      MakeItemFavourite event, Emitter<FavoriteAppStates> emit) {
    final items = List.from(state.favItems);

    emit(state.copyWith(
      listStatus: ListStatus.success,
    ));
  }
}
