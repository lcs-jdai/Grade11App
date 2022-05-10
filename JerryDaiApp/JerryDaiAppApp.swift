//
//  JerryDaiAppApp.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2021-11-29.
//

//import SwiftUI
//
//@main
//struct JerryDaiAppApp: App {
//    var body: some Scene {
//        WindowGroup {
//            Album1View()
//        }
//    }
//}
import SwiftUI

@main
struct SongBrowserApp: App {
    
    // MARK: Stored properties
    
    // Source of truth for the list of favourite songs
    @State var favourites: [Song] = []
    
    var body: some Scene {
        WindowGroup {
            
            TabView {

                SearchView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search")
                    }
                
                FavouritesView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favourites")
                    }
            }
                        
        }
    }
}
