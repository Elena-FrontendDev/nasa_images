import 'package:nasa_images/config/app_config.dart';
import 'package:nasa_images/config/debug_options.dart';
import 'package:nasa_images/config/environment/build_types.dart';
import 'package:nasa_images/config/environment/environment.dart';
import 'package:nasa_images/config/urls.dart';
import 'package:nasa_images/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.qa,
    config: AppConfig(
      url: Url.testUrl,
      proxyUrl: Url.qaProxyUrl,
      debugOptions: DebugOptions(
        debugShowCheckedModeBanner: true,
      ),
    ),
  );

  run();
}
