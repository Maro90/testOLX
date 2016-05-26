//
//  ItemTableViewCell.swift
//  TestOLX
//
//  Created by Mauro Gonzalez on 5/24/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel        : UILabel!
    @IBOutlet var priceLabel        : UILabel!
    @IBOutlet var descriptionLabel  : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(data: Item){
    
        self.titleLabel.text = data.getTitle()
        self.descriptionLabel.text = data.getItemDescription()
        self.priceLabel.text = data.getPrice()
    
    }

}
