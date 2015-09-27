package ${packageName}.utils;

import android.util.Log;

import java.util.Arrays;

import ${packageName}.BuildConfig;

/**
 * unified wrapper of {@link Log} to make logging more consistent throughout the app
 * <p/>
 * automatically logs called filename, method and linenumber
 * if you are not called the methods with a custom tag
 * <p/>
 * D/FILENAME? [METHOD: LINENUMBER] MSG
 * <p/>
 * Created by timfreiheit on 26.07.15.
 */
public final class L {

    /**
     * @see #v(Object, Throwable)
     * <p/>
     * <p><b>This level is NOT logged in release build.</b></p>
     */
    public static void v(Object msg) {
        if (BuildConfig.DEBUG) {
            Throwable t = new Throwable();
            StackTraceElement[] elements = t.getStackTrace();

            String callerClassName = elements[1].getFileName();
            String methodName = elements[1].getMethodName() + ": " + elements[1].getLineNumber();
            Log.v(callerClassName, "[" + methodName + "] " + getStringRepresentation(msg));
        }
    }

    /**
     * @see #v(Object, Throwable)
     * @see Log#v(String, String)
     * <p/>
     * <p><b>This level is NOT logged in release build.</b></p>
     */
    public static void v(Object TAG, Object msg) {
        if (BuildConfig.DEBUG) {
            Log.d(getStringRepresentation(TAG), getStringRepresentation(msg));
        }
    }

    /**
     * <p><b>VERBOSE:</b> This level of logging should be used for everything else.</p>
     * <p/>
     * <p><b>This level is NOT logged in release build.</b></p>
     */
    public static void v(Object msg, Throwable cause) {
        if (BuildConfig.DEBUG) {
            Throwable t = new Throwable();
            StackTraceElement[] elements = t.getStackTrace();

            String callerClassName = elements[1].getFileName();

            Log.v(callerClassName, getStringRepresentation(msg), cause);
        }
    }

    /**
     * @see #v(Object, Throwable)
     */
    public static void v(Object TAG, Object msg, Throwable cause) {
        if (BuildConfig.DEBUG) {
            Log.v(getStringRepresentation(TAG), getStringRepresentation(msg), cause);
        }
    }

    /**
     * @see #d(Object, Throwable)
     * automatically placed the called class as tag and appends [METHODNAME : LINENUMBER] as a prefix for the msg
     */
    public static void d(Object msg) {
        if (BuildConfig.DEBUG) {
            Throwable t = new Throwable();
            StackTraceElement[] elements = t.getStackTrace();

            String callerClassName = elements[1].getFileName();
            String methodName = elements[1].getMethodName() + ": " + elements[1].getLineNumber();
            Log.d(callerClassName, "[" + methodName + "] " + getStringRepresentation(msg));
        }
    }

    /**
     * @see #d(Object, Throwable)
     * @see Log#d(String, String)
     * <p/>
     * <p><b>This level is NOT logged in release build.</b></p>
     */
    public static void d(Object TAG, Object msg) {
        if (BuildConfig.DEBUG) {
            Log.d(getStringRepresentation(TAG), getStringRepresentation(msg));
        }
    }

    /**
     * <p><b>DEBUG:</b> This level of logging should be used to further note what is happening on the device that
     * could be relevant to investigate and debug unexpected behaviors. You should log only what is needed to gather
     * enough information about what is going on about your component. If your debug logs are dominating the log then
     * you probably should be using verbose logging.</p>
     * <p/>
     * <p><b>This level is NOT logged in release build.</b></p>
     */
    public static void d(Object msg, Throwable cause) {
        if (BuildConfig.DEBUG) {

            Throwable t = new Throwable();
            StackTraceElement[] elements = t.getStackTrace();

            String callerClassName = elements[1].getFileName();

            Log.d(callerClassName, getStringRepresentation(msg), cause);
        }
    }

    /**
     * @see #d(Object, Throwable)
     */
    public static void d(Object TAG, Object msg, Throwable cause) {
        if (BuildConfig.DEBUG) {
            Log.d(getStringRepresentation(TAG), getStringRepresentation(msg), cause);
        }
    }

    /**
     * @see #i(Object, Throwable)
     * <p/>
     * <p><b>This level is always logged.</b></p>
     */
    public static void i(Object msg) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();
        String methodName = elements[1].getMethodName() + ": " + elements[1].getLineNumber();
        Log.i(callerClassName, "[" + methodName + "] " + getStringRepresentation(msg));
    }

    /**
     * @see #i(Object, Throwable)
     * @see Log#i(String, String)
     * <p/>
     * <p><b>This level is always logged.</b></p>
     */
    public static void i(Object TAG, Object msg) {
        Log.i(getStringRepresentation(TAG), getStringRepresentation(msg));
    }

    /**
     * <p><b>INFORMATIVE:</b> This level of logging should used be to note that something interesting to most
     * people happened, i.e. when a situation is detected that is likely to have widespread impact, though isn't
     * necessarily an error. Such a condition should only be logged by a module that reasonably believes that it
     * is the most authoritative in that domain (to avoid duplicate logging by non-authoritative components).</p>
     * <p/>
     * <p><b>This level is always logged.</b></p>
     */
    public static void i(Object msg, Throwable cause) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();

        Log.i(callerClassName, getStringRepresentation(msg), cause);
    }

    /**
     * @see #i(Object, Throwable)
     */
    public static void i(Object TAG, Object msg, Throwable cause) {
        Log.i(getStringRepresentation(TAG), getStringRepresentation(msg), cause);
    }

    /**
     * @see #e(Object, Throwable)
     */
    public static void e(Object msg) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();
        String methodName = elements[1].getMethodName() + ": " + elements[1].getLineNumber();
        Log.e(callerClassName, "[" + methodName + "] " + getStringRepresentation(msg));
    }

    /**
     * @see #w(Object, Throwable)
     */
    public static void w(Object msg) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();
        String methodName = elements[1].getMethodName() + ": " + elements[1].getLineNumber();
        Log.w(callerClassName, "[" + methodName + "] " + getStringRepresentation(msg));
    }

    /**
     * @see Log#w(String, String)
     * @see #w(Object, Throwable)
     */
    public static void w(Object TAG, Object msg) {
        Log.w(getStringRepresentation(TAG), getStringRepresentation(msg));
    }

    /**
     * <p><b>WARNING:</b> This level of logging should used when something serious and unexpected happened, i.e.
     * something that will have user-visible consequences but is likely to be recoverable without data loss by
     * performing some explicit action, ranging from waiting or restarting an app all the way to re-downloading a
     * new version of an application or rebooting the device. Issues that justify some logging at the WARNING
     * level might also be considered for reporting to a statistics-gathering server.</p>
     * <p/>
     * <p><b>This level is always logged.</b></p>
     */
    public static void w(Object msg, Throwable cause) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();

        Log.w(callerClassName, getStringRepresentation(msg), cause);
    }

    /**
     * @see #w(Object, Throwable)
     */
    public static void w(Object TAG, Object msg, Throwable cause) {
        Log.w(getStringRepresentation(TAG), getStringRepresentation(msg), cause);
    }

    /**
     * @see Log#e(String, String)
     * @see #e(Object, Throwable)
     */
    public static void e(Object TAG, Object msg) {
        Log.e(getStringRepresentation(TAG), getStringRepresentation(msg));
    }

    /**
     * <p><b>ERROR:</b> This level of logging should be used when something fatal has happened, i.e. something that
     * will have user-visible consequences and won't be recoverable without explicitly deleting some data, uninstalling
     * applications, wiping the data partitions or reflashing the entire phone (or worse). Issues that justify some
     * logging at the ERROR level are typically good candidates to be reported to a statistics-gathering server.</p>
     * <p/>
     * <p><b>This level is always logged.</b></p>
     */
    public static void e(Object msg, Throwable cause) {
        Throwable t = new Throwable();
        StackTraceElement[] elements = t.getStackTrace();

        String callerClassName = elements[1].getFileName();

        Log.e(callerClassName, getStringRepresentation(msg), cause);
    }

    /**
     * @see #e(Object, Throwable)
     */
    public static void e(Object TAG, Object msg, Throwable cause) {
        Log.e(getStringRepresentation(TAG), getStringRepresentation(msg), cause);
    }

    /**
     * returns string representation of an item
     * Arrays will be printed as Lists
     */
    private static String getStringRepresentation(Object item) {
        if (item == null) {
            return "null";
        }
        if (item.getClass().isArray()) {
            Object[] items = (Object[]) item;
            return Arrays.asList(items).toString();
        }
        return item.toString();
    }

}