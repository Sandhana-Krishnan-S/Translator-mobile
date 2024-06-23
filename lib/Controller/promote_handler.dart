import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoteHandler {
  static Future<void> coffeeTime(String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
}