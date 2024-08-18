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
}
