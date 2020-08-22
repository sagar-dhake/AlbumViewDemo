//
//  UserListViewModel.swift
//  ArticleDemoAPP
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import Foundation

class AlbumListViewModel {
                
    //MARK: Fetch Album Data
    
    func fetchAlbumList(success: @escaping ([Album]) -> (),failure: @escaping (Error) -> ())
    {
        let url = Apis.getPhotosList
        
        NetworkService.getRequest(url: url, success: { (data) in
           if let data = data,
                let albumList = try? JSONDecoder().decode([Album].self, from: data) {
                success(albumList)
            }
        }) { (error) in
            failure(error)
        }
    }
}
