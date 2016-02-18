//
//  TableViewController.swift
//  CLT Beer Club
//
//  Created by Scott Eggleston on 1/30/16.
//  Copyright © 2016 Scott Eggleston. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewController: PFQueryTableViewController {
    
    var breweryId = 2
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "Beer"
        pullToRefreshEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "Beer"
        pullToRefreshEnabled = true
    }
    
    override func queryForTable() -> PFQuery {
        
        // our query to parse asking for objects of a certain class
        let query = PFQuery(className: self.parseClassName!)
        
        //narrowing the scope to only show beers related to current brewery
        query.whereKey("breweryId", equalTo: breweryId)
        query.orderByDescending("createdAt")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        // Configure the cell to show beer information
        if let object = object {
            cell!.textLabel?.text = object["title"] as? String
        }
        
        return cell
    }
    
    //allow selected cell to be a segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showBeerDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showBeerDetail") {
            var beerDetailScene = segue.destinationViewController as! BeerDetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let row = Int(indexPath.row)
                let object = objects?[row]
                beerDetailScene.beerId = object!.objectId!
            }
            
        }
        
        
        
    }
    
    
}