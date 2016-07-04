//
//  CardDetailsViewController.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    @IBOutlet var cardImageView : UIImageView!
    var viewModel = CardDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.load(viewModel.card?.imageSubUrlString, placeholderImageName: "detailsCardBack")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
