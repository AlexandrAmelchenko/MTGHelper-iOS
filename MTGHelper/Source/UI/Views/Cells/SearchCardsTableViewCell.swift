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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindWithCard(card : Card) {
        self.nameLabel.text = card.baseName
    }
    
}
