//
//  SearchViewController.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/12/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBoxTextField: UITextField!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadlineLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
//    @IBOutlet weak var randomButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = true
        searchBoxTextField.layer.borderWidth = 1
        searchBoxTextField.layer.cornerRadius = 3
        searchBoxTextField.layer.borderColor = darkPurpleBackgroundColor.CGColor
        
        headlineLabel.textColor = darkPurpleBackgroundColor
        subheadlineLabel.textColor = darkPurpleColor
        
        //translateButton.layer.borderWidth = 1
        translateButton.layer.cornerRadius = 3
        //translateButton.backgroundColor = lightPurpleColor
        translateButton.setTitleColor(darkPurpleColor, forState: UIControlState.Normal)
        translateButton.setTitleColor(lightPurpleColor, forState: UIControlState.Highlighted)
        
        //randomButton.layer.borderWidth = 1
        //randomButton.layer.cornerRadius = 3
        //randomButton.backgroundColor = lightPurpleColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! SearchResultsTableViewController
        destinationViewController.searchTerm = searchBoxTextField.text
        print(destinationViewController.searchTerm!)
        // Pass the selected object to the new view controller.
    }
    

}
