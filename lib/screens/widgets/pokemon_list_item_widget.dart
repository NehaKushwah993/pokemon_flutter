import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_flutter/remote/config.dart';
import 'package:pokemon_flutter/utils/url_utils.dart';

import '../../models/pokemon_name_url_model.dart';

class PokemonListItemWidget extends StatelessWidget {
  final PokemonNameUrlModel item;
  final Function()? onTap;
  const PokemonListItemWidget(this.item, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Hero(
              tag: "hero-${extractPokemonId(item.url)}",
              child: CachedNetworkImage(
                imageUrl:
                    Config.instance.getImageUrl(extractPokemonId(item.url)),
                fit: BoxFit.contain,
                width: double.infinity,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            item.name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
