
import 'permission_exists_platform_interface.dart';
// ignore: depend_on_referenced_packages
import 'package:permission_handler/permission_handler.dart';

class PermissionExists {
  Future<String?> getPlatformVersion() {
    return PermissionExistsPlatform.instance.getPlatformVersion();
  }

  Future<bool?> check(Permission permission) {
    return PermissionExistsPlatform.instance.check(permission);
  }
}
