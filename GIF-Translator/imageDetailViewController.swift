//
//  ImageDetailViewController.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/13/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var imageInfo:GIFData?
    var searchTerm:String?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bottomToolbar.barTintColor = UIColor.blackColor()
        self.bottomToolbar.tintColor = lightPurpleColor
        self.bottomToolbar.layer.borderWidth = 0
        
        
        //self.bottomToolbar.layer.borderColor = lightPurpleColor.CGColor
        
//        var topLine = CALayer()
//        topLine.frame = CGRectMake(0.0, bottomToolbar.frame.height + 1, bottomToolbar.frame.width, 1.0)
//        topLine.backgroundColor = UIColor.whiteColor().CGColor
        //bottomToolbar.borderStyle = UITextBorderStyle.None
//        bottomToolbar.layer.addSublayer(topLine)
        
        if let imageInfo = imageInfo {
          gifImageView.sd_setImageWithURL(imageInfo.url)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let imageData = NSData(contentsOfURL: imageInfo!.url!)
        var vc = UIActivityViewController(activityItems: [imageData!], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
 
    
    
    override func viewWillAppear(animated: Bool) {
        self.extendedLayoutIncludesOpaqueBars = true
        self.tabBarController!.tabBar.hidden = true
        self.tabBarController!.tabBar.opaque = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController!.tabBar.hidden = false
        self.tabBarController!.tabBar.opaque = false
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
