//
//  HomeTableViewCell.swift
//  GG
//
//  Created by Felipe De La Torre on 12/6/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overViewLabel: UILabel!
    
    
    var game: Games! {
        didSet {
            titleLabel.text = game.title
            //overViewLabel.text = game.overView
            posterImageView.af_setImage(withURL: game.posterUrl!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
