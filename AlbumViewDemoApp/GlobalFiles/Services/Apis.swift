//
//  Apis.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import Foundation

let baseUrl = "https://picsum.photos/"

struct Apis {

    static let getPhotosList = baseUrl + "list"
    
    static let getImageUrl = baseUrl + "300/300?image=%@"
}
