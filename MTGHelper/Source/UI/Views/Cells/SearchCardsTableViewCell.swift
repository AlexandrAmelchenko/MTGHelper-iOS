//
//  SearchCardsTableViewCell.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit

class SearchCardsTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var previewImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindWithCard(card : Card) {
        nameLabel.text = card.baseName
        previewImageView.load(card.imageSubUrlString, placeholderImageName: "cardBack")
    }
    
}
