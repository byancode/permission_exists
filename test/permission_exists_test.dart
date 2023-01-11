import 'package:flutter_test/flutter_test.dart';
import 'package:permission_exists/permission_exists.dart';
import 'package:permission_exists/permission_exists_platform_interface.dart';
import 'package:permission_exists/permission_exists_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPermissionExistsPlatform 
    with MockPlatformInterfaceMixin
    implements PermissionExistsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PermissionExistsPlatform initialPlatform = PermissionExistsPlatform.instance;

  test('$MethodChannelPermissionExists is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPermissionExists>());
  });

  test('getPlatformVersion', () async {
    PermissionExists permissionExistsPlugin = PermissionExists();
    MockPermissionExistsPlatform fakePlatform = MockPermissionExistsPlatform();
    PermissionExistsPlatform.instance = fakePlatform;
  
    expect(await permissionExistsPlugin.getPlatformVersion(), '42');
  });
}
