package ${packageName};

import android.app.Application;
import android.os.Debug;
import android.text.TextUtils;

import com.github.anrwatchdog.ANRError;
import com.github.anrwatchdog.ANRWatchDog;

import ${packageName}.ui.${activityClass};

import de.timfreiheit.hockey.utils.HockeyLifecycleConfig;
import de.timfreiheit.hockey.utils.HockeyLifecycleHelper;
import de.timfreiheit.hockey.utils.WarningExceptionHandler;

public class App extends Application {

	private static App INSTANCE;

	public static App getInstance(){
		return INSTANCE;
	}

	@Override
	public void onCreate() {
		super.onCreate();
		INSTANCE = this;
		initHockeyApp();
	}
	
	protected void initHockeyApp() {
		
		if(TextUtils.isEmpty(BuildConfig.HOCKEY_APP_ID)){
            initANRWatchDog(false);
            return;
        }
        initANRWatchDog(true);

        HockeyLifecycleConfig lifecycleConfig = new HockeyLifecycleConfig.Builder(this)
                .hockeyAppId(BuildConfig.HOCKEY_APP_ID)
                .sendLogAsCrashDescription(true)
					//enable updates only on debug and disable them in release
                .updateEnabled(BuildConfig.DEBUG)
					// when you want to restrict the checks on specific activities
                .activityWhereToCheckForUpdates(${activityClass}.class)
                .crashReportEnabled(true)
                .trackingEnabled(true)
                .build();
        HockeyLifecycleHelper.init(this, lifecycleConfig);
	}
	
	private void initANRWatchDog(final boolean sendCrash){
		new ANRWatchDog().setANRListener(new ANRWatchDog.ANRListener() {
            @Override
            public void onAppNotResponding(ANRError error) {
                if (Debug.isDebuggerConnected()) {
                    return;
                }
                if (sendCrash) {
					WarningExceptionHandler.saveException(error);
                } else {
					error.printStackTrace();
                }
            }
        }).start();
    }
	
}
