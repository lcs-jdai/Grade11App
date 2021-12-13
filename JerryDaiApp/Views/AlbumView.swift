//
//  AlbumView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-13.
//

import SwiftUI

struct AlbumView: View {
    var body: some View {
        ScrollView{
            ZStack{
               
                VStack{
                    HStack{
                        Image("albumimg")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .leading)
                            .padding(.leading,20)
                        
                        VStack{
                            Text ("Jay Chou's Album")
                                .padding(.bottom,20)
                                .padding(.trailing,5)
                                .font(.system(size: 19))
                                .multilineTextAlignment(.center)
                            
                            Text ("My favourite singer Jay Chou.")
                                .font(.system(size: 15))
                                .padding(.trailing,5)
                        }
                    }
                    
                }
            
                Image ("bgc")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom,500)
        }
    }
}
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
