
import 'permission_exists_platform_interface.dart';

class PermissionExists {
  Future<String?> getPlatformVersion() {
    return PermissionExistsPlatform.instance.getPlatformVersion();
  }

  Future<bool?> check(String permission) {
    return PermissionExistsPlatform.instance.check(permission);
  }
}
