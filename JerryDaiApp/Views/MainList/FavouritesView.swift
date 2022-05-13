import SwiftUI

struct FavouritesView: View {
    
    // MARK: Stored properties

    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                if favourites.isEmpty {

                    Spacer()
                    
                    Text("No favourite songs yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                } else {
                    
                    List(favourites, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongDetailView(song: currentSong, inFavourites: true, favourites: $favourites)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Favourites")
            
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favourites: .constant([testSong]))
    }
}
