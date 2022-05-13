
import SwiftUI

struct SongDetailView: View {
    
    // MARK: Stored properties
    var song: Song
    
    @State private var rotation = 0.0
    @State private var yShadow = 20
    let timer = Timer.publish(every: 1.00, on: .main, in: .common).autoconnect()
    @State private var isRotated = false
    @State var inFavourites: Bool
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
        
        VStack(alignment: .leading) {
            
            VStack {
                
                RemoteImageView(fromURL: URL(string: song.artworkUrl100)!)
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation
                                .linear(duration: 8)
                                .repeatForever(autoreverses: false))
                    .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
//                    .animation(Animation.default.repeatForever(autoreverses: true))
                    .clipShape(Circle())
                    .frame(width: 250, height: 250, alignment: .center)
                    .shadow(radius: 500)
                    .overlay(Circle()
                                .stroke(LinearGradient(gradient: Gradient(colors:[
                        Color.pink,
                        Color.purple,
                    ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8)
                                .blur(radius: 5))
                    .onReceive(timer){ Input in

                        yShadow -= -20

                        rotation = 360

                    }
                    .padding(.leading, 20)
                HStack{
                
                VStack(alignment: .center) {
                    
                    Text(song.trackName)
                        .font(.title)
                        .fontWeight(.bold)
                        .gradientForeground(colors: [.red, .blue])
                    
                    Text(song.artistName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.nameColor)
                        .padding(.bottom, 30)
                        .gradientForeground(colors: [.red, .blue])
                    
                }
                .padding(.leading,20)
                .padding(.top,20)
                
                Spacer()
                    
                VStack{
                    FavouritesButtonView(song: song,
                                         inFavourites: $inFavourites,
                                         favourites: $favourites)
                    }
                .padding(.trailing,20)
                }
                
            }
            
            HStack {
                Spacer()
                
                AudioPlayerView(urlOfSongToPlay: song.previewUrl)

                Spacer()

               
            }
            .padding(.top, 20)
            .padding(.horizontal, 5)
            
            Spacer()
                .frame(maxWidth: .infinity)
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongDetailView(song: testSong,
                     inFavourites: false,
                     favourites: .constant([]))
        }
    }
}



