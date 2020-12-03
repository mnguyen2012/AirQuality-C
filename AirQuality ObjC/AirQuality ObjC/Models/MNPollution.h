//
//  MNPollution.h
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

- (instancetype)initWithAirQualityIndex:(NSInteger)airQualityIndex;

@end

@interface MNPollution (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end
NS_ASSUME_NONNULL_END
