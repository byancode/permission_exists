import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'permission_exists_platform_interface.dart';

/// An implementation of [PermissionExistsPlatform] that uses method channels.
class MethodChannelPermissionExists extends PermissionExistsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('permission_exists');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> check(String permission) async {
    final result = await methodChannel.invokeMethod<bool>('check', permission);
    return result;
  }
}
