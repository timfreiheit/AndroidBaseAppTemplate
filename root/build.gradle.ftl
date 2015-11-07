apply plugin: 'com.android.application'
apply plugin: 'com.neenbedankt.android-apt'
apply plugin: 'com.android.databinding'
<#if includeRetrolambda>
apply plugin: 'me.tatarka.retrolambda'
</#if>


android {

    compileSdkVersion 23
    buildToolsVersion "23.0.2"

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
   

<#if includeRetrolambda>
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
	}
</#if>
<#if !includeRetrolambda>
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_7
        targetCompatibility JavaVersion.VERSION_1_7
	}
</#if>

	buildTypes {
		
		debug {
            debuggable true
			applicationIdSuffix ".debug"
<#if includeHockeyApp>
            buildConfigField "String", "HOCKEY_APP_ID", "\"\""
</#if>
		}
		
		alpha {
            initWith(buildTypes.debug)
            applicationIdSuffix ".alpha"
<#if includeHockeyApp>
            buildConfigField "String", "HOCKEY_APP_ID", "\"\""
</#if>
        }
		
		
		beta {
            initWith(buildTypes.debug)
            applicationIdSuffix ".beta"
<#if includeHockeyApp>
            buildConfigField "String", "HOCKEY_APP_ID", "\"\""
</#if>
        }
		
		release {
            debuggable false
			minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
			
<#if includeHockeyApp>
            // buildConfigField "String", "HOCKEY_APP_ID", "null"
</#if>
		}
	}
}

dependencies {

    compile 'com.android.support:appcompat-v7:23.1.0'
    compile 'com.android.support:support-v4:23.1.0'

<#if includeHockeyApp>
	// https://github.com/timfreiheit/HockeyLogReportingHelper
	compile 'com.github.timfreiheit:HockeyLogReportingHelper:v0.4'
	
	// https://github.com/bitstadium/HockeySDK-Android
    compile 'net.hockeyapp.android:HockeySDK:3.6.2'

    // https://github.com/SalomonBrys/ANR-WatchDog
    compile 'com.github.anrwatchdog:anrwatchdog:1.1.1'
</#if>
  
	// https://github.com/JakeWharton/butterknife
	compile 'com.jakewharton:butterknife:7.0.1'
   
<#if includeRetrofit>
	// https://github.com/square/okhttp
	compile 'com.squareup.okhttp:okhttp:2.5.0'
   
	// https://github.com/square/retrofit
	compile 'com.squareup.retrofit:retrofit:1.9.0'
</#if>
  
}
