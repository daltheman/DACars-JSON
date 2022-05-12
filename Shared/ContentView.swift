//
//  ContentView.swift
//  DACars-JSON
//
//  Created by Danilo Altheman on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchableText = ""
    let cars: [String: [Cars]] = Bundle.main.decode("CarsDatabase.json")
    
    var body: some View {
        NavigationView {
            List(cars["cars"]!, id: \.self) { car in
                NavigationLink(car.model!) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(car.make!).font(.title)
                            Text(car.model!).font(.title)
                        }
                        Text("Launched in: \(String(car.year!))")
                        Text("Category: \(car.category!)")
                    }
                }
                .navigationTitle("Cars")
            }
            .searchable(text: $searchableText, prompt: "Search")
        }
        
        
        #if os(macOS)
        .frame(minWidth: 480, idealWidth: 1024, minHeight: 320, idealHeight: 768, alignment: .center)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
        }
    }
}
