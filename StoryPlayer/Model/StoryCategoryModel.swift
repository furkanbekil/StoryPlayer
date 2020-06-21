//
//  StoryCategoryModel.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 19.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import Foundation
import UIKit

class StoryCategoryModel {
    
    
    let id: Int!
    var title: String!
    let image: String!
    let stories: [StoryDetailModel]?
    
    init(id: Int, title: String, image: String, stories: [StoryDetailModel]?) {
        
        self.id = id
        self.title = title
        self.image = image
        self.stories = stories
        
    }
    
}
