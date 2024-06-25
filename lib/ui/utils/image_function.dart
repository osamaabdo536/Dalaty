import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageFunction {
  static Future<File?> cameraPicker() async {
    // Request camera permission for both Android and iOS
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        return File(image.path);
      }
    }
    return null;
  }

  static Future<File?> galleryPicker() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      } else {
        status = await Permission.photos.request();
      }
    } else if (Platform.isIOS) {
      status = await Permission.photos.request();
    } else {
      status = PermissionStatus.denied; // Default for unsupported platforms
    }

    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    }
    return null;
  }
}
