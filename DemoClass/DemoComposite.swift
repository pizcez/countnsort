//
//  DemoComposite.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoComposite: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoComposite()
    }
    
    func demoComposite() {
        let c1 = Composite(real: 1, imagine: 2)
        let c2 = Composite(real: 3, imagine: 5)
        let c3 = c1 + c2
        let c4 = c1 - c2
        let c5 = c1 ** c2
        self.inRa("\(c1.description)\n")
        self.inRa("\(c2.description)\n")
        
        self.inRa("\(c3.description)\n")
        self.inRa("\(c4.description)\n")
        self.inRa("\(c5.description)\n")

    
    }

    
}
