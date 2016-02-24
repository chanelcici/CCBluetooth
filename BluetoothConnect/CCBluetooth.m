//
//  CCBluetooth.m
//  BluetoothConnect
//
//  Created by CHANEL on 16/2/24.
//  Copyright © 2016年 cici. All rights reserved.
//

#import "CCBluetooth.h"

@implementation CCBluetooth

+ (CCBluetooth *)sharedInstance{
    static dispatch_once_t onceToken;
    static CCBluetooth *_singleton = nil;
    dispatch_once(&onceToken,^{
        _singleton = [[super allocWithZone:NULL] init];
    });
    return _singleton;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

#pragma - implement NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end
