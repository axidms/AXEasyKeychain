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
// Returns dictionary for provided ID.
+ (NSDictionary *)dictionaryById:(NSString *)keyChainId;
// Creates or updates new item for key with the provided value and ID.
+ (void)updateValue:(NSString *)value forKey:(NSString *)aKey withId:(NSString *)keyChainId;
// Remove value with key and ID.
+ (void)removeValueByKey:(NSString *)aKey withId:(NSString *)keyChainId;

@end
