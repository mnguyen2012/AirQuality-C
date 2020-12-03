//
//  MNCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "MNCityAirQualityController.h"

static NSString *const baseURLString = @"https://api.airvisual.com/";
static NSString *const versionComponent = @"v2";
static NSString *const countryComponent = @"countries";
static NSString *const stateComponent = @"states";
static NSString *const cityComponent = @"cities";
static NSString *const cityDetailsComponent = @"city";
static NSString *const stateDetailsComponent = @"state";
static NSString *const countryDetailsComponent = @"countries";
static NSString *const keyKey = @"key";
static NSString *const apiKey = @"afde3e4e-3a14-4c04-9b3d-76f5d717aa51";

@implementation MNCityAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL *countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:keyKey value:apiKey];
    
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithURL:countryURL resolvingAgainstBaseURL:true];

    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion (nil);
        }
        NSArray<NSDictionary *> *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *arrayOfCountries = [NSMutableArray new];
        
        for (NSDictionary *dictionary in dataDictionary)
        {
            NSString *country = [[NSString alloc] initWithString:dictionary[@"country"]];
            [arrayOfCountries addObject:country];
            
        }
    }] resume];
}
+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL *stateURL = [versionURL URLByAppendingPathComponent:stateComponent];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];

    NSURLQueryItem *countryQueryItem = [NSURLQueryItem queryItemWithName:countryComponent value:country];
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:keyKey value:apiKey];

    [queryItems addObject:countryQueryItem];
    [queryItems addObject:apiKeyQueryItem];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:stateURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion (nil);
        }
        NSArray<NSDictionary *> *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *arrayOfStates = [NSMutableArray new];
        
        for (NSDictionary *dictionary in dataDictionary)
        {
            NSString *state = [[NSString alloc] initWithString:dictionary[@"state"]];
            [arrayOfStates addObject:state];
            
        }
        completion(arrayOfStates);
        
    }] resume];
}
+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion :(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL *cityURL = [versionURL URLByAppendingPathComponent:cityComponent];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *stateQueryItem = [NSURLQueryItem queryItemWithName:stateComponent value:state];
    NSURLQueryItem *countryQueryItem = [NSURLQueryItem queryItemWithName:countryComponent value:country];
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:keyKey value:apiKey];
    
    [queryItems addObject:stateQueryItem];
    [queryItems addObject:countryQueryItem];
    [queryItems addObject:apiKeyQueryItem];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:cityURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion (nil);
        }
        NSArray<NSDictionary *> *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *arrayOfCities = [NSMutableArray new];
        
        for (NSDictionary *dictionary in dataDictionary)
        {
            NSString *city = [[NSString alloc] initWithString:dictionary[@"city"]];
            [arrayOfCities addObject:city];
            
        }
        completion(arrayOfCities);
        
    }] resume];
}
    
+ (void)fetchDataForCity:(NSString *)city state:(NSString *)state country:(NSString *)country cpmpletion:(void (^)(MNCityAirQuality * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL *cityURL = [versionURL URLByAppendingPathComponent:cityDetailsComponent];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];

    
    NSURLQueryItem *cityQueryItem = [NSURLQueryItem queryItemWithName:cityDetailsComponent value:city];
    NSURLQueryItem *stateQueryItem = [NSURLQueryItem queryItemWithName:stateDetailsComponent value:state];
    NSURLQueryItem *countryQueryItem = [NSURLQueryItem queryItemWithName:countryDetailsComponent value:country];
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:keyKey value:apiKey];
    
    [queryItems addObject:cityQueryItem];
    [queryItems addObject:stateQueryItem];
    [queryItems addObject:countryQueryItem];
    [queryItems addObject:apiKeyQueryItem];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:cityURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion (nil);
        }
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        
        MNCityAirQuality *cityAirQualityIndex = [[MNCityAirQuality alloc] initWithDictionary:dataDictionary];
        completion(cityAirQualityIndex);

    }] resume];
}

@end
