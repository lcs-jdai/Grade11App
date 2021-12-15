//
//  Model.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-15.
//

import Foundation

struct songView: Identifiable {
    
    let id = UUID()
    let imageName: String
    let songName: String
    let singerName: String
    let albumImage: String
}


let listOfItems = [

    songView(imageName: "stepasideimg", songName: "Step Aside", singerName: "By: Jay Chou", albumImage: "albumimg"),
    
    songView(imageName: "stepasideimg", songName: "Ricefield", singerName: "By: Jay Chou", albumImage: "sd"),
    
    songView(imageName: "stepasideimg", songName: "Sunny Day", singerName: "By: Jay Chou", albumImage: "rc"),

]
