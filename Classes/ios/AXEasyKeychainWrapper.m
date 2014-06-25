//
//  AXEasyKeychainWrapper.m
//
//  Created by Alexander Mertvetsov on 25.06.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "AXEasyKeychainWrapper.h"

@implementation AXEasyKeychainWrapper

+ (NSMutableDictionary *)secItemFormatToDictionary:(NSDictionary *)dictionaryToConvert {
    NSMutableDictionary *returnDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionaryToConvert];
    [returnDictionary setObject:(__bridge id) kCFBooleanTrue forKey:(__bridge id) kSecReturnData];
    [returnDictionary setObject:(__bridge id) kSecClassGenericPassword forKey:(__bridge id) kSecClass];
    
    CFTypeRef itemDataRef = nil;
    
    if (!SecItemCopyMatching((__bridge CFDictionaryRef) returnDictionary, &itemDataRef)) {
        NSData *data = (__bridge_transfer NSData *) itemDataRef;
        
        [returnDictionary removeObjectForKey:(__bridge id) kSecReturnData];
        NSString *itemData = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        [returnDictionary setObject:itemData forKey:(__bridge id) kSecValueData];
    }
    
    return returnDictionary;
}

+ (NSMutableDictionary *)dictionaryToSecItemFormat:(NSDictionary *)dictionaryToConvert {
    NSMutableDictionary *returnDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionaryToConvert];
    [returnDictionary setObject:(__bridge id) kSecClassGenericPassword forKey:(__bridge id) kSecClass];
    NSString *secDataString = [dictionaryToConvert objectForKey:(__bridge id) kSecValueData];
    [returnDictionary setObject:[secDataString dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge id) kSecValueData];
    
    return returnDictionary;
}

+ (CFTypeRef)performQuery:(NSDictionary *)query {
    CFTypeRef outDictionaryRef = NULL;
    
    if (SecItemCopyMatching((__bridge CFDictionaryRef) query, &outDictionaryRef) == errSecSuccess)
        return outDictionaryRef;
    
    return NULL;
}

+ (NSMutableDictionary *)queryWithId:(NSString *)keyChainId {
    NSMutableDictionary *query = [[NSMutableDictionary alloc] init];
    [query setObject:(__bridge id) kSecClassGenericPassword forKey:(__bridge id) kSecClass];
    [query setObject:keyChainId forKey:(__bridge id) kSecAttrGeneric];
    [query setObject:keyChainId forKey:(__bridge id) kSecAttrAccount];
    [query setObject:(__bridge id) kSecMatchLimitOne forKey:(__bridge id) kSecMatchLimit];
    [query setObject:(__bridge id) kCFBooleanTrue forKey:(__bridge id) kSecReturnAttributes];
    return query;
}

+ (NSString *)valueById:(NSString *)keyChainId {
    NSMutableDictionary *query = [self queryWithId:keyChainId];
    CFTypeRef outDictionaryRef = [self performQuery:query];
    
    if (outDictionaryRef != NULL) {
        NSMutableDictionary *outDictionary = (__bridge_transfer NSMutableDictionary *) outDictionaryRef;
        NSDictionary *queryResult = [self secItemFormatToDictionary:outDictionary];
        
        return [queryResult objectForKey:(__bridge id) kSecValueData];
    }
    
    return nil;
}

+ (void)updateValue:(id)value withId:(NSString *)keyChainId {
    NSMutableDictionary *query = [self queryWithId:keyChainId];
    CFTypeRef outDictionaryRef = [self performQuery:query];
    NSMutableDictionary *secItem;
    
    if (outDictionaryRef != NULL) {
        NSMutableDictionary *outDictionary = (__bridge_transfer NSMutableDictionary *) outDictionaryRef;
        NSMutableDictionary *queryResult = [self secItemFormatToDictionary:outDictionary];
        
        if (![[queryResult objectForKey:(__bridge id) kSecValueData] isEqual:value]) {
            [outDictionary setObject:[query objectForKey:(__bridge id) kSecClass] forKey:(__bridge id) kSecClass];
            secItem = [self dictionaryToSecItemFormat:@{(__bridge id) kSecValueData : value}];
            [secItem removeObjectForKey:(__bridge id) kSecClass];
            OSStatus status = SecItemUpdate((__bridge CFDictionaryRef) outDictionary, (__bridge CFDictionaryRef) secItem);
            NSAssert(status == noErr, @"Couldn't update the Keychain Item." );
        }
        
        return;
    }
    
    secItem = [self dictionaryToSecItemFormat:@{(__bridge id) kSecValueData : value}];
    [secItem setObject:keyChainId forKey:(__bridge id) kSecAttrGeneric];
    [secItem setObject:keyChainId forKey:(__bridge id) kSecAttrAccount];
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef) secItem, NULL);
    NSAssert(status == noErr, @"Couldn't add the Keychain Item." );
}

+ (void)clearKeychain {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:(__bridge id) kSecClassGenericPassword forKey:(__bridge id) kSecClass];
    SecItemDelete((__bridge CFDictionaryRef) dict);
}

@end
