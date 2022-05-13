//
//  FavouritesButtonView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-06.
//

import SwiftUI

struct FavouritesButtonView: View {
    
    // MARK: Stored properties
    let song: Song
    @Binding var inFavourites: Bool
    @Binding var favourites: [Song]
        
    // MARK: Computed properties
    var body: some View {

        Button(action: {
            
            addOrRemoveSongFromFavourites()
            
        }) {
            
            HStack {
                
                Image(systemName: inFavourites ? "suit.heart.fill" : "suit.heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .gradientForeground(colors: [.red, .blue])
                
            }
            
        }
        
    }
    
    // MARK: Functions
    func addOrRemoveSongFromFavourites() {
        if inFavourites == false {
            favourites.append(song)
            inFavourites = true
        } else {
            favourites.removeAll(where: { currentSongInList in
                currentSongInList.trackId == song.trackId
            })
            inFavourites = false
        }

    }

}

struct FavouritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButtonView(song: testSong,
                             inFavourites: .constant(true),
                             favourites: .constant([]))
    }
}
