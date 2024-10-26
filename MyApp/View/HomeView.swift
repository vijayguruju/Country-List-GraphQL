//
//  HomeView.swift
//  MyApp
//
//  Created by Vijay Guruju on 23/05/24.
//

import SwiftUI

struct HomeView: View {
    var title:String
  //  @ObservedObject var manager = NetworkManager()
    @State var selected = false
    var body: some View {
        ZStack {
            CountryListView()
//            TabView(selection: $selected) {
//                ZStack {
//                    Color.mint
//                    //HomeButtonView(selected: $selected, title: title)
//                    CountriesView()
//                }
//                .tabItem {
//                    TabItemView(title: "Home")
//                }
//                .tag(1)
//                // Text("Tab Content 2")
//                    List(0 ..< 30) { item in
//                        ZStack {
//                            Color.cyan
//                            Text("\(item + 1)")
//                        }
//                    }
//                    .scrollContentBackground(.hidden)
//                    //.background(Color.cyan)
//                .tabItem {
//                    TabItemView(title: "Account")
//                }.tag(2)
//            }.foregroundStyle(Color.white)
           // .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
        }
        .navigationDestination(isPresented: $selected, destination: {DetailView(title: "", emoji: "")})


    }
}

#Preview {
    HomeView(title: "Mew")
}

struct HomeButtonView: View {
    @Binding var selected:Bool
    var title:String
    var body: some View {
        Button(title, systemImage: "circle.fill", action: {
            print("Yes")
            selected = true
        })
        .frame(width: 120.0,height: 50)
        .foregroundStyle(Color.white)
        .background(Color.black)
        .bold()
        .cornerRadius(25)
    }
}

struct TabItemView: View {
    var title:String
    var body: some View {
        HStack {
            Text(title)
            Image(systemName: "circle")
                .foregroundStyle(Color.green)
        }
    }
}
