// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    repositories {
        jcenter()
    }
    dependencies {
		classpath "com.android.tools.build:gradle:1.3.0"
		classpath "com.android.databinding:dataBinder:1.0-rc1"
        classpath 'com.neenbedankt.gradle.plugins:android-apt:1.8'
<#if includeRetrolambda>
        classpath 'me.tatarka:gradle-retrolambda:3.2.3'
</#if>

    }
}

allprojects {
    repositories {
        jcenter()
        maven { url 'http://dl.bintray.com/populov/maven' }
		maven { url "https://jitpack.io" }  
    }
}
