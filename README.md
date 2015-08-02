# StatusBarKit

[![CI Status](http://img.shields.io/travis/Ryosuke Hiramatsu/StatusBarKit.svg?style=flat)](https://travis-ci.org/Ryosuke Hiramatsu/StatusBarKit)
[![Version](https://img.shields.io/cocoapods/v/StatusBarKit.svg?style=flat)](http://cocoapods.org/pods/StatusBarKit)
[![License](https://img.shields.io/cocoapods/l/StatusBarKit.svg?style=flat)](http://cocoapods.org/pods/StatusBarKit)
[![Platform](https://img.shields.io/cocoapods/p/StatusBarKit.svg?style=flat)](http://cocoapods.org/pods/StatusBarKit)

Customize your status bar like iOS 9.

"◀︎Back to Safari" and "apple.com▶︎"

![](https://raw.githubusercontent.com/himaratsu/StatusBarKit/master/Example/StatusBarKit/screenshot.png)

![](https://github.com/himaratsu/StatusBarKit/blob/master/Example/StatusBarKit/demo.gif)


## Usage

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let parameter = StatusViewParameter()
    parameter.leftItem = StatusViewItem(title: "◀︎Back to Safari") {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://yahoo.co.jp")!)
    }
    parameter.rightItem = StatusViewItem(title: "apple.com▶︎") {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://apple.com")!)
    }
    parameter.backgroundColor = navigationController?.navigationBar.barTintColor
    parameter.textColor = UIColor.whiteColor()
        
    StatusViewManager.show(parameter)
}
```

## Installation

### CocoaPods

StatusBarKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StatusBarKit"
```


### Manually

Just add the [Pod/Classes](https://github.com/himaratsu/StatusBarKit/tree/master/Pod/Classes) folder to your project.


## Requirements

* iOS 8 and later


## License

StatusBarKit is available under the MIT license. See the LICENSE file for more info.
