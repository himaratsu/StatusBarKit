//
//  StatusBarManager.swift
//  StatusBarSample
//
//  Created by himara2 on 2015/07/26.
//  Copyright (c) 2015年 himara2. All rights reserved.
//

import UIKit

public class StatusViewManager: UIView {

    private var overlayWindow: StatusWindow?
    private var topBar: StatusView?
    
    static let sharedManager = StatusViewManager()
    
    class public func show(parameter: StatusViewParameter) -> StatusView? {
        return sharedManager.show(parameter)
    }
    
    private func show(parameter: StatusViewParameter) -> StatusView? {
        if UIApplication.sharedApplication().statusBarHidden {
            return nil
        }
        
        topBar?.layer.removeAllAnimations()
        
        topBar?.parameter = parameter
        
        overlayWindow?.hidden = false
        
        return topBar
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTopBar()
        setUpOverlayWindow()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpOverlayWindow() {
        overlayWindow = StatusWindow(frame: UIScreen.mainScreen().bounds)
        overlayWindow?.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        overlayWindow?.backgroundColor = UIColor.clearColor()
        overlayWindow?.windowLevel = UIWindowLevelStatusBar
        overlayWindow?.rootViewController = UIViewController()
        overlayWindow?.rootViewController?.view.backgroundColor = UIColor.clearColor()
        
        overlayWindow?.rootViewController?.view.addSubview(topBar!)
        
        updateWindowTransform()
        updateTopBarFrameWithStatusBarFrame(UIApplication.sharedApplication().statusBarFrame)
    }
    
    private func updateWindowTransform() {
        let window = mainApplicationWindowIgnoringWindow(overlayWindow!)
        overlayWindow?.transform = window!.transform
        overlayWindow?.frame = window!.frame
    }
    
    private func updateTopBarFrameWithStatusBarFrame(rect: CGRect) {
        let width: CGFloat
        let height: CGFloat
        if rect.size.width > rect.size.height {
            width = rect.size.width
            height = rect.size.height
        } else {
            width = rect.size.height
            height = rect.size.width
        }
        topBar?.frame = CGRectMake(0, 0, width, height)
    }
    
    private func setUpTopBar() {
        topBar = StatusView()
    }
    
    private func mainApplicationWindowIgnoringWindow(ignoringWindow: UIWindow) -> UIWindow? {
        for window in UIApplication.sharedApplication().windows {
            if let window = window as? UIWindow {
                if !window.hidden && window != ignoringWindow {
                    return window
                }
            }
        }
        return nil
    }

}
