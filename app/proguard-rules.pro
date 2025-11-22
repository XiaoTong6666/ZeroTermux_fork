# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

-dontobfuscate
#-renamesourcefileattribute SourceFile
#-keepattributes SourceFile,LineNumberTable

-dontwarn com.arialyy.aria.**
-keep class com.arialyy.aria.**{*;}
-keep class **$$DownloadListenerProxy{ *; }
-keep class **$$UploadListenerProxy{ *; }
-keep class **$$DownloadGroupListenerProxy{ *; }
-keep class **$$DGSubListenerProxy{ *; }
-keep class com.hzy.lib7z.**{*;}
-keepclasseswithmembernames class * {
    @com.arialyy.annotations.Download.* <methods>;
    @com.arialyy.annotations.Upload.* <methods>;
    @com.arialyy.annotations.DownloadGroup.* <methods>;
}

# LocalePlugin 混淆规则
-keep class com.mallotec.reb.localeplugin.** { *; }
-dontwarn com.mallotec.reb.localeplugin.**

-keep class com.termux.zerocore.ftp.new_ftp.** { *; }
-dontwarn com.termux.zerocore.ftp.new_ftp.**

-keep class org.apache.mina.** { *; }
-dontwarn org.apache.mina.**

-keep class org.apache.ftpserver.** { *; }
-dontwarn org.apache.ftpserver.**

# 保留 CmdEntryPoint 及其依赖
-keep class com.termux.x11.CmdEntryPoint { *; }
-keep class com.termux.x11.Loader { *; }

# 保留所有native方法
-keepclasseswithmembernames class * {
    native <methods>;
}

# 保留自定义异常类
-keep public class * extends java.lang.Exception

# 保留ActivityThread相关反射类
-keep class android.app.ActivityThread { *; }
-keepclassmembers class android.app.ActivityThread {
    public static *** currentActivityThread();
    public *** getSystemContext();
}

# 保留自定义工具类
-keep class com.your.package.ContextUtil { *; }

# 忽略 AgentWeb 对支付宝 SDK 的引用
-dontwarn com.alipay.sdk.**
-dontwarn com.alipay.api.**

# 忽略 Log4j 对 Java Beans 的引用 (Android 不支持 java.beans)
-dontwarn java.beans.**

# 忽略 ZXing 引用 (防止 BGAQRCode 报错)
-dontwarn com.google.zxing.**

# 忽略 OkGo 可能引用的类
-dontwarn com.lzy.okgo.**
