//
//  Song2View.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-13.
//

import SwiftUI
import AVKit

struct Song2View: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var count :Int = 1
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
                    .overlay(Circle() .stroke(Color .yellow, lineWidth: 5))
                    .padding(.bottom,30)
                
                Text("Ricefield")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    
                Text("By: Jay Chou")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
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
            let sound = Bundle.main.path(forResource: "ricefield", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}


struct Song2View_Previews: PreviewProvider {
    static var previews: some View {
        Song2View()
    }
}



