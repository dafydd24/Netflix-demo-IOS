//
//  ViewController.swift
//  Netflix
//
//  Created by ec2-user on 8/30/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPasswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGIN") == true{
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVc, animated: false)
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func authenticate(_ sender: Any) {
        if txtEmail.text == "test" && txtPasswd.text == "test" {
            UserDefaults.standard.set(true,forKey: "ISUSERLOGIN")
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVc, animated: true)
        }
    }
    
}

