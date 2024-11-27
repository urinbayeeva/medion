import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    // MapKitFactory.setLocale("YOUR_LOCALE")
    MapKitFactory.setApiKey("3f886df1-7552-4a91-8dc7-3511e772780d") // Your generated API key
  }
}