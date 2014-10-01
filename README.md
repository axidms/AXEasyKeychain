# AXEasyKeychain

[![Version](https://img.shields.io/cocoapods/v/AXEasyKeychain.svg?style=flat)](http://cocoadocs.org/docsets/AXEasyKeychain)
[![License](https://img.shields.io/cocoapods/l/AXEasyKeychain.svg?style=flat)](http://cocoadocs.org/docsets/AXEasyKeychain)
[![Platform](https://img.shields.io/cocoapods/p/AXEasyKeychain.svg?style=flat)](http://cocoadocs.org/docsets/AXEasyKeychain)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

 Creates or updates new item with the provided value and ID:

```ObjectiveC
	[AXEasyKeychainWrapper updateValue:@"value" withId:@"KeychainId"];
```

Returns value for provided ID:

```ObjectiveC
	NSString *value = [AXEasyKeychainWrapper valueById:@"KeychainId"];
```

Remove all items:

```ObjectiveC
	[AXEasyKeychainWrapper clearKeychain];
```

Creates or update key value pairs with the provided ID:

```ObjectiveC
	[AXEasyKeychainWrapper updateValue:@"value" forKey:@"key1" withId:@"DictionaryKeychainId"];
	[AXEasyKeychainWrapper updateValue:@"value" forKey:@"key2" withId:@"DictionaryKeychainId"];
	[AXEasyKeychainWrapper updateValue:@"value" forKey:@"key3" withId:@"DictionaryKeychainId"];
```

Returns dictionary for provided ID:

```ObjectiveC
	NSDictionary *dictionary = [AXEasyKeychainWrapper dictionaryById:@"DictionaryKeychainId"]
```

Remove value by key and for provided ID:

```ObjectiveC
	[AXEasyKeychainWrapper removeValueByKey:@"key2" withId:@"DictionaryKeychainId"]
```

## Requirements

## Installation

AXEasyKeychain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AXEasyKeychain"

## Author

Alexander Mertvetsov, amertvetsov@yandex.ru

## License

AXEasyKeychain is available under the MIT license. See the LICENSE file for more info.

