import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapView {
  MapView._();

  static Future<void> openMap(double lan, double lon) async {
    Uri googleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lan,$lon');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      Get.snackbar("Something Error", "Could not Open the Map");
      throw 'Could not Open the Map';
    }
  }
}
