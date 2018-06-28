//
//  TweetViewController.swift
//  Twitter7
//
//  Created by Mukhamedjan on 18.04.17.
//  Copyright © 2017 sdu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TweetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref: FIRDatabaseReference?
    var tweets:[Tweet] = Array()
    
    @IBOutlet var my_table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference().child("tweet-object")
        ref?.observe(.value, with: { (snapshot:FIRDataSnapshot) in
            self.tweets.removeAll()
            for snap in snapshot.children{
                let tweet = Tweet(snapshot:snap as! FIRDataSnapshot)
                self.tweets.append(tweet)
            }
            self.my_table.reloadData()
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusPressed(_ sender: UIBarButtonItem) {
        var website_title : UITextField?
        let alertcontroller = UIAlertController(title: "New Tweet", message: "Smth", preferredStyle: .alert)
        let add_action = UIAlertAction(title: "Add", style: .default){
            (action) in
            let content = website_title?.text
            let tweet = Tweet(content: content!, addedByUser:"muklia_97@mail.ru")
            let tweetRef = self.ref?.child((content?.lowercased())!)
            tweetRef?.setValue(tweet.toAnyObject())
        }
        alertcontroller.addTextField { (txtTitle) in
            website_title = txtTitle
            website_title?.placeholder = "Enter Tweet"
        }
        alertcontroller.addAction(add_action)
        self.present(alertcontroller,animated: true,completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = tweets[indexPath.row].content
        cell.detailTextLabel?.text = tweets[indexPath.row].addedByUser
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
