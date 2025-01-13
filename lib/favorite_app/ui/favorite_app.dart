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
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(
                child: Text("Something went wrong."),
              );
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favItems.length,
                itemBuilder: (context, index) {
                  final item = state.favItems[index];

                  return Card(
                    child: ListTile(
                      title: Text(item.value),
                      trailing: BlocBuilder<FavoriteAppBloc, FavoriteAppStates>(
                        buildWhen: (previous, current) =>
                            previous.favItems[index].isFavourite !=
                            current.favItems[index].isFavourite,
                        builder: (context, state) {
                          final isFavourite = state.favItems[index].isFavourite;

                          return IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteAppBloc>()
                                  .add(MakeItemFavourite(item: item));
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
