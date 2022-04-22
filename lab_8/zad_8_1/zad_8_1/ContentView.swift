//
//  ContentView.swift
//  zad_8_1
//
//  Created by Rafał Kuźmiczuk on 22/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var events: [Event] = Event.getEvents()

    var body: some View {
        NavigationView {
            List {
                ForEach(events.indices, id: \.self) { idx in
                    NavigationLink(destination: EditEvent(events: self.$events, index: idx)) {
                        VStack(alignment: .leading) {
                            Text("Name: \(self.events[idx].name)")
                            Text("Duration: \(Int(self.events[idx].duration)) minutes")
                        }
                    }.padding()
                }
            }.navigationBarTitle("Events")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
