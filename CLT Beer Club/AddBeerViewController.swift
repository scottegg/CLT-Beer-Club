//
//  AddBeerViewController.swift
//  CLT Beer Club
//
//  Created by Scott Eggleston on 1/30/16.
//  Copyright © 2016 Scott Eggleston. All rights reserved.
//

import UIKit
import Parse

class AddBeerViewController: UIViewController {

    @IBOutlet weak var beerTitleTextField: UITextField!
    
    @IBOutlet weak var beerNotesTextView: UITextView!
    
    @IBOutlet weak var likeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBarButton(sender: AnyObject) {
        var beer = PFObject(className: "Beer")
        beer["title"] = beerTitleTextField.text
        beer["notes"] = beerNotesTextView.text
        beer["breweryId"] = 2
        
        if likeSwitch.on {
            beer["like"] = true
        } else {
            beer["like"] = false
        }
        
        beer.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Object \(beer["title"]) saved")
            } else {
                print("Issue saving \(beer["title"])")
            }
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
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
