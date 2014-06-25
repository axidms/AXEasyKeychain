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

## Requirements

## Installation

AXEasyKeychain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AXEasyKeychain"

## Author

Alexander Mertvetsov, amertvetsov@yandex.ru

## License

AXEasyKeychain is available under the MIT license. See the LICENSE file for more info.

