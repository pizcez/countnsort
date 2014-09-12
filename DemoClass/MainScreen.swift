//
//  MainScreen.swift
//  DemoClass
//
//  Created by techmaster on 8/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class MainScreen: UITableViewController {

    var menuData:[[String: String]]
    let TITLE = "title"
    let CLASS = "class"
    
    override init(style: UITableViewStyle) {
        self.menuData = [
            [TITLE: "Shape", CLASS: "DemoShape" ],
            [TITLE: "Polymorphism", CLASS: "DemoPolymorphism" ]
        ]
        super.init(nibName: nil, bundle: nil)        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.menuData.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var resultCell: UITableViewCell
        if let cell = tableView.dequeueReusableCellWithIdentifier("id") as? UITableViewCell {
            resultCell = cell
        } else {
            resultCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "id")
            resultCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            let menu =  self.menuData[indexPath!.row]
            resultCell.textLabel.text = menu[TITLE]
        }

        return resultCell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let menu =  self.menuData[indexPath!.row]
        let detailVCClass: AnyClass = NSClassFromString(menu[CLASS])
     
        
        
        
    }

}
