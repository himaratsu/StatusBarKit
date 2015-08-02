//
//  StatusWindow.swift
//  StatusBarSample
//
//  Created by himara2 on 2015/07/26.
//  Copyright (c) 2015年 himara2. All rights reserved.
//

import UIKit

class StatusWindow: UIWindow {

    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let statusFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 20)
        if CGRectContainsPoint(statusFrame, point) {
            for view in self.rootViewController?.view.subviews as! [UIView] {
                if let statusView = view as? StatusView {
                    return statusView
                }
            }
            return nil
        }
        return nil
    }

}
