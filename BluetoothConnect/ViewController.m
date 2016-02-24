//
//  ViewController.m
//  BluetoothConnect
//
//  Created by CHANEL on 16/2/21.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController ()<CBCentralManagerDelegate>

@property (nonatomic, copy) CBCentralManager *manager;
@property (nonatomic, copy) CBCentralManager *manager2;

@end

UIButton *scan;

@implementation ViewController

@synthesize manager, manager2;

- (void)viewDidLoad {
    [super viewDidLoad];

    scan = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:scan];
    scan.backgroundColor = [UIColor yellowColor];
    [scan addTarget:self action:@selector(scanDevice) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)scanDevice {
    manager = [[CBCentralManager alloc]initWithDelegate:self queue:dispatch_get_main_queue()];
    manager2 = [[CBCentralManager alloc]initWithDelegate:self queue:dispatch_get_main_queue()];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
            //开始扫描周围的外设
            /*
             第一个参数nil就是扫描周围所有的外设，扫描到外设后会进入
             - (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
             */
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
