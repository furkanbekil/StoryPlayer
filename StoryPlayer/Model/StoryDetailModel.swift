//
//  StoryDetailModel.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 20.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import Foundation

class StoryDetailModel {
    
    
    let id: Int!
    var title: String!
    let media: String!
    let is_video: Int!
    
    
    init(id: Int, title: String, media: String, is_video: Int) {
        
        self.id = id
        self.title = title
        self.media = media
        self.is_video = is_video
    }
    
}
