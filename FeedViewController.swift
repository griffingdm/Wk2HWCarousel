//
//  FeedViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/1/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedScrollView.contentSize = feedImage.frame.size
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

}
