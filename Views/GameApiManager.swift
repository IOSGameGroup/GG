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
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func nowPlayingGames(completion: @escaping ([Games]?, Error?) -> ()) {
        let url = URL(string: GamesApiManager.baseUrl + "72161")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let gamesDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                let games = Games.games(dictionaries: gamesDictionaries)
                completion(games, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
