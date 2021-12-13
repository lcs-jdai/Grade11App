//
//  DetailView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-06.
//

import SwiftUI
import AVKit

struct Song1View: View {
   
    @State var audioPlayer: AVAudioPlayer!
    @State var count :Int = 1
    var currentSongPosition = 0
    
   
    
    var body: some View {
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
        VStack{
            VStack{
                Image ("stepasideimg")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250, alignment: .center)
                    .shadow(radius: 10)
                    .overlay(Circle() .stroke(Color .black, lineWidth: 5))
                    .padding(.bottom,30)
                
                Text("Step Aside")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.nameColor)
                    
                Text("By: Jay Chou")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.nameColor)
                    .padding(.bottom, 30)
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
                        .foregroundColor(.buttonColor)
                    }
                Spacer()
                Button(action:{
                    self.audioPlayer.pause()
                }){
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.buttonColor)
                    }
                Spacer()
                Button(action:{
                    currentSongPosition += 1
                    
                    // If the current song position is past the end of the list, go back to first song
                    // e.g.: In a list with 4 songs, valid positions are: 0, 1, 2, and 3 and the song list count would be 4.
                    //       So, if the current song position is 4, we have gone past the end of the list.
                    if currentSongPosition == songList.count {
                        currentSongPosition = 0
                    }
                    
                    self.audioPlayer.play()
                }){
                    Image(systemName: "forward.end")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.buttonColor)
                    }
                Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "stepaside", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct Song1ViewView_Previews: PreviewProvider {
    static var previews: some View {
        Song1View()
    }
}



