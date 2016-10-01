//
//  IntroScreenViewController.swift
//  Carousel
//
//  Created by Mullins, Griffin on 10/1/16.
//  Copyright © 2016 Mullins, Griffin. All rights reserved.
//

import UIKit

class IntroScreenViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!

    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var threeImageView: UIImageView!
    @IBOutlet weak var fourImageView: UIImageView!
    @IBOutlet weak var fiveImageView: UIImageView!
    @IBOutlet weak var twoImageView: UIImageView!
    @IBOutlet weak var sixImageView: UIImageView!
    
    // Arrays of initial transform values for tiles
    var yOffsets : [Float] = [-410, -350, -340, -408, -480, -409]
    var xOffsets : [Float] = [-69, 18, 37, -30, 5, -65]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-0.5, -0.13, 0.32, 0.42, 0.2, 0.11]
    var tiles: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tiles = [oneImageView, twoImageView, threeImageView, fourImageView, fiveImageView, sixImageView]

        // Do any additional setup after loading the view.
        introScrollView.delegate = self
        introScrollView.contentSize = introImageView.frame.size
        introScrollView.frame.size = view.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSignInButton(_ sender: AnyObject) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yScroll = scrollView.contentOffset.y
        
        //print("intro scroll \(yScroll)")
        
        for (index, tile) in tiles.enumerated() {
            let ty = convertValue(yScroll, r1Min: -20, r1Max: 568, r2Min: CGFloat(yOffsets[index]), r2Max: 0)
            
            let tx = convertValue(yScroll, r1Min: -20, r1Max: 568, r2Min: CGFloat(xOffsets[index]), r2Max: 0)
            
            let scl = convertValue(yScroll, r1Min: -20, r1Max: 568, r2Min: CGFloat(scales[index]), r2Max: 1)
            
            let rot = convertValue(yScroll, r1Min: -20, r1Max: 568, r2Min: CGFloat(rotations[index]), r2Max: 0)
            
            let trans = CGAffineTransform(translationX: tx, y: ty)
            let transScale = trans.scaledBy(x: scl, y: scl)
            let rotTransScale = transScale.rotated(by: rot)
            
            tile.transform = rotTransScale
            
            print("rotation \(rot)")
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
