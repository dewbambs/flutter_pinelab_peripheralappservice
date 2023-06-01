package com.cidroy.flutter_pinelab_peripheralappservice;

import static android.content.Context.BIND_AUTO_CREATE;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterPinelabPeripheralappservicePlugin */
public class FlutterPinelabPeripheralappservicePlugin implements FlutterPlugin, MethodCallHandler,ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  final private String PLUTUS_SMART_ACTION = "com.pinelabs.peripheralappservice.ACTION_BIND";
  final private String PLUTUS_SMART_PACKAGE = "com.pinelabs.peripheralappservice";
  final private int REQUEST_CODE = 3004;
  final private String PERIPHERAL_REQUEST_TAG = "PERIPHERAL_REQUEST";
  final static private String PERIPHERAL_RESPONSE_TAG = "PERIPHERAL_RESPONSE";


  private Messenger mServerMessenger;
  private boolean isBound;

  private static String response;
  private static MethodChannel.Result channelResult;

  ServiceConnection connection = new ServiceConnection() {
    @Override
    public void onServiceConnected(ComponentName componentName, IBinder service) {
      mServerMessenger = new Messenger(service);
      isBound = true;
    }

    @Override
    public void onServiceDisconnected(ComponentName componentName) {
      mServerMessenger = null;
      isBound = false;
    }
  };

  private static class IncomingHandler extends Handler {
    @Override
    public void handleMessage(Message msg) {
      Bundle bundle = msg.getData();
      String value = bundle.getString(PERIPHERAL_RESPONSE_TAG);

      channelResult.success(value);
    }
  }


  private void peripheralMethodCall(String body){
    Message message = Message.obtain(null, REQUEST_CODE);
    Bundle data = new Bundle();
    data.putString(PERIPHERAL_REQUEST_TAG, body);
    message.setData(data);
    try  {
      message.replyTo = new Messenger(new IncomingHandler());
      mServerMessenger.send(message);
    } catch (RemoteException e) {
      e.printStackTrace();
    }
  }


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_pinelab_peripheralappservice");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("startScan")) {
      peripheralMethodCall(call.argument("request"));
      channelResult = result;
    } else {
      result.notImplemented();
    }
  }



  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    Intent intent = new Intent();
    intent.setAction(PLUTUS_SMART_ACTION);
    intent.setPackage(PLUTUS_SMART_PACKAGE);
    binding.getActivity().bindService(intent, connection, BIND_AUTO_CREATE);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {}

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {}

  @Override
  public void onDetachedFromActivity() {}
}
