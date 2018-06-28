//
//  ViewController.swift
//  Twitter7
//
//  Created by Mukhamedjan on 17.04.17.
//  Copyright © 2017 sdu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet var tf1: UITextField!
    @IBOutlet var tf2: UITextField!
    var logg:String = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        tf1.placeholder = "Email"
        tf2.placeholder = "Password"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signin(_ sender: UIButton) {
        if(tf1.text != "" && tf2.text != ""){
            logg = tf1.text!
            print(logg+"isTHAT")
            FIRAuth.auth()?.signIn(withEmail: tf1.text!, password: tf2.text!, completion: {(user, error) in
                if error == nil{
                    print(user?.email!)
                    self.performSegue(withIdentifier: "my2Seg", sender: self)
                }else{
                    let alertController = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Success!", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }else{
            let alertController = UIAlertController(title: "Error!", message: "You didn't write login or password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Success!", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "my2Seg"{
//            if let destination = segue.destination as? ThirdView{
//                print("preapre" + logg)
//            }
//        }
//    }
}

