package com.caretech.medionInnovation

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.app.Application
import com.yandex.mapkit.MapKitFactory;
import androidx.annotation.NonNull;
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.android.FlutterFragmentActivity


class MainActivity : FlutterFragmentActivity() {
    private val DEVICE_INFO_CHANNEL = "device_info_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("5d6635a4-578e-47dd-b911-7221fe7c81d2")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
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
