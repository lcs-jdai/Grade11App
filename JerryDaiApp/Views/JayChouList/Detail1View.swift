//
//  Detail1View.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-12.
//

import SwiftUI

struct Detail1View: View {
    let item: JaySong
    var body: some View {
        DetailView(imageName: item.imageName, songName: item.songName, singerName: item.singerName, songResource: item.songResource)
    }
}

struct Detail1View_Previews: PreviewProvider {
    static var previews: some View {
        Detail1View(item: listOfItems.first!)
    }
}
