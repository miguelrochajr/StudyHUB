//
//  ProfileViewController.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/19/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var Instituição: UILabel!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    
    @IBOutlet var popupLoging: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    var authenticated: Bool = false
    
    var autenticator: SignInViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        popupLoging.layer.cornerRadius = 10
        
        
        if(!authenticated){
            animateIn()
        }
        
        print("passou do perfomSegue")
    }
    @IBAction func dismissPopup(_ sender: UIButton) {
        animateOut()

        setPic()
    }
    
    public func setPic(){
        photo.image = UIImage(named: "foto_perfil")
    }
    
    
    func animateIn(){
        self.view.addSubview(popupLoging)
        popupLoging.center = self.view.center
        
        popupLoging.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupLoging.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.popupLoging.alpha = 1
            self.popupLoging.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.popupLoging.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupLoging.alpha = 0
            
            self.visualEffectView.effect = nil
        }) { (success: Bool) in
            self.popupLoging.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "askLogin"){
            
            if let newView = segue.destination as? SignInViewController{
                autenticator = newView
                newView.mySender = self
            }
            nome.text = "Miguel Rocha Jr."
            Instituição.text = "UFRN"
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
}
