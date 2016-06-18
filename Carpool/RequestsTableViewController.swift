//
//  RequestsTableViewController.swift
//  Carpool
//
//  Created by Qi (Alvin) Jing on 2016-06-18.
//  Copyright © 2016 Qi (Alvin) Jing. All rights reserved.
//

import UIKit

class RequestsTableViewController: UITableViewController {
    
    @IBOutlet var requestsTableView: UITableView!
    
    var refresher: UIRefreshControl!
    
    var allResults = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestsTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
        refresher = UIRefreshControl()
        
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        refresher.addTarget(self, action: #selector(RequestsTableViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.addSubview(refresher)
        
        refresh()
        
    }

    func refresh(){
        
        let bucket = Kii.bucketWithName("Requests")
        
        // Build "all" query
        let allQuery = KiiQuery(clause: nil)
        
        // Get an array of KiiObjects by querying the bucket
        bucket.executeQuery(allQuery) { (query : KiiQuery?, bucket, results : [AnyObject]?, nextQuery : KiiQuery?, error : NSError?) -> Void in
            if error != nil {
                // Error handling
                return
            }
            
            self.allResults.removeAll()
            // Add all the results from this query to the total results
            self.allResults.appendContentsOf(results!)
            
            self.requestsTableView.reloadData()
            
            self.refresher.endRefreshing()
            
        }
        
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
        return allResults.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let str = "Latitude: " + String(allResults[indexPath.row].getObjectForKey("latitude")!) + " " + "Longtitude: " + String(allResults[indexPath.row].getObjectForKey("longtitude")!)
        
        cell.textLabel?.text = str

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
