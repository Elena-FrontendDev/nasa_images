import 'package:nasa_images/config/app_config.dart';
import 'package:nasa_images/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// Prod proxy url.
  static String get prodProxyUrl => '';

  /// QA proxy url.
  static String get qaProxyUrl => '192.168.0.1';

  /// Dev proxy url.
  static String get devProxyUrl => '';

  /// TRest url.
  static String get testUrl => 'https://images-assets.nasa.gov';

  /// Prod url.
  static String get prodUrl => 'https://images-assets.nasa.gov';

  /// Dev url.
  static String get devUrl => 'https://images-assets.nasa.gov';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
