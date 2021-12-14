//
//  Album1View.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-12-13.
//

import SwiftUI

struct Album1View: View {
    var body: some View {
            List{
                NavigationLink(destination: Song1View(), label: {
                    HStack{
                        Image ("albumimg")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .leading)
                        
                        Text ("Step Aside")
                            .font(.title2)
                            .padding(.leading,20)
                    }
                })
                
                NavigationLink(destination: Song2View(), label: {
                    HStack{
                        Image ("sd")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .leading)
                        
                        Text ("Ricefield")
                            .font(.title2)
                            .padding(.leading,20)
                    }
                })
                NavigationLink(destination: Song3View(), label: {
                    HStack{
                        Image ("rc")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .leading)
                        
                        Text ("Sunny Day")
                            .font(.title2)
                            .padding(.leading,20)
                    }
                })
            }
        .navigationTitle("Jay Chou's Album")
    }
}

struct Album1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Album1View()
        }
    }
}
