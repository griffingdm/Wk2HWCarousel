//
//  TermsViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/2/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    let url = "https://www.dropbox.com/terms?mobile=1"
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Convert the url String to a NSURL object.
        let requestURL: URL! = URL(string:"\(url)")
        // Place the URL in a URL Request.
        let request: URLRequest! = URLRequest(url: requestURL)
        // Load Request into WebView.
        webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapDoneButton(_ sender: AnyObject) {
        dismiss(animated: true) {
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
