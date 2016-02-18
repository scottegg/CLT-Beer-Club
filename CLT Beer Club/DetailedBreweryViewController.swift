//
//  DetailedBreweryViewController.swift
//  CLT Beer Club
//
//  Created by Scott Eggleston on 1/13/16.
//  Copyright © 2016 Scott Eggleston. All rights reserved.
//

import UIKit

class DetailedBreweryViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var breweryNameLabel: UILabel!
    @IBOutlet weak var tourInfoLabel: UILabel!
    @IBOutlet weak var breweryDescriptionLabel: UILabel!
    
    //other properties
    let breweryList = BreweryList()
    var brewery: Brewery = Brewery(id: 1, name: "Birdsong", nickname: "Birdsong", logo: "birdsong.png", description: "Birdsong Brewing was founded in 2011 by a group of friends who share a love for both great beer and great people. We started with a five-gallon soup kettle and a vision inspired by some of our favorite craft breweries. The idea was simple: brew flavorful, unfiltered quality craft beer and bring that to Charlotte, NC.", tourTime: "Thursdays at 6:30pm", addressLink: "http://maps.apple.com/?address=1016,North+Davidson+Street,Charlotte,North+Carolina")
    var breweryIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brewery = breweryList.breweries[breweryIndex]
        
        //set properties
        breweryNameLabel.text = brewery.name
        tourInfoLabel.text = brewery.tourTime
        breweryDescriptionLabel.text = brewery.description
        self.title = brewery.nickname
        logoImage.image = UIImage(named: brewery.logo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func mapsButton(sender: AnyObject) {
        if let url = NSURL(string: brewery.addressLink) {
            UIApplication.sharedApplication().openURL(url)
        }
    }


}
