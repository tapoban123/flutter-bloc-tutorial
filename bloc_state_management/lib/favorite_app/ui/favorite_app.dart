import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_events.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_states.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({super.key});

  @override
  State<FavoriteApp> createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  @override
  void initState() {
    super.initState();

    context.read<FavoriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items App"),
      ),
      body: BlocBuilder<FavoriteAppBloc, FavoriteAppStates>(
        buildWhen: (previous, current) =>
            previous.listStatus != current.listStatus,
        builder: (context, parentState) {
          switch (parentState.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(
                child: Text("Something went wrong."),
              );
            case ListStatus.success:
              return ListView.builder(
                itemCount: parentState.favItems.length,
                itemBuilder: (context, index) {
                  final item = parentState.favItems[index];

                  return Card(
                    child: ListTile(
                      title: Text(item.value),
                      leading: BlocBuilder<FavoriteAppBloc, FavoriteAppStates>(
                        buildWhen: (previous, current) =>
                            previous.favItems[index].isDeleting !=
                            current.favItems[index].isDeleting,
                        builder: (context, isDeletingState) {
                          final isDeleting =
                              isDeletingState.favItems[index].isDeleting;

                          return Checkbox(
                            value: isDeleting,
                            onChanged: (checked) {
                              final updatedItem = isDeletingState
                                  .favItems[index]
                                  .copyWith(isDeleting: checked);
                              print(updatedItem);

                              context
                                  .read<FavoriteAppBloc>()
                                  .add(CheckCurrentItem(item: updatedItem));
                            },
                          );
                        },
                      ),
                      trailing: BlocBuilder<FavoriteAppBloc, FavoriteAppStates>(
                        buildWhen: (previous, current) =>
                            previous.favItems[index].isFavourite !=
                            current.favItems[index].isFavourite,
                        builder: (context, isFavouriteState) {
                          final isFavourite =
                              isFavouriteState.favItems[index].isFavourite;

                          return IconButton(
                            onPressed: () {
                              final updatedItem = isFavouriteState
                                  .favItems[index]
                                  .copyWith(isFavourite: !isFavourite);

                              context
                                  .read<FavoriteAppBloc>()
                                  .add(MakeItemFavourite(item: updatedItem));
                            },
                            icon: Icon(isFavourite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded),
                            color: Colors.red,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
