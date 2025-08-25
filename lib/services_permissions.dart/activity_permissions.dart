// lib/utils/activity_permission.dart
import 'package:permission_handler/permission_handler.dart';

Future<void> requestActivityPermission() async {
  var status = await Permission.activityRecognition.status;
  if (!status.isGranted) {
    await Permission.activityRecognition.request();
  }
}
