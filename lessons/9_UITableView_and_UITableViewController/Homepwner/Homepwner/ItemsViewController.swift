//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Maia de Moraes, Jonathan H - 01 on 3/28/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var itemsOver50 = 0
        for i in itemStore.allItems {
            if i.valueInDollars > 50 {
                itemsOver50 += 1
            }
        }
        
        var itemsInSection = 0
        if section == 0 {
            itemsInSection = itemsOver50
        } else if section == 1 {
            itemsInSection = itemStore.allItems.count - itemsOver50
        }
        
        
        return itemsInSection
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ">50"
        } else {
            return "< or = 50"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        let row = indexPath.row
        
        var item: Item?
        var currentIndex = 0
        let section = indexPath.section
        
        for i in itemStore.allItems {
            if section == 0 && i.valueInDollars > 50 {
                currentIndex++
            } else if section == 1 && i.valueInDollars <= 50 {
                currentIndex++
            }
            if currentIndex - 1 == row {
                item = i
                break;
            }
        }
        
        cell.textLabel?.text = item!.name
        cell.detailTextLabel?.text = "$\(item!.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}