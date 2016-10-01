//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/1/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var backSpinButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tutorialScrollView.delegate = self
        tutorialScrollView.frame.size = view.frame.size
        tutorialScrollView.contentSize = CGSize(width: view.frame.width * 4, height: view.frame.height)
        
        backSpinButtonView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     // called when scroll view grinds to a halt
        print("stopped")
        tutorialPageControl.currentPage = Int(tutorialScrollView.contentOffset.x / view.frame.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled to \(scrollView.contentOffset.x)")
        if scrollView.contentOffset.x > 640 {
            backSpinButtonView.alpha = (scrollView.contentOffset.x - 640)/320
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
