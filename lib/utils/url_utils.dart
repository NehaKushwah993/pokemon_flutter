// Function to extract Pokémon ID from URL
String extractPokemonId(String url) {
  // Split the URL by '/'
  final parts = url.split('/');

  // The ID is always the second last part of the URL
  final id = parts[parts.length - 2];

  return id;
}
