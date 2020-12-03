//
//  MNPollution.m
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "MNPollution.h"

static NSString * const  airQualityIndexKey = @"aqius";

@implementation MNPollution

- (instancetype)initWithAirQualityIndex:(NSInteger)airQualityIndex
{
    self = [super init];
    if (self)
    {
        _airQualityIndex = airQualityIndex;
    }
    return self;
}

@end

@implementation MNPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger airQualityIndex = [dictionary[airQualityIndexKey]intValue];
    
    return [self initWithAirQualityIndex:airQualityIndex];
}

@end
