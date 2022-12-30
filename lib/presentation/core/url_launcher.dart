import 'package:url_launcher/url_launcher.dart' as launcher;
import 'dart:developer' as dev;

class UrlLauncher {
  UrlLauncher._();

  static void launchUrl(String uri) {
    try {
      launcher.launchUrl(
        Uri.parse(uri),
        mode: launcher.LaunchMode.externalApplication,
      );
    } catch (e) {
      dev.log(e.toString(), name: 'UrlLauncher');
    }
  }
}
