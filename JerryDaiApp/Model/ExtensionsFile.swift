//
//  ExtensionsFile.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-06.
//

import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b:Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let backgroundColor = Color.rgb(r: 21, g: 22, b: 33)
    static let buttonColor = Color.rgb(r: 115, g: 3, b: 252)
    static let nameColor = Color.rgb(r: 3, g: 219, b: 252)
}



 let songList = [
    
        "ricefield",
        "stepaside",
        "sunnyday",
        "allthewaynorth"
    
    ]



