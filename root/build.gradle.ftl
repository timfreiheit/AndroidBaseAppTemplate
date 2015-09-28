apply from: '../dependencies.gradle'

apply plugin: 'com.android.application'
apply plugin: 'com.neenbedankt.android-apt'
apply plugin: 'com.android.databinding'


android {

    compileSdkVersion androidoptions.compileSdkVersion
    buildToolsVersion androidoptions.buildToolsVersion

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

    compile androidlibs.appcompatV7
    compile androidlibs.supportV4
   
	// https://github.com/timfreiheit/HockeyLogReportingHelper
    compile libs.hockeylog
	
	// https://github.com/bitstadium/HockeySDK-Android
	compile libs.hockey
	
    // https://github.com/SalomonBrys/ANR-WatchDog
    compile libs.anrwatchdog
  
	// https://github.com/JakeWharton/butterknife
	compile libs.butterknife
   
<#if includeRetrofit>
	// https://github.com/square/okhttp
	compile libs.okhttp
   
	// https://github.com/square/retrofit
	compile libs.retrofit
</#if>
  
}
