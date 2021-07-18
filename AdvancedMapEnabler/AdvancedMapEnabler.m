//
//  AdvancedMapEnabler.m
//  AdvancedMapEnabler
//
//  Created by PoomSmart on 18/7/2021.
//
//

#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import "ZKSwizzle.h"

@interface GEOPlatform : NSObject
@end

@interface GEOPlatform_AdvancedMapEnabler : NSObject
@end

@implementation GEOPlatform_AdvancedMapEnabler

- (BOOL)supportsAdvancedMap
{
    return YES;
}

+ (void)load
{
    NSLog(@"Hooking -[GEOPlatform supportsAdvancedMap]");
    dlopen("/System/Library/PrivateFrameworks/GeoServices.framework/GeoServices", RTLD_NOW);
    _ZKSwizzle(GEOPlatform_AdvancedMapEnabler.class, NSClassFromString(@"GEOPlatform"));
}


@end
