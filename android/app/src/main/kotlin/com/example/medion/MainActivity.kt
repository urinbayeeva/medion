package com.example.medion

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val DEVICE_INFO_CHANNEL = "device_info_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, DEVICE_INFO_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "isHarmonyOS") {
                result.success(isHarmonyOS())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun isHarmonyOS(): Boolean {
        return try {
            Class.forName("ohos.system.version.SystemVersion") != null
        } catch (e: ClassNotFoundException) {
            false
        }
    }
}
