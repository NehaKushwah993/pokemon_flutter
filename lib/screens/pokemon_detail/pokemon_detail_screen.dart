import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_flutter/screens/pokemon_detail/bloc/pokemon_detail_bloc_state.dart';

import 'bloc/pokemon_detail_bloc_event.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late final PokemonDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PokemonDetailBloc>();
    _bloc.add(PokemonDetailEventInit());
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                Config.instance.getImageUrl((_bloc.id).toString()),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              TitleAndDetailWidget("Base Experience",
                  "${_bloc.pokemonDetail?.baseExperience ?? "-"} Exp. points"),
              TitleAndDetailWidget(
                  "Height", "${_bloc.pokemonDetail?.height ?? "-"}"),
              TitleAndDetailWidget(
                  "Weight", "${_bloc.pokemonDetail?.weight ?? "-"}")
            ],
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
