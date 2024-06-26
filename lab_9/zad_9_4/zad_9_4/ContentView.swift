//
//  ContentView.swift
//  zad_9_4
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var events: [Event] = Event.getEvents()

    var body: some View {
        NavigationView {
            List {
                ForEach(events.indices, id: \.self) { idx in
                    NavigationLink(
                    destination: EditEventView(event: self.$events[idx])) {
                        VStack(alignment: .leading) {
                            Text("Name: \(self.events[idx].name)")
                            Text("Duration: \(Int(self.events[idx].duration)) minutes")
                        }
                    }.padding()
                }.onDelete(perform: { IndexSet in
                    self.events.remove(atOffsets: IndexSet)
                })
            }.navigationBarTitle("Events")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
