//
//  MNWeather.m
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "MNWeather.h"

static NSString *const temperatureKey = @"tp";
static NSString *const humidityKey = @"hu";
static NSString *const windKey = @"ws";

@implementation MNWeather

- (instancetype)initWithTemperature:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed
{
    self = [super init];
    if (self)
    {
        _temperature = temperature;
        _humidity = humidity;
        _windSpeed = windSpeed;
    }
    return self;
}
@end

@implementation MNWeather (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger temperature = [dictionary[temperatureKey]intValue];
    NSInteger humidity = [dictionary[humidityKey]intValue];
    NSInteger windSpeed = [dictionary[windKey] intValue];
    
    return [self initWithTemperature:temperature humidity:humidity windSpeed:windSpeed];
}
@end
