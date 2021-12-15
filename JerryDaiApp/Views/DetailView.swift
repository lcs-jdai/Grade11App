//
//  Song2View.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-13.
//

import SwiftUI
import AVKit

struct DetailView: View {
    let item: songView
    var body: some View {
            PhotocaptionView(imageName: item.imageName, songName: item.songName, singerName: item.singerName)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: listOfItems.first!)
    }
}



