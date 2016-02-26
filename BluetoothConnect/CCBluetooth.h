//
//  CCBluetooth.h
//  BluetoothConnect
//
//  Created by CHANEL on 16/2/24.
//  Copyright © 2016年 cici. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CCBluetooth : NSObject<NSCopying, CBCentralManagerDelegate>

+(CCBluetooth *)sharedInstance;
-(void) startScan;
-(void) stopScan;

@end
