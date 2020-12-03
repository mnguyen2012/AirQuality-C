//
//  MNWeather.h
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNWeather : NSObject

@property (nonatomic, readonly) NSInteger temperature;
@property (nonatomic, readonly) NSInteger humidity;
@property (nonatomic, readonly) NSInteger windSpeed;

- (instancetype)initWithTemperature:(NSInteger)temperature
                           humidity:(NSInteger)humidity
                          windSpeed:(NSInteger)windSpeed;
@end

@interface MNWeather (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;
@end
NS_ASSUME_NONNULL_END
