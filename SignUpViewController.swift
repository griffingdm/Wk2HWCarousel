//
//  SignUpViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/2/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createButtonParentView: UIView!
    
    let scrollInset: CGFloat! = 100
    let buttonOffset: CGFloat! = -110
    var ogButtonY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = view.frame.size
        scrollView.contentInset.bottom = scrollInset
        ogButtonY = createButtonParentView.frame.origin.y

        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            self.createButtonParentView.frame.origin.y = self.ogButtonY + self.buttonOffset
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            self.scrollView.contentOffset.y = 0
            self.createButtonParentView.frame.origin.y = self.ogButtonY
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapCheckBox(_ sender: AnyObject) {
        if checkBoxImage.image == UIImage(named: "check_box")  {
            checkBoxImage.image = UIImage(named: "check_box_selected")
        } else {
            checkBoxImage.image = UIImage(named: "check_box")
        }
    }

    @IBAction func tapBackButton(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func tapCreateButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "createSegue", sender: nil)
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
