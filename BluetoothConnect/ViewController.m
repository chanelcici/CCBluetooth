//
//  ViewController.m
//  BluetoothConnect
//
//  Created by CHANEL on 16/2/21.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "ViewController.h"
#import "CCBluetooth.h"

@interface ViewController ()<CBCentralManagerDelegate>

@property (nonatomic, copy) CBCentralManager *manager;
@property (nonatomic, copy) CBCentralManager *manager2;

@end

UIButton *scan;
UIButton *stop;

CCBluetooth *ccbluetooth;

@implementation ViewController

@synthesize manager, manager2;

- (void)viewDidLoad {
    [super viewDidLoad];

    scan = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:scan];
    scan.backgroundColor = [UIColor yellowColor];
    [scan addTarget:self action:@selector(scanDevice) forControlEvents:UIControlEventTouchUpInside];
    stop = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    [self.view addSubview:stop];
    stop.backgroundColor = [UIColor greenColor];
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    ccbluetooth = [CCBluetooth sharedInstance];
    
}

-(void)scanDevice {
    [ccbluetooth startScan];

}

-(void)stop {
    [ccbluetooth stopScan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
