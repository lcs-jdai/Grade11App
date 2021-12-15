//
//  Album1View.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-13.
//

import SwiftUI

struct Album1View: View {
    var body: some View {
        List {
            ForEach(listOfItems) {
                currentItem in
                NavigationLink(destination: DetailView(item:currentItem), label: {
                    EnhancedListItemsView(albumImage: currentItem.albumImage, songName: currentItem.songName)
                })
            }
        }
        .navigationTitle("Jay Chou's Album")
    }
}


struct Album1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Album1View()
        }
    }
}
