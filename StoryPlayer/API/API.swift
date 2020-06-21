//
//  API.swift
//  StoryPlayer
//
//  Created by Furkan Bekil on 20.06.2020.
//  Copyright © 2020 Furkan Bekil. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


let apiUrl = "http://bekil.net/"


func fetchData(endpoint: String, parameters: [String: AnyObject]?, completion: @escaping (JSON) -> ()) {
    
    let header = [String : String]()
    
    Alamofire.request(apiUrl+endpoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header)
        .responseJSON { response in
            
            switch response.result {
            case .success(let value):
                completion(JSON(value))
            case .failure(let error):
                print(error)
            }
    }
    
}
