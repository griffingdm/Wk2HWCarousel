//
//  LoginViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/1/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var signInActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet var motherView: UIView!
    @IBOutlet weak var navBarView: UIImageView!
    
    var ogButtonY: CGFloat!
    var ogButtonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        signInScrollView.delegate = self
        signInScrollView.contentSize = signInScrollView.frame.size
        signInScrollView.contentInset.bottom = 100
        
        ogButtonY = buttonParentView.frame.origin.y
        ogButtonOffset = -170
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            self.buttonParentView.frame.origin.y = self.ogButtonY + self.ogButtonOffset
            self.signInScrollView.contentOffset.y = self.signInScrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            self.buttonParentView.frame.origin.y = self.ogButtonY
            self.signInScrollView.contentOffset.y = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        signInScrollView.transform = transform
        navBarView.transform = transform
        signInScrollView.alpha = 0
        navBarView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) { 
            self.signInScrollView.transform = .identity
            self.navBarView.transform = .identity
            self.signInScrollView.alpha = 1
            self.navBarView.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBackArrow(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func passwordActionTriggered(_ sender: AnyObject) {
        tapSignInButton(self)
    }
    
    @IBAction func tapSignInButton(_ sender: AnyObject) {
        if signInField.text == "" || passwordField.text == "" {
            let alertController = UIAlertController(title: "Don't be silly.", message: "We can't read your mind, we gots to know your credentials.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Touche", style: .cancel, handler: { (action) in
            })
            
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: {
            })
        } else {
            signInActivityIndicator.startAnimating()
            delay(2, closure: {
                if self.signInField.text == "griffingdm@gmail.com" && self.passwordField.text == "abcd" {
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                } else {
                    print("failed")
                    
                    let failController = UIAlertController(title: "Whoops!", message: "We don't recognize that info.", preferredStyle: .alert)
                    let tryAgainAction = UIAlertAction(title: "Try Again", style: .cancel, handler: { (action) in
                    })
                    
                failController.addAction(tryAgainAction)
                self.present(failController, animated: true, completion: {
                        
                    })
                }
                
                self.signInActivityIndicator.stopAnimating()
            })
        }
    }
    
    @IBAction func tapOnScreen(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
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
