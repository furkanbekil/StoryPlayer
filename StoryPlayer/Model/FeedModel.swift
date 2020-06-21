//
//  FeedModel.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 21.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import Foundation


class FeedModel {
    
    
    
    var title: String
    let image: String
    let link: String
    
    
    
    init(title: String, image: String, link: String) {
        
        self.title = title
        self.image = image
        self.link = link
        
    }
    
}
