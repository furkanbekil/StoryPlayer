//
//  FeedCell.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 21.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    // IBOutlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
    }
    
    func configureCell(item: FeedModel) {
        
        mainImage.image = UIImage.init(named: item.image)
        titleLabel.text = item.title
        
    }

}
