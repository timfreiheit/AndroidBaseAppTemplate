apply plugin: 'com.android.application'
apply plugin: 'com.android.databinding'

android {

   compileSdkVersion 23
   buildToolsVersion "23.0.1"

	defaultConfig {
		applicationId "${packageName}"
        minSdkVersion 16
        targetSdkVersion 23
        versionName "1.0"
	}
	
	signingConfigs {
        debug {
            storeFile file('debug.keystore')
        }
    }
   
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_7
        targetCompatibility JavaVersion.VERSION_1_7
	}

	buildTypes {
		
		debug {
            debuggable true
			applicationIdSuffix ".debug"
            buildConfigField "String", "HOCKEY_APP_ID", ""
		}
		
		alpha {
            initWith(buildTypes.debug)
            applicationIdSuffix ".alpha"
            buildConfigField "String", "HOCKEY_APP_ID", ""
        }
		
		
		beta {
            initWith(buildTypes.debug)
            applicationIdSuffix ".beta"
            buildConfigField "String", "HOCKEY_APP_ID", ""
        }
		
		release {
            debuggable false
			minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
			
            // buildConfigField "String", "HOCKEY_APP_ID", ""
		}
	}
}

dependencies {

	compile 'com.android.support:support-v4:23.0.1'
	compile 'com.android.support:appcompat-v7:23.0.1'
   
	// https://github.com/timfreiheit/HockeyLogReportingHelper
    compile 'de.timfreiheit:hockey.log:0.4'
	
	// https://github.com/bitstadium/HockeySDK-Android
	compile 'net.hockeyapp.android:HockeySDK:3.6.0-b.1'
	
    // https://github.com/SalomonBrys/ANR-WatchDog
    compile 'com.github.anrwatchdog:anrwatchdog:1.1.1'
  
	// https://github.com/JakeWharton/butterknife
	compile 'com.jakewharton:butterknife:7.0.1'
   
<#if includeRetrofit>
	// https://github.com/square/okhttp
	compile 'com.squareup.okhttp:okhttp:2.4.0'
   
	// https://github.com/square/retrofit
	compile 'com.squareup.retrofit:retrofit:1.9.0'
</#if>
  
}
