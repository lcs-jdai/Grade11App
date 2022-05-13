//
//  EnhancedListItemsView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-15.
//

import SwiftUI

struct EnhancedListItemsView: View {
    let albumImage: String
    let songName: String
    var body: some View {
        HStack{
            Image (albumImage)
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
            
            Text (songName)
                .font(.title3)
                .padding(.leading,20)
        }
    }
}

struct EnhancedListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedListItemsView(albumImage: "albumimg", songName: "Step Aside")
    }
}
