class Config {
  String baseUrl = "";
  static final Config instance = Config._internal();

  factory Config() {
    return instance;
  }

  Config._internal();

  init(String baseUrl) {
    this.baseUrl = baseUrl;
  }

  String getImageUrl(String id) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
