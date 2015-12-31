//
//  ViewController.swift
//  shareExtension
//
//  Created by mstcode on 31/12/15.
//  Copyright © 2015 mstcode. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    @IBOutlet var logoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // FACEBOOK BUTTON
    @IBAction func facebookButt(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fbSheet.setInitialText("Learn how to build iPhone apps")
            fbSheet.addImage(logoImage.image)
            fbSheet.addURL(NSURL(string: "http://www.mstcode.com"))
            presentViewController(fbSheet, animated: true, completion: nil)
        } else {
            self.showAlert("Facebook", msg: "Please login to your Facebook account in Settings")
        }
    }
    // TWITTER BUTTON
    @IBAction func twitterButt(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twSheet.setInitialText("Learn how to build iPhone apps")
            twSheet.addImage(logoImage.image)
            twSheet.addURL(NSURL(string: "http://www.mstcode.com"))
            presentViewController(twSheet, animated: true, completion: nil)
        } else {
            self.showAlert("Twitter",msg: "Please login to your Twitter account in Settings")
        }
    }
    
    func showAlert(title:String, msg : String) {
        let alert : UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // ACTIVITY CONTROLLER
    @IBAction func shareButt(sender: AnyObject) {
        if let myWebsite = NSURL(string: "http://www.mstcode.com")
        {
            let messageStr:String  = "Learn how to build iPhone apps"
            let img: UIImage = logoImage.image!
            let shareItems:Array = [messageStr, img, myWebsite]
            let activityController = UIActivityViewController(activityItems:shareItems, applicationActivities: nil)
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                activityController.popoverPresentationController?.sourceView = self.view
            }
            self.presentViewController(activityController, animated: true,completion: nil)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

