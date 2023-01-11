import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:permission_handler/permission_handler.dart';
import 'permission_exists_method_channel.dart';

abstract class PermissionExistsPlatform extends PlatformInterface {
  /// Constructs a PermissionExistsPlatform.
  PermissionExistsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PermissionExistsPlatform _instance = MethodChannelPermissionExists();

  /// The default instance of [PermissionExistsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPermissionExists].
  static PermissionExistsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PermissionExistsPlatform] when
  /// they register themselves.
  static set instance(PermissionExistsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> check(Permission permission) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
