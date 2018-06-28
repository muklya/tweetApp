//
//  ThirdView.swift
//  Twitter7
//
//  Created by Mukhamedjan on 18.04.17.
//  Copyright © 2017 sdu. All rights reserved.
//

import UIKit

class ThirdView: UIViewController {
    var login: String = "Text"
    
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = login
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
