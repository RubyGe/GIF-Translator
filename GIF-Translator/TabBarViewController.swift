//
//  TabBarViewController.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/12/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // UITabBar.appearance().barTintColor = UIColor.blackColor()
        UITabBar.appearance().tintColor = darkPurpleColor
        self.tabBar.frame.size.height = 100
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
