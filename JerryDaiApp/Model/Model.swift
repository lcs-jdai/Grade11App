//
//  Model.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-15.
//

import Foundation

struct JaySong: Identifiable {

    let id = UUID()
    let imageName: String
    let songName: String
    let singerName: String
    let songResource: String
    let albumImage: String
}


let listOfItems = [

    JaySong(imageName: "stepasideimg", songName: "Step Aside", singerName: "By: Jay Chou", songResource: "stepaside", albumImage: "stepasideimg"),

    JaySong(imageName: "sd", songName: "Ricefield", singerName: "By: Jay Chou", songResource: "ricefield", albumImage: "sd"),

    JaySong(imageName: "rc", songName: "Sunny Day", singerName: "By: Jay Chou", songResource: "sunnyday", albumImage: "rc"),
    
    JaySong(imageName: "albumimg", songName: "All The Way North", singerName: "By: Jay Chou", songResource: "allthewaynorth", albumImage: "albumimg"),

]




struct Song: Decodable {
    
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    
    
}

let testSong = Song(trackId: 1440936016,
                       artistName: "Taylor Swift",
                       trackName: "Shake It Off",
                       artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/9c/91/83/9c918303-e0a4-2d4b-97d6-f986b9fba604/source/100x100bb.jpg")


struct SearchResult: Decodable {
    
    let results: [Song]
    
}
