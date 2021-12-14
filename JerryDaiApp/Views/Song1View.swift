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
    @State var count :Int = 0
    
    private let songList = [

        "stepaside",
        "ricefield",
        "sunnyday",

    ]
    
    func nextSong() {
        self.audioPlayer.pause()

        // Advance to the next song
       count += 1
        if count == songList.count {
            count = 0
        }
        
        self.audioPlayer.play()
    }
    
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



