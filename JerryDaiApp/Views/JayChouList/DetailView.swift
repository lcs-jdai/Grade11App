//
//  DetailView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-11.
//


import SwiftUI
import AVKit

struct DetailView: View {

//    var song: Song
//    @State var inFavourites: Bool
//    @Binding var favourites: [Song]
    @State var audioPlayer: AVAudioPlayer?
    
    @State var count :Int = 0
//    @State var scaleFactor = 1.0

    let imageName: String
    let songName: String
    let singerName: String
    let songResource: String


    @State private var rotation = 0.0
    @State private var yShadow = 20
    let timer = Timer.publish(every: 1.00, on: .main, in: .common).autoconnect()
    @State private var isRotated = false
    @State var isSongPlaying = false


    var body: some View {

       


        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)

        VStack{
            VStack{
                Image (imageName)
                    .resizable()
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

                    .padding(.bottom,30)
                HStack{
                    VStack{
                Text(songName)
                    .font(.title)
                    .fontWeight(.bold)
                    .gradientForeground(colors: [.red, .blue])

                Text(singerName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.nameColor)
                    .padding(.bottom, 30)
                    .gradientForeground(colors: [.red, .blue])
                    }
                    
//                    VStack{
//                        Spacer()
//                        AudioPlayerView(urlOfSongToPlay: song.previewUrl)
//                        Spacer()
//                    }
                }
            }

//            HStack{
//                Spacer()
////                AudioPlayerView(urlOfSongToPlay: song.previewUrl)
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
////                FavouritesButtonView(song: song,
////                                                    inFavourites: $inFavourites,
////                                                    favourites: $favourites)
//            }
            ZStack {
                
                Button(action: {
                   
                    
                    do {
                        print("\(songResource).mp3")
                        let sound = Bundle.main.path(forResource: "\(songResource).mp3", ofType: nil)
                        let url = URL(fileURLWithPath: sound!)
                        audioPlayer = try! AVAudioPlayer(contentsOf: url)
                        audioPlayer?.play()
                    } 
                  
                    isSongPlaying = true
                }) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .gradientForeground(colors: [.red,.blue])
                }
                // Visible only when song is not playing
                .opacity(isSongPlaying == false ? 1.0 : 0.0)
                
                Button(action: {
                    do {
                        print("\(songResource).mp3")
                        let sound = Bundle.main.path(forResource: "\(songResource).mp3", ofType: nil)
                        let url = URL(fileURLWithPath: sound!)
                        audioPlayer = try! AVAudioPlayer(contentsOf: url)
                        audioPlayer?.pause()
                    }
                    
                 
                    isSongPlaying = false
                }) {
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .gradientForeground(colors: [.red,.blue])
                }
                // Visible only when song IS playing
                .opacity(isSongPlaying == true ? 1.0 : 0.0)
            }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .onAppear {
           
        }
    }
}


extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageName: "stepasideimg", songName: "Step Aside", singerName: "By: Jay Chou", songResource: "stepaside")
    }
}

//,  inFavourites: false, favourites: .constant([])
