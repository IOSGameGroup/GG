//
//  GameApiManager.swift
//  GG
//
//  Created by Felipe De La Torre on 12/6/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import Foundation


class GamesApiManager {
    
    static let baseUrl = "https://api-2445582011268.apicast.io/games/"
    static let apiKey = "338399f39ef086984919b17e11171de4"
    
    func nowPlayingGames(completion: @escaping ([Games]?, Error?) -> ()) {
        
        
        
        let url = URL(string: GamesApiManager.baseUrl)!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["user-key" : "338399f39ef086984919b17e11171de4" , "Accept" : "application/json" ]
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                print(dataDictionary)
                
                //let games = Games.games(dictionaries: gamesDictionaries)
                completion(nil, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
