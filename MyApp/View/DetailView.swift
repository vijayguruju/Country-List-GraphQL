//
//  DetailView.swift
//  MyApp
//
//  Created by Vijay Guruju on 23/05/24.
//

import SwiftUI

struct DetailView: View {
    var title:String
    var emoji:String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .foregroundStyle(Color.teal)
            Text(emoji)
                .font(.system(size: 150))
            }
    }
}

#Preview {
    DetailView(title: "Detail", emoji: "")
}
