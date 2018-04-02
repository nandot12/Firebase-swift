//
//  ViewController.swift
//  Firebase IOS
//
//  Created by Nando Septian Husni on 3/28/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController,GIDSignInUIDelegate {
  var ref: DatabaseReference!
    
    
    @IBOutlet weak var input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        ref = Database.database().reference()
        
        //get data from firebase
        
        ref.child("users").observe(.value, with: { (responseFirebase) in
            
            //check response
            if responseFirebase.childrenCount > 0 {
                
                for data in responseFirebase.children.allObjects as! [DataSnapshot] {
                    
                    let all  = data.value
                    
                    print(all)
                    
                    
                }
                
                
            }
            
        }) { (salah) in
            print(salah)
        }
        
       // l
       
        
        //
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actiontambah(_ sender: Any) {
        let id = ref.childByAutoId().key
        
        ref.child("users").child(id).setValue(["username": input.text])
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

