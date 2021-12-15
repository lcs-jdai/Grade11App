//
//  DetailView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-06.
//

import SwiftUI
import AVKit

struct PhotocaptionView: View {
   
    @State var audioPlayer: AVAudioPlayer!
    @State var count :Int = 0
    
    let imageName: String
    let songName: String
    let singerName: String
    let songResource: String
    
    
    var body: some View {
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
        VStack{
            VStack{
                Image (imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250, alignment: .center)
                    .shadow(radius: 10)
                    .overlay(Circle()
                                .stroke(LinearGradient(gradient: Gradient(colors:[
                        Color.pink,
                        Color.purple,
                    ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8))
                    .padding(.bottom,30)
                
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
            
            HStack{
                Spacer()
                Button(action:{
                    self.audioPlayer.play()
                }){
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .gradientForeground(colors: [.red, .blue])
                    }
                Spacer()
                Button(action:{
                    self.audioPlayer.pause()
                }){
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .gradientForeground(colors: [.red,.blue])
                    }
                Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: (songResource), ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
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
struct PhotocaptionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotocaptionView(imageName: "stepasideimg", songName: "Step Aside", singerName: "By: Jay Chou", songResource: "stepaside")
    }
}



