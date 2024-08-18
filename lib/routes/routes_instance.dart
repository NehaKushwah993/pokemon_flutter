import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_flutter/screens/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/screens/pokemon_list/pokemon_list_screen.dart';

GoRouter routerInstance = GoRouter(
  initialLocation: listRoute.path,
  routes: [
    listRoute,
    detailRoute,
  ],
);

var detailRoute = GoRoute(
  path: "/detail/:id",
  builder: (ctx, state) {
    final id = state.pathParameters['id']!;

    return BlocProvider(
      create: (context) => PokemonDetailBloc(id),
      child: const PokemonDetailScreen(),
    );
  },
);

var listRoute = GoRoute(
  path: "/list",
  builder: (ctx, state) {
    return BlocProvider(
      create: (context) => PokemonListBloc(),
      child: const PokemonListScreen(),
    );
  },
);
