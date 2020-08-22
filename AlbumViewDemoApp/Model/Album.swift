//
//  Album.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import Foundation

struct Album: Decodable {
    var id: Int
    var format: String
    var width: Int
    var height: Int
    var fileName: String
    var author: String
    var authorUrl: String
    var postUrl: String
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case format = "format"
        case width = "width"
        case height = "height"
        case fileName = "filename"
        case author = "author"
        case authorUrl = "author_url"
        case postUrl = "post_url"
    }
}
