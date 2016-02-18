//
//  BeerDetailViewController.swift
//  CLT Beer Club
//
//  Created by Scott Eggleston on 1/30/16.
//  Copyright © 2016 Scott Eggleston. All rights reserved.
//

import UIKit
import Parse

class BeerDetailViewController: UIViewController {

    //outlets
    @IBOutlet weak var beerTitleTextField: UITextField!
    @IBOutlet weak var beerNotesTextView: UITextView!
    @IBOutlet weak var likeSwitch: UISwitch!
    
    //other properties
    var beerId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // remove user interaction
        beerTitleTextField.userInteractionEnabled = false
        beerNotesTextView.userInteractionEnabled = false
        likeSwitch.userInteractionEnabled = false
        
        //query object and set values of properties
        var query = PFQuery(className: "Beer")
        query.getObjectInBackgroundWithId(beerId) {
            (item: PFObject?, error: NSError?) -> Void in
            if error == nil && item != nil {
                self.beerTitleTextField.text = item!["title"] as? String
                self.beerNotesTextView.text = item!["notes"] as? String
                let like = item!["like"] as? Bool
                if (like == false) {
                    self.likeSwitch.on = false
                }
            } else {
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
