//
//  StatusView.swift
//  StatusBarSample
//
//  Created by himara2 on 2015/07/26.
//  Copyright (c) 2015年 himara2. All rights reserved.
//

import UIKit

public class StatusView: UIView {

    var leftItemLabel = UILabel()
    var rightItemLabel = UILabel()
    var parameter: StatusViewParameter? {
        didSet {
            construct()
        }
    }
    var itemBackgroundColor: UIColor = UIColor.clearColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func construct() {
        
        if parameter?.leftItem != nil {
            constructLeftItem()
        }
        if parameter?.rightItem != nil {
            constructRightItem()
        }
    }
    
    private func constructLeftItem() {
        leftItemLabel = UILabel(frame: CGRectMake(2, 0, 100, 20))
        leftItemLabel.text = parameter?.leftItem?.title
        leftItemLabel.textColor = parameter?.textColor
        leftItemLabel.backgroundColor = parameter?.backgroundColor
        leftItemLabel.textAlignment = NSTextAlignment.Left
        leftItemLabel.font = UIFont.systemFontOfSize(12)
        leftItemLabel.userInteractionEnabled = true
        addSubview(leftItemLabel)
    }
    
    private func constructRightItem() {
        rightItemLabel = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.size.width-102, 0, 100, 20))
        rightItemLabel.text = parameter?.rightItem?.title
        rightItemLabel.textColor = parameter?.textColor
        rightItemLabel.backgroundColor = parameter?.backgroundColor
        rightItemLabel.textAlignment = NSTextAlignment.Right
        rightItemLabel.font = UIFont.systemFontOfSize(12)
        rightItemLabel.userInteractionEnabled = true
        addSubview(rightItemLabel)
    }
    
    override public func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as? UITouch
        let point = touch?.locationInView(self.window)
        
        if CGRectContainsPoint(leftItemLabel.frame, point!) {
            leftItemTouched()
        } else if CGRectContainsPoint(rightItemLabel.frame, point!) {
            rightItemTouched()
        }
    }
    
    private func leftItemTouched() {
        parameter?.leftItem?.action?()
    }
    
    private func rightItemTouched() {
        parameter?.rightItem?.action?()
    }
}

extension UIColor {
    func rgba() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let components = CGColorGetComponents(CGColor)
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = CGColorGetAlpha(CGColor)
        return (red, green, blue, alpha)
    }
    
    func colorWithAddingAlpha(alpha: CGFloat) -> UIColor {
        let (r, g, b, _) = rgba()
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
