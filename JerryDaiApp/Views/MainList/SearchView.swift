//
//  SearchView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-06.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: Stored properties
    
    @State var searchText: String = ""
    
    @State var foundSongs: [Song] = []
    
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            ZStack {

                VStack {

                    List(foundSongs, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongDetailView(song: currentSong, inFavourites: false, favourites: $favourites)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { whatWasTyped in
                        Task {
                            await fetchResults()
                        }

                    }
                    
                               
                    
                }
                .navigationTitle("Music Search")
                
                VStack {
                                   Spacer()
                                   
                                   EmptyStateView()
                                   
                                   Spacer()
                               }
                               .opacity(searchText.isEmpty ? 1.0 : 0.0)
                
            }
            
            
        }
        
    }
    
    // MARK: Functions
    func fetchResults() async {
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
    
        let url = URL(string: "https://itunes.apple.com/search?term=\(input)&entity=song")!
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(for: request)
            print(String(data: data, encoding: .utf8)!)
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            foundSongs = decodedSearchResult.results
            
        } catch {
            
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testSong]))
    }
}
