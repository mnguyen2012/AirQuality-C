//
//  MNCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCityAirQuality.h"
NS_ASSUME_NONNULL_BEGIN

@interface MNCityAirQualityController : NSObject

+ (void) fetchSupportedCountries:(void(^) (NSArray<NSString *> *_Nullable))completion;

+ (void) fetchSupportedStatesInCountry:(NSString *)country completion:(void(^)(NSArray<NSString *>*_Nullable))completion;

+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void(^)(NSArray<NSString *>*_Nullable))completion;

+(void)fetchDataForCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void(^)(MNCityAirQuality *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
