//
//  ViewController.swift
//  SantasJourney
//
//  Created by Leon Purser on 22/11/2018.
//  Copyright © 2018 Leon Purser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewOne: SwipeImageView!
    @IBOutlet weak var viewTwo: SwipeImageView!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
     viewOne.delegate = self
    
        viewOne.setImages(names: ["one", "two", "three", "two", "two", "two"])
        viewTwo.setImages(names: ["one", "two"])
        viewTwo.delegate = self

  }


}

extension ViewController: SwipeImageViewDelegate {
    
    func didSwipe(imageView: SwipeImageView) {
        
    }
    
}
