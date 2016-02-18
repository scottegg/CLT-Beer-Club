//
//  ViewController.swift
//  CLT Beer Club
//
//  Created by Scott Eggleston on 1/13/16.
//  Copyright © 2016 Scott Eggleston. All rights reserved.
//

import UIKit
import Parse

class MasterBreweryViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var masterBrewView0: UIView!
    @IBOutlet weak var masterBrewView1: UIView!
    @IBOutlet weak var masterBrewView2: UIView!
    @IBOutlet weak var masterBrewView3: UIView!

    //other properties
    let breweries = BreweryList().breweries
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //array of views
        let breweryViews = [masterBrewView0, masterBrewView1, masterBrewView2, masterBrewView3]
        
        for index in 0..<breweryViews.count {
            let brewery = breweries[index]
            for subview in breweryViews[index].subviews as [UIView] {
                if let label = subview as? UILabel {
                    label.text = brewery.nickname
                }
                if let logo = subview as? UIImageView {
                    logo.image = UIImage(named: brewery.logo)
                }
            }
            //setting tag value
            breweryViews[index].tag = index
        }
        
        //testing Parse
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "Scott wins."
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBreweryDetail" {
            let detailedBreweryViewController = segue.destinationViewController as! DetailedBreweryViewController
            let breweryButton = sender!.view as UIView!
            
            detailedBreweryViewController.breweryIndex = breweryButton.tag

        }
    }
    
    @IBAction func showBreweryDetail(sender: AnyObject) {
        performSegueWithIdentifier("showBreweryDetail", sender: sender)
    }
    

}

