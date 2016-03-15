//
//  SearchResultsTableViewController.swift
//  GIF-Translator
//
//  Created by Genie Guo on 3/13/16.
//  Copyright © 2016 Genie Guo. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage


class SearchResultsTableViewController: UITableViewController {
    
    let apiKey = "dc6zaTOxFJmzC"
    var searchResultsList:[GIFData] = []
    var searchTerm:String?
    var resultCount = 0
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var endpoint = ""
        self.tableView.separatorColor = UIColor.clearColor()
        
        
        if let searchTerm = searchTerm
        {
            self.title = searchTerm
            let escapedString = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
            endpoint = "http://api.giphy.com/v1/gifs/search?q=\(escapedString!)&limit=7&api_key=\(apiKey)"
            //print(endpoint)
        }
        else {
            endpoint = "http://api.giphy.com/v1/gifs/search?q=&api_key=\(apiKey)"
        }
        loadData(endpoint)
    }
    
    func loadData(urlString: String) {
        if let url = NSURL(string: urlString) {
            
            print ("valid url")
            if let data = try? NSData(contentsOfURL: url, options: []) {
                
                print ("we got data")
                let json = JSON(data: data)
                
                if json["meta"]["status"].intValue == 200
                {
                    print("Successfully fetched data")
                    resultCount = json["pagination"]["count"].intValue
                    if resultCount > 0 {
                        print("# of search results:")
                        //let array = json["data"].arrayValue
                        //print(array[0]["id"].stringValue)
                        print(resultCount)
                        
                        // 2. parse data
                        parseData(json)
                        
                    } else {
                        print("no results fetched") //@To-do set the view to display the message
                        
                    }
                }
            }
        }
        else
        {
            print("error")
        }
    }
    
    func parseData(json:JSON) {
        for result in json["data"].arrayValue {
            var searchResult = GIFData()
            //get id value
            searchResult.id = result["id"].stringValue
            //locate image info
            let image = result["images"]["fixed_width"].dictionaryValue
            //get image info
            searchResult.url = NSURL(string: (image["url"]?.stringValue)!)
            let size = Size(width:image["width"]?.intValue, height:image["height"]?.intValue, fileSize: image["size"]?.intValue)
            searchResult.size = size
            searchResultsList.append(searchResult)
        }
        print("sucessfully parsed all data, results:\(searchResultsList.count)")
    
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultCount
    }
    
//    func getImageHeight(size:Size, screenWidth:CGFloat) ->Double {
//    //    let size = searchResultsList[indexPath.row].size
//        let originalHeight = Double(size.height!)
//        let originalWidth = Double(size.width!)
//         print("Original Heigh:\(originalHeight), Original Width: \(originalWidth)")
//        let width = Double(self.tableView.frame.size.width) - 16.0
//        let height = originalHeight * width / originalWidth
//        return height
//    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let size = searchResultsList[indexPath.row].size
        let screenWidth = self.tableView.frame.size.width
        let height = getImageHeight(size!, screenWidth: screenWidth)
        print("Height for row at index path \(indexPath.row): \(height)")
        return CGFloat(height + 16.0)
        
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let resultCell = cell as! ResultsTableViewCell
//        let size = searchResultsList[indexPath.row].size
//        
//        let originalHeight = size!.height!
//        let originalWidth = size!.width!
        
        
//        let height = getImageHeight(indexPath)
//        resultCell.gifImageView.frame.size.height = height
//        resultCell.cardView.frame.size.height = height + 30
        
        if let imageURL = searchResultsList[indexPath.row].url
        {
            let size = searchResultsList[indexPath.row].size
            let screenWidth = self.tableView.frame.size.width
            let height = getImageHeight(size!, screenWidth:screenWidth)
            let width = Double(self.tableView.frame.size.width) - 16.00
            print("imageView width:\(width)")
            print("imageView height:\(height)")
            
            resultCell.gifImageView.frame.size.width = CGFloat(width)
            resultCell.gifImageView.frame.size.height = CGFloat(height)
            resultCell.gifImageView.contentMode = .ScaleAspectFill
            print("Image View at index path \(indexPath.row):     height: \(height)    width: \(width)")
            resultCell.gifImageView.sd_setImageWithURL(imageURL)
            
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchResultCell", forIndexPath: indexPath)
        if let resultCell = cell as? ResultsTableViewCell {
            resultCell.gifImageView?.image = nil
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! ImageDetailViewController
        if let path = tableView.indexPathForSelectedRow?.row {
            destinationViewController.imageInfo = searchResultsList[path]
        }
        destinationViewController.searchTerm = searchTerm
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
