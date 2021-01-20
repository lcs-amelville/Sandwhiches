//
//  ContentView.swift
//  Shared
//
//  Created by Melville, Aidan on 2021-01-20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach (store.sandwiches) { sandwich in
            SandwichCell(sandwich: sandwich)
                }
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                    foregroundColor(.secondary)
                    Spacer()
                }
                
            }
        .navigationTitle("Sandwiches")
            
            Text("Select a Sandwich")
                .font(.largeTitle)
        }
    }
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich (name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            Image(sandwich.thumbnailName)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) Ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
