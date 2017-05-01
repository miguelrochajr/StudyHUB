//
//  HomeViewController.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var navigationLogo: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//     Setup StudyHUB logo onto the title of the image
//        let logo = UIImage(named: "logo-studyhub")
//        let mylogoView = UIImageView(image: logo)
//        mylogoView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
//        mylogoView.contentMode = .scaleAspectFit
//        self.navigationLogo.titleView = mylogoView
        
        

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
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSearchResults"{
            let searchText = searchBar.text!
            if let newView = segue.destination as? CourseListTableViewController {
                newView.searchedKeyword = searchText
            }
        }
    }
    

}
