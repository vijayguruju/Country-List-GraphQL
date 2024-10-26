//
//  ContentView.swift
//  MyApp
//
//  Created by Vijay Guruju on 22/05/24.
//

import SwiftUI

struct CountryListView: View {
    
    @ObservedObject var viewModel = CountryListVewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(searchResults, id: \.name) { country in
                NavigationLink(destination: DetailView(title: country.name, emoji: country.emoji)) {
                    HStack {
                        Text(country.emoji)
                        Text(country.name)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for country")
        .navigationTitle("Countries")
        .navigationBarBackButtonHidden()
        }
        //.onAppear()
        
    }
    
    var searchResults : [Country] {
        if searchText.isEmpty {
            return viewModel.countries
        } else {
            return viewModel.countries.filter{ $0.name.contains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
