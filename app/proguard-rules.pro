# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

-dontobfuscate
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# 保留所有 Native 方法
-keepclasseswithmembernames,allowobfuscation class * {
    native <methods>;
}

# 保留自定义异常，防止日志看不懂
-keep public class * extends java.lang.Exception

# 忽略 IDE 对隐藏 API 的警告
-dontwarn android.app.ActivityThread
-dontwarn android.app.ContextImpl
-dontwarn android.os.ServiceManager
-dontwarn android.view.**

# 保护反射调用
-keep class android.app.ActivityThread { *; }
-keepclassmembers class android.app.ActivityThread {
    public static *** currentActivityThread();
    public *** getSystemContext();
    public *** getApplication();
    public static *** currentApplication();
}
-keep class android.app.ContextImpl { *; }
-keep class android.os.Looper { *; }
-keep class android.os.Handler { *; }
-keep class android.os.ServiceManager {
    public static android.os.IBinder getService(java.lang.String);
}
# 保护 IWindowSession 等底层图形接口
-keep class android.view.** { *; }

# 安装器、服务、Activity
-keep class com.termux.app.TermuxInstaller { *; }
-keep class com.termux.app.TermuxService { *; }
-keep class com.termux.app.TermuxActivity { *; }

# Bootstrap 引导 (注意：根据你的反馈，它在 shared 模块)
-keep class com.termux.shared.termux.TermuxBootstrap { *; }

# Termux Shared 工具库 (文件操作、ViewUtils 等)
-keep class com.termux.shared.** { *; }

# BuildConfig 版本信息 (适配 AGP 8 namespace)
-keep class com.termux.BuildConfig { *; }
-keep class com.termux.shared.BuildConfig { *; }

# 彻底保护 ZeroCore 引擎，防止反射 newInstance 崩溃
-keep class com.termux.zerocore.** { *; }
-dontwarn com.termux.zerocore.**

# 显式保留构造函数
-keepclassmembers class com.termux.zerocore.zero.engine.ZeroCoreManage {
    <init>(...);
}

# 保护依赖工具库 xh_lib
-keep class com.example.xh_lib.** { *; }

# 保护实体类 (Gson 序列化)
-keep class com.termux.zerocore.bean.** { *; }
-keepattributes Signature,*Annotation*,EnclosingMethod

# Apache Commons Compress (Symlinks 处理)
-keep class org.apache.commons.compress.** { *; }
-keep interface org.apache.commons.compress.** { *; }
-dontwarn org.apache.commons.compress.**

# Aria 下载库
-dontwarn com.arialyy.aria.**
-keep class com.arialyy.aria.**{*;}
-keep class **$$DownloadListenerProxy{ *; }
-keep class **$$UploadListenerProxy{ *; }
-keep class **$$DownloadGroupListenerProxy{ *; }
-keep class **$$DGSubListenerProxy{ *; }
-keepclasseswithmembernames class * {
    @com.arialyy.annotations.Download.* <methods>;
    @com.arialyy.annotations.Upload.* <methods>;
    @com.arialyy.annotations.DownloadGroup.* <methods>;
}

# Termux X11
-keep class com.termux.x11.** { *; }
-dontwarn com.termux.x11.**

# 其他杂项库
-keep class com.mallotec.reb.localeplugin.** { *; }
-dontwarn com.mallotec.reb.localeplugin.**
-keep class org.apache.mina.** { *; }
-dontwarn org.apache.mina.**
-keep class org.apache.ftpserver.** { *; }
-dontwarn org.apache.ftpserver.**
-keep class com.hzy.lib7z.**{*;}
-keep class com.your.package.ContextUtil { *; }

# 忽略无害警告 (减少构建噪音)
-dontwarn com.alipay.sdk.**
-dontwarn com.alipay.api.**
-dontwarn java.beans.**
-dontwarn com.google.zxing.**
-dontwarn com.lzy.okgo.**
-dontwarn cn.bingoogolapple.photopicker.**
-dontwarn com.draggable.library.extension.**

-keepattributes Signature
-keepattributes *Annotation*

# 保护数据模型
-keep class com.termux.zerocore.bean.** { *; }

# 关键：保护 TypeToken 的匿名子类，防止 R8 移除泛型信息导致运行时崩溃
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.reflect.TypeToken
