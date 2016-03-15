//
//  SearchViewController.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/12/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {


    @IBAction func editingChanged(sender: UITextField) {
        print("Editing Changed: \(sender.text)")
        if sender.text == "" {
            self.translateButton.enabled = false
        } else {
            self.translateButton.enabled = true
        }
    }
    
    @IBAction func translateButtonTouchDown(sender: UIButton) {
        sender.backgroundColor = buttonTouchedBackgroundColor
    }
    
    @IBAction func translateButtonTouchUpInside(sender: UIButton) {
        sender.backgroundColor = buttonBackgroundColor
    }
    
    
    
    @IBOutlet weak var searchBoxTextField: UITextField!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadlineLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    

    @IBAction func tapScreen(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
//    @IBOutlet weak var randomButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = true
        self.searchBoxTextField.delegate = self
        
        self.searchBoxTextField.layer.borderWidth = 1
        self.searchBoxTextField.layer.cornerRadius = 3
        self.searchBoxTextField.layer.borderColor = darkPurpleBackgroundColor.CGColor
        
        self.headlineLabel.textColor = darkPurpleBackgroundColor
        self.subheadlineLabel.textColor = darkPurpleColor
        
        //translateButton.layer.borderWidth = 1
        self.translateButton.layer.cornerRadius = 3
        self.translateButton.backgroundColor = buttonBackgroundColor
        self.translateButton.setTitleColor(darkPurpleColor, forState: UIControlState.Normal)
        self.translateButton.setTitleColor(darkPurpleTransparentColor, forState: UIControlState.Highlighted)
        self.translateButton.setTitleColor(darkPurpleTransparentColor, forState: UIControlState.Disabled)
        
        //randomButton.layer.borderWidth = 1
        //randomButton.layer.cornerRadius = 3
        //randomButton.backgroundColor = lightPurpleColor
        
        translateButton.enabled = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //textField code
        
        
        //textField.resignFirstResponder()  //if desired
        
        if textField.text != "" {
            performSegueWithIdentifier("showSearchResults", sender: nil)
        }
        return true
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
