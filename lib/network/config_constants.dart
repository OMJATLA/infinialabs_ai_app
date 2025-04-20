enum Environment { stage, production }

class ConfigConstants {
  const ConfigConstants._();

  static const Environment _currentEnv = Environment.production;

  static const Map<Environment, String> _baseUrls = {
    Environment.stage: 'https://mint-foxhound-newly.ngrok-free.app',
    Environment.production: 'https://mint-foxhound-newly.ngrok-free.app',
  };

  static String get baseUrl => _baseUrls[_currentEnv]!;
}
