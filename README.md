# DTLoadingButton

[![Version](https://img.shields.io/cocoapods/v/DTLoadingButton.svg?style=flat)](http://cocoapods.org/pods/DTLoadingButton)
[![License](https://img.shields.io/cocoapods/l/DTLoadingButton.svg?style=flat)](http://cocoapods.org/pods/DTLoadingButton)
[![Platform](https://img.shields.io/cocoapods/p/DTLoadingButton.svg?style=flat)](http://cocoapods.org/pods/DTLoadingButton)

![Demo gif](https://github.com/trongcuong1710/DTLoadingButton/blob/master/DTLoadingButton.gif)

## Summary

This is a custom button to show loading state with an activity indicator sit next to title label. When on loading state (startAnimating), `userInteraction` will be disable.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8 or above

## Installation

DTLoadingButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DTLoadingButton"
```

## How to use

Initialize via code

```swift
let button = DTLoadingButton(type: .Custom)
button.frame = CGRectMake(100, 100, 300, 40)

self.addSubview(button)
```

Start animating

```swift
button.startAnimating
```

Stop animating

```swift
button.stopAnimating
```

You can also use this with Interface Builder by dragging an UIButton to your view controller. Set class to `DTLoadingButton`.

![Interface Builder](https://github.com/trongcuong1710/DTLoadingButton/blob/master/Screen.Shot.2016-03-02.at.12.02.44.png)

*Note* You must set button type to `Custom` to avoid flickering when `start` and `stop` animating.

## Customization

```swift
self.disabledTextColor: UIColor! = UIColor.whiteColor()
self.enabledTextColor: UIColor! = UIColor.whiteColor()
self.disabledBackgroundColor: UIColor! = UIColor(red: 0, green: 131.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
self.enabledBackgroundColor: UIColor! = UIColor(red: 0, green: 152.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0) 
self.indicatorViewLineWidth: CGFloat = 2.0 
self.indicatorColor: UIColor! = UIColor.lightGrayColor() 
self.normalText: String! = "" 
self.loadingText: String! = "LOADING..."
```

## License

DTLoadingButton is available under the MIT license. See the LICENSE file for more info.
