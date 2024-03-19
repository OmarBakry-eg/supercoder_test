import 'package:device_info_plus/device_info_plus.dart';
import 'package:supercoder_test/src/utils/exports.dart';

sealed class DevicePlatform {
 static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<(String deviceID, String devicePlatform)> getDevicePlatform() async {
  (String deviceID, String devicePlatform) res = ("","");
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      logInfo('Running on ${androidInfo.id}');
      res = (androidInfo.id, "android");
    }
    if(Platform.isIOS){
    IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
    logInfo('Running on ${iosInfo.utsname.machine}'); 
    res = (iosInfo.utsname.machine, "ios");
    }
    return res;
  }
}
