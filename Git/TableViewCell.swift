//
//  TableViewCell.swift
//  Git
//
//  Created by Bruno Colombini on 13/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var titulo : UILabel?
    @IBOutlet var pontuacao: UILabel?
    @IBOutlet var poster: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
