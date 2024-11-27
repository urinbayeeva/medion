package dev.urinbayeeva.medion

import android.app.Application;
import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // MapKitFactory.setLocale("YOUR_LOCALE");
        MapKitFactory.setApiKey("3f886df1-7552-4a91-8dc7-3511e772780d");
    }
}