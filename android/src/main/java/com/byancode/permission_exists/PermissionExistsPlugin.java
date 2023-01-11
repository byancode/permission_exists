package com.byancode.permission_exists;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.content.Context;
import android.os.Build;
import java.util.List;
import java.lang.Integer;
import java.util.ArrayList;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.pm.PackageInfo;
import com.baseflow.permissionhandler.PermissionUtils;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;

/** PermissionExistsPlugin */
public class PermissionExistsPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "permission_exists");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("check")) {
      final int permission = Integer.parseInt(call.arguments.toString());
      result.success(hasPermission(permission));
    } else if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
      activity = binding.getActivity();
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
      activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
      activity = null;
  }

  @Override
  public void onDetachedFromActivity() {
      activity = null;
  }


  public boolean hasPermission(int permission) {
      if (activity == null) {
          return false;
      }

      List<String> names = PermissionUtils.getManifestNames(activity, permission);

      if (names == null) {
          return false;
      }

      if (names.isEmpty()) {
          return false;
      }

      return true;
  }
}
