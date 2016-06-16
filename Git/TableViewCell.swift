//
//  TableViewCell.swift
//  Git
//
//  Created by Bruno Colombini on 13/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit
import Cosmos

class TableViewCell: UITableViewCell {
    
    @IBOutlet var cosmosView: CosmosView?
    
    @IBOutlet var titulo : UILabel?

    @IBOutlet var poster: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cosmosView?.settings.fillMode = .Precise
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(titulo: String)
    {
        self.titulo?.text = titulo
    }
    
    func setRated(number: Double,votes: Int = 0)
    {
        if votes != 0{
            self.cosmosView?.text = "("+String(votes)+")"
        }
        self.cosmosView?.rating = number
    }

}
