//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <audioplayers/AudioplayersPlugin.h>
#import <flutter_bluetooth_serial/FlutterBluetoothSerialPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <qr_code_scanner/FlutterQrPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioplayersPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioplayersPlugin"]];
  [FlutterBluetoothSerialPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBluetoothSerialPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FlutterQrPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterQrPlugin"]];
}

@end
