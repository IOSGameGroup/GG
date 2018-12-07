//
//  Games.swift
//  GG
//
//  Created by Felipe De La Torre on 12/6/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import Foundation

class Games {
    
    var title: String
    var posterUrl: URL?
    //var releaseDate: Int
    //var overView : String
    //var backDrop : URL?
    
    
    init(dictionary: [String: Any]) {
        title = dictionary["name"] as? String ?? "No title"
        //releaseDate = dictionary["created_at"] as? String ?? "No release date"
        //overView = dictionary["overview"] as? String ?? "No overview"
        
        let posterPath = dictionary["cover/"] as? String ?? "No poster path"
        let backDropPath = dictionary["backdrop_path"] as? String ?? "No back drop path"
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        //posterUrl = URL(string: baseURLString + posterPath)
        //backDrop = URL(string: baseURLString + backDropPath)
    }
    
    //convert dictionary to movie
    class func games(dictionaries: [[String: Any]]) -> [Games] {
        var games: [Games] = []
        for dictionary in dictionaries {
            let game = Games(dictionary: dictionary)
            games.append(game)
        }
        
        return games
    }
}
