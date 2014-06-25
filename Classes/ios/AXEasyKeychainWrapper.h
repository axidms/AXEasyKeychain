//
//  AXEasyKeychainWrapper.h
//
//  Created by Alexander Mertvetsov on 25.06.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXEasyKeychainWrapper : NSObject

// Returns value for provided ID.
+ (NSString *)valueById:(NSString *)keyChainId;
// Creates or updates new item with the provided value and ID.
+ (void)updateValue:(id)value withId:(NSString *)keyChainId;
// Remove all items.
+ (void)clearKeychain;

@end
