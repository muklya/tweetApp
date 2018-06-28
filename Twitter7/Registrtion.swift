//
//  Registrtion.swift
//  Twitter7
//
//  Created by Mukhamedjan on 18.04.17.
//  Copyright © 2017 sdu. All rights reserved.
//

import UIKit
import Firebase

class Registrtion: UIViewController {

    @IBOutlet var textf1: UITextField!
    @IBOutlet var textf2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registr(_ sender: UIButton) {
        if textf1.text == "" || textf2.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please fill the gaps", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Success!", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.createUser(withEmail: textf1.text!, password: textf2.text!, completion: {(user, error) in
                if error == nil{
//                    self.performSegue(withIdentifier: "Segue2", sender: self)
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "mySegue"{
                                if let destination = segue.destination as? ViewController {
                                    print(destination)
                                }
                            }
                        }
                    print(user?.email!)
                }
                else{
                    let alertController = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Success!", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }})
            
        }
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
