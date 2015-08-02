//
//  StatusViewItem.swift
//  StatusBarSample
//
//  Created by himara2 on 2015/07/26.
//  Copyright (c) 2015年 himara2. All rights reserved.
//

import UIKit

public class StatusViewItem: NSObject {
   
    var title: String?
    var action: (() -> Void)?
    
    public init(title: String?, action: (() -> Void)?) {
        self.title = title
        self.action = action
    }
}
