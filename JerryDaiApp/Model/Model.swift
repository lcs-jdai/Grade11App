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
    let artistViewUrl: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
    
    
}

let testSong = Song(trackId: 1440936016,
                       artistName: "Taylor Swift",
                       trackName: "Shake It Off",
                       artistViewUrl: "https://music.apple.com/us/artist/taylor-swift/159260351?uo=4",
                       collectionViewUrl: "https://music.apple.com/us/album/shake-it-off/1440935467?i=1440936016&uo=4",
                       previewUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/4d/80/bb/4d80bb0d-5b66-7c09-056c-4dbae131e0c4/mzaf_6323814923022681502.plus.aac.p.m4a",
                       artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/9c/91/83/9c918303-e0a4-2d4b-97d6-f986b9fba604/source/100x100bb.jpg")


struct SearchResult: Decodable {
    
    let results: [Song]
    
}
