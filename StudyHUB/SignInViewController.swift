//
//  SignInViewController.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/19/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    public var authenticated: Bool = false
    
    var mySender: ProfileViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func singIn(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController(title: "Senha incorreta", message: "Por favor, cheque sua senha e usuario.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {  (action:UIAlertAction) in
            print ("Pressionado")
        }))
        
        
        let user = email.text!
        let senha = password.text!
        
        if(user == "miguelsrochajr@gmail.com" &&  senha=="12345"){
            authenticated = true
            dismiss(animated: true, completion: nil)

            
            
        } else {
            self.present(alert, animated: true, completion: {
                print("Alerta completo")
            })
        }
    }
    
    func isAutenticated() -> Bool {
        return authenticated
    }


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showProfile"){
            if let profile = segue.destination as? ProfileViewController {
                profile.setPic()
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
