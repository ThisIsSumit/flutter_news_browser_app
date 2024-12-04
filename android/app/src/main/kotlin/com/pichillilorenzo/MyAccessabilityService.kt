package com.pichillilorenzo.flutter_browser

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.content.Intent
import android.util.Log
import android.view.accessibility.AccessibilityEvent

class MyAccessibilityService : AccessibilityService() {
    private val TAG = "MyAccessibilityService"
     companion object {
        // Global flag to track whether kiosk mode is enabled
        var isKioskModeEnabled = false
    }
    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (isKioskModeEnabled && event?.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            val packageName = event.packageName?.toString()
            Log.d(TAG, "Current package: $packageName")

            val excludeList = listOf(
                "com.amazon.firelauncher",
                "com.android.inputmethod.latin",
                "android",
                "com.google.android.ext.services",
                "com.google.android.inputmethod.latin",
                "com.pichillilorenzo.flutter_browser",
                "com.android.systemui", // System UI package includes recents and notifications
                "com.google.android.apps.nexuslauncher", // Default home launcher (adjust as needed)
                "com.google.android.launcher"// Another common launcher package (adjust as needed)  
            )

            if (isKioskModeEnabled && packageName != null && !excludeList.contains(packageName)) {
                Log.d(TAG, "Blocking package: $packageName")

                // Launch browser app
                val intent = packageManager.getLaunchIntentForPackage("com.pichillilorenzo.flutter_browser")
                if (intent != null) {
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                }

                // Close the current app
                performGlobalAction(GLOBAL_ACTION_BACK)
            }
        }
    }

    override fun onInterrupt() {
        // Handle interrupt
    }

    override fun onServiceConnected() {
        super.onServiceConnected()
        val info = AccessibilityServiceInfo().apply {
            eventTypes = AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
            packageNames = null
            feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC
            notificationTimeout = 100
        }
        this.serviceInfo = info
    }
    // Method to update the kiosk mode status from Flutter
     fun setKioskModeEnabled(enabled: Boolean) {
          Log.d("MyAccessibilityService", "Kiosk mode enabled: $enabled")
        isKioskModeEnabled = enabled
    }
}
