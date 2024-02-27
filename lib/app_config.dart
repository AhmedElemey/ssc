const _apiKey = 'API_URL';

abstract class AppConfig {
  final String apiURL;

  final AppEnv appEnv;

  AppConfig._({
    required this.apiURL,
    required this.appEnv,
  });
}

class DevConfig implements AppConfig {
  @override
  String get apiURL => _ApiURL.dev.url;

  @override
  AppEnv get appEnv => AppEnv.dev;
}

class StgConfig implements AppConfig {
  @override
  String get apiURL => _ApiURL.stg.url;

  @override
  AppEnv get appEnv => AppEnv.stg;
}

class ProdConfig implements AppConfig {
  @override
  String get apiURL => _ApiURL.prod.url;

  @override
  AppEnv get appEnv => AppEnv.prod;
}

enum _ApiURL {
  dev(String.fromEnvironment(_apiKey)),
  stg(String.fromEnvironment(_apiKey)),
  prod(String.fromEnvironment(_apiKey));

  const _ApiURL(this.url);

  final String url;
}

enum AppEnv {
  dev('.dev'),
  stg('.stg'),
  prod('');

  const AppEnv(this.suffix);

  final String suffix;
}
