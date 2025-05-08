
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Returns a unique device identifier across app launches.
  static Future<String> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.id ?? _fallbackId();
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? _fallbackId();
      } else {
        return _fallbackId();
      }
    } catch (e) {
      return _fallbackId();
    }
  }

  /// Fallback: generates a UUID if platform ID unavailable.
  static String _fallbackId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}