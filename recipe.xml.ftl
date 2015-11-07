<?xml version="1.0"?>
<recipe>


    <copy from="global.gitignore" to="${escapeXmlAttribute(topOut)}/_.gitignore" />

    <instantiate from="build-global.gradle.ftl" to="${escapeXmlAttribute(topOut)}/_build.gradle" />
    <instantiate from="build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/_build.gradle" />
    <instantiate from="AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/_AndroidManifest.xml" />
	
    <copy from="debug.keystore" to="${escapeXmlAttribute(projectOut)}/debug.keystore" />
	
    <merge from="res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <instantiate from="res/values/styles.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <instantiate from="res/values/dimens.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

    <instantiate from="res/layout/activity_container.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="src/app_package/App.java.ftl" to="${escapeXmlAttribute(srcOut)}/App.java"/>
    <instantiate from="src/app_package/Constants.java.ftl" to="${escapeXmlAttribute(srcOut)}/Constants.java"/>
    <instantiate from="src/app_package/ui/base/BaseActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/base/BaseActivity.java"/>
    <instantiate from="src/app_package/ui/base/BaseFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/base/BaseFragment.java"/>
	
    <instantiate from="src/app_package/utils/L.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/L.java"/>
	
    <instantiate from="src/app_package/ui/SplashScreen.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.java" />
	
    <open file="${escapeXmlAttribute(srcOut)}/ui/${activityClass}.java" />
</recipe>
