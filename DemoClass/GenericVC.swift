//
//  GenericVC.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class GenericVC: UIViewController {

    var textView: UITextView! //Nhớ có dấu chấm than ở đây
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView = UITextView(frame: self.view.frame)
        self.textView.backgroundColor = UIColor.blackColor()
        self.textView.textColor = UIColor.greenColor()
        self.textView.font = UIFont(name: "Courier", size: 18)
        self.view.addSubview(self.textView)
    }
    
    func inRa(line: String) {
        var text = self.textView.text!  //nếu có lỗi thì thử thêm dấu than
        text += "\(line)\n"
        self.textView.text = text
        
        
    }
}
