//
//  ListItemView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-06.
//

import SwiftUI

struct ListItemView: View {
    
    // MARK: Stored properties
    var song: Song
    
    // MARK: Computed properties
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(song.trackName)
            
            Text(song.artistName)
                .font(.caption)
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(song: testSong)
    }
}
