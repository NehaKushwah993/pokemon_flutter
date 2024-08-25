import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/bloc/pokemon_detail_bloc_state.dart';
import 'package:pokemon_flutter/utils/common.dart';

import 'bloc/pokemon_detail_bloc_event.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late final PokemonDetailBloc _bloc;
  late Box _pokemonDetailBox;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PokemonDetailBloc>();
    _bloc.add(PokemonDetailEventInit());

    _pokemonDetailBox = Hive.box(pokemonDetailBox);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailBlocState>(
        builder: (ctx, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemon details"),
          leading: Navigator.canPop(context) ? const BackButton() : null,
        ),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: _pokemonDetailBox.listenable(),
            builder: (ctx, box, child) {
              var pokemon = box.get(_bloc.id);

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        Config.instance.getImageUrl((_bloc.id).toString()),
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorWidget: (context, url, error) => Container(),
                  ),
                  TitleAndDetailWidget("Base Experience",
                      "${pokemon?.baseExperience ?? "-"} Exp. points"),
                  TitleAndDetailWidget("Height", "${pokemon?.height ?? "-"}"),
                  TitleAndDetailWidget("Weight", "${pokemon?.weight ?? "-"}")
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

class TitleAndDetailWidget extends StatelessWidget {
  final String title;
  final String detail;
  const TitleAndDetailWidget(this.title, this.detail, {super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 22);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.end,
            style: style,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          ":",
          style: style,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            detail,
            style: style,
          ),
        ),
      ],
    );
  }
}
