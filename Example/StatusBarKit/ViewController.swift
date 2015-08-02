//
//  ViewController.swift
//  StatusBarKit
//
//  Created by Ryosuke Hiramatsu on 08/02/2015.
//  Copyright (c) 2015 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit
import StatusBarKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let parameter = StatusViewParameter()
        
        let leftItem = StatusViewItem(title: "◀︎Back to Safari") {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://yahoo.co.jp")!)
        }
        let rightItem = StatusViewItem(title: "apple.com▶︎") {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://apple.com")!)
        }
        
        parameter.leftItem = leftItem
        parameter.rightItem = rightItem
        parameter.backgroundColor = navigationController?.navigationBar.barTintColor
        parameter.textColor = UIColor.whiteColor()
        
        
        StatusViewManager.show(parameter)
        
    }

}

