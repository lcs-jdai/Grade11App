//
//  RecommandedView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-12.
//

import SwiftUI

struct RecommandedView: View {
    var body: some View {
        NavigationView{
        List {
            
            ForEach(listOfItems) {
                currentItem in
                NavigationLink(destination: Detail1View(item:currentItem), label: {
                    EnhancedListItemsView(albumImage: currentItem.albumImage, songName: currentItem.songName)
                })
            }
        }
        }
        .navigationTitle("Recommanded Songs")
    }
}

struct RecommandedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        RecommandedView()
        }
    }
}
