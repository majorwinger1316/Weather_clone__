//
//  NewCityView.swift
//  Weather_clone
//
//  Created by Akshat Dutt Kaushik on 13/09/23.
//

import SwiftUI

struct SelectionView: View{
    @State var searchText = ""
    let cities = ["Chennai", "Mumbai", "New York", "Miami", "Munich", "Helsinki", "Tokyo", "Kanpur", "Bangalore"]
    var body: some View{
        NavigationView{
            List{
                ForEach(results, id: \.self) {
                    city in NavigationLink(destination: LoadingView()){
                        Text(city)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Search for location")
        }
        var results: [String]{
            if searchText.isEmpty {
                return cities
            } else {
                return cities.filter { $0.contains(searchText)}
            }
        }
    }
}

struct NewCityView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
