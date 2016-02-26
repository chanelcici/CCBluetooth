//
//  CCBluetooth.m
//  BluetoothConnect
//
//  Created by CHANEL on 16/2/24.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "CCBluetooth.h"

@implementation CCBluetooth

CBCentralManager *manager;

+(CCBluetooth *)sharedInstance {
    static dispatch_once_t onceToken;
    static CCBluetooth *_singleton = nil;
    dispatch_once(&onceToken,^{
        _singleton = [[super allocWithZone:NULL] init];
    });
    return _singleton;
}

+(id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

#pragma - implement NSCopying
-(id)copyWithZone:(NSZone *)zone {
    return self;
}

-(void)startScan {
    if (!manager) {
        manager = [CBCentralManager alloc];
    }
    manager = [manager initWithDelegate:self queue:dispatch_get_main_queue()];

}

-(void)stopScan {
    [manager stopScan];
}

#pragma mark - CBCentralManagerDelegate
//主设备状态改变的委托，在初始化CBCentralManager的适合会打开设备，只有当设备正确打开后才能使用
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBCentralManagerStateUnknown:
            NSLog(@">>>CBCentralManagerStateUnknown");
            break;
        case CBCentralManagerStateResetting:
            NSLog(@">>>CBCentralManagerStateResetting");
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@">>>CBCentralManagerStateUnsupported");
            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@">>>CBCentralManagerStateUnauthorized");
            break;
        case CBCentralManagerStatePoweredOff:
            NSLog(@">>>CBCentralManagerStatePoweredOff");
            break;
        case CBCentralManagerStatePoweredOn:
            NSLog(@">>>CBCentralManagerStatePoweredOn");
            //开始扫描周围的外设 第一个参数nil就是扫描周围所有的外设，扫描到外设后会进入找到外设的代理didDiscoverPeripheral
            [manager scanForPeripheralsWithServices:nil options:nil];
            
            break;
        default:
            break;
    }
}

//找到外设的代理,找到一个回调一次
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"当扫描到设备:%@",peripheral.name);
}

//连接外设成功的代理
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
}

//外设连接失败的代理
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}

//断开外设的代理
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}


@end
