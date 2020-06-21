//
//  StoryCell.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 19.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import UIKit
import Kingfisher

class storyCell: UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyTitleLbl: UILabel!
    
 
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
    }
    
    func configureCell(item: StoryCategoryModel) {
        
        self.storyImage.layer.cornerRadius = self.storyImage.frame.width / 2
        let url = URL(string: item.image)
        storyImage.kf.setImage(with: url)
        self.storyTitleLbl.text = item.title
        
        self.storyImage.layer.borderWidth = 2
        
    }
    
}
