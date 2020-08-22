//
//  NetworkService.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import Foundation

class NetworkService: NSObject {
    
    static let networkService = NetworkService()
    
    class func getRequest(url:String, success: @escaping (Data?) -> (),failure: @escaping (Error) -> ()) {
        let url = URL(string: url)!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            failure(error)
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                200 == httpResponse.statusCode else {
            return
          }
          
          success(data)
        })
        task.resume()
    }
}
