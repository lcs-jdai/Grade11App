//
//  DetailView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-06.
//

//import SwiftUI
//import AVKit
//
//struct PhotocaptionView: View {
//
//    var song: Song
//    @State var inFavourites: Bool
//    @Binding var favourites: [Song]
//
//    @State var audioPlayer: AVAudioPlayer!
//    @State var count :Int = 0
//    @State var scaleFactor = 1.0
//
//    let imageName: String
//    let songName: String
//    let singerName: String
//    let songResource: String
//
//
//    @State private var rotation = 0.0
//    @State private var yShadow = 20
//    let timer = Timer.publish(every: 1.00, on: .main, in: .common).autoconnect()
//    @State private var isRotated = false
//
//    var body: some View {
//
//
//
//        ZStack{
//            Color.backgroundColor
//                .edgesIgnoringSafeArea(.all)
//
//        VStack{
//            VStack{
//                Image (imageName)
//                    .resizable()
//                    .rotationEffect(.degrees(rotation))
//                    .animation(Animation
//                                .linear(duration: 8)
//                                .repeatForever(autoreverses: false))
//                    .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
////                    .animation(Animation.default.repeatForever(autoreverses: true))
//                    .clipShape(Circle())
//                    .frame(width: 250, height: 250, alignment: .center)
//                    .shadow(radius: 500)
//                    .overlay(Circle()
//                                .stroke(LinearGradient(gradient: Gradient(colors:[
//                        Color.pink,
//                        Color.purple,
//                    ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8)
//                                .blur(radius: 5))
//                    .onReceive(timer){ Input in
//
//                        yShadow -= -20
//
//                        rotation = 360
//
//                    }
//
//                    .padding(.bottom,30)
//
//                Text(songName)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .gradientForeground(colors: [.red, .blue])
//
//                Text(singerName)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.nameColor)
//                    .padding(.bottom, 30)
//                    .gradientForeground(colors: [.red, .blue])
//            }
//
//            HStack{
//                Spacer()
//                ZStack{
//
//                    Image(systemName: "play.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//                        .gradientForeground(colors: [.red, .blue])
//                        .blur(radius: 5)
//
//                    Button(action:{
//                                       self.audioPlayer.play()
//                                   }){
//                                       Image(systemName: "play.circle.fill")
//                                           .resizable()
//                                           .frame(width: 50, height: 50)
//                                           .aspectRatio(contentMode: .fit)
//                                           .gradientForeground(colors: [.red, .blue])
//                                       }
//                }
//                Spacer()
//                Button(action:{
//                    self.audioPlayer.pause()
//                }){
//                    ZStack{
//                    Image(systemName: "pause.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//                        .gradientForeground(colors: [.red,.blue])
//                    Image(systemName: "pause.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//                        .gradientForeground(colors: [.red,.blue])
//                        .blur(radius: 5)
//                    }
//                    }
//                Spacer()
//                FavouritesButtonView(song: song,
//                                                    inFavourites: $inFavourites,
//                                                    favourites: $favourites)
//            }
//            }
//        }
//        .onAppear {
//            let sound = Bundle.main.path(forResource: (songResource), ofType: "mp3")
//            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }
//    }
//}
//
//
//extension View {
//    public func gradientForeground(colors: [Color]) -> some View {
//        self.overlay(LinearGradient(gradient: .init(colors: colors),
//                                    startPoint: .topLeading,
//                                    endPoint: .bottomTrailing))
//            .mask(self)
//    }
//}
//struct PhotocaptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotocaptionView(imageName: "stepasideimg", songName: "Step Aside", singerName: "By: Jay Chou", songResource: "stepaside",  inFavourites: false, favourites: .constant([]))
//    }
//}
import SwiftUI

struct SongDetailView: View {
    
    // MARK: Stored properties
    
    // Song to show in this view
    var song: Song
    
    @State private var rotation = 0.0
    @State private var yShadow = 20
    let timer = Timer.publish(every: 1.00, on: .main, in: .common).autoconnect()
    @State private var isRotated = false
    
    // Whether this song is in the Favourites list or not
    @State var inFavourites: Bool
    
    // A reference to the list of favourite songs
    // This is a derived value; source of truth is at the app level
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
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
                
                VStack(alignment: .leading) {
                    
                    Text(song.trackName)
                        .font(.title)
                    
                    Text(song.artistName)
                        .font(.subheadline)
                    
                }
                
            }
            
            HStack {
                
                AudioPlayerView(urlOfSongToPlay: song.previewUrl)

                Spacer()

                FavouritesButtonView(song: song,
                                     inFavourites: $inFavourites,
                                     favourites: $favourites)
            }
            .padding(.top, 20)
            .padding(.horizontal, 5)
            
            Text("Store Links")
                .font(.title2)
                .bold()
                .padding(.top, 20)
            
            Link("View artist", destination: URL(string: song.artistViewUrl)!)
                .padding(.top, 5)
            
            Link("View album", destination: URL(string: song.collectionViewUrl)!)
                .padding(.top, 5)

            
            Spacer()
                .frame(maxWidth: .infinity)
            
        }
        .padding()
        // Make the nav bar be "small" at top of view
        .navigationBarTitleDisplayMode(.inline)
        
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



