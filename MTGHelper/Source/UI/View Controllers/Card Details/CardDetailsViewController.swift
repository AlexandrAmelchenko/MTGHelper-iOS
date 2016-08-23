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
    @IBOutlet var nameLabel : UILabel!
    var viewModel = CardDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.card?.baseName
        cardImageView.load(viewModel.card?.imageSubUrlString, placeholderImageName: "detailsCardBack")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
