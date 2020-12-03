//
//  MNCityAirQuality.h
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNWeather.h"
#import "MNPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *state;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) MNWeather *weather;
@property (nonatomic, copy, readonly) MNPollution *pollution;

- (instancetype)initWithCity:(NSString *)city
                       state:(NSString *)state
                     country:(NSString *)country
                     weather:(MNWeather *)weather
                   pollution:(MNPollution *)pollution;

@end

@interface MNCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
