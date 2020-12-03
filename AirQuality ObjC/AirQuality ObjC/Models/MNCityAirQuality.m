//
//  MNCityAirQuality.m
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "MNCityAirQuality.h"
#import "MNWeather.h"
#import "MNPollution.h"

static NSString *const cityKey = @"city";
static NSString *const stateKey = @"state";
static NSString *const countryKey = @"country";
static NSString *const weatherKey = @"weather";
static NSString *const pollutionKey = @"pollution";

@implementation MNCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(MNWeather *)weather pollution:(MNPollution *)pollution
{
    self = [super init];
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
        
    }
    return self;
}
@end

@implementation MNCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *city = dictionary[cityKey];
    NSString *state = dictionary[stateKey];
    NSString *country = dictionary[countryKey];
    NSString *weather = dictionary[weatherKey];
    NSString *pollution = dictionary[pollutionKey];
    
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}


@end
