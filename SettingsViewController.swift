//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/1/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingsScrollView.contentSize = settingsImage.frame.size
        settingsScrollView.frame.size = view.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapX(_ sender: AnyObject) {
        dismiss(animated: true) { 
        }
    }

    @IBAction func tapSignOutButton(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "For realz?", message: nil, preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Log out", style: .destructive) { (action) in
            self.performSegue(withIdentifier: "logoutSegue", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Stay logged in", style: .cancel) { (action) in}
        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
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
