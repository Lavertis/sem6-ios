//
//  EditEventView.swift
//  zad_9_4
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct EditEventView: View {
    @Binding var events: [Event]
    var index: Int
    @State private var isEditing = false

    init(events: Binding<[Event]>, index: Int) {
        self._events = events
        self.index = index
    }

    var body: some View {
        VStack {
            TextField("Event name", text: $events[index].name)
                .multilineTextAlignment(.center)
            Slider(
                value: $events[index].duration,
                in: 0.0...60.0,
                step: 5,
                onEditingChanged: { editing in
                    self.isEditing = editing
            })
            Text("Duration: \(Int(events[index].duration)) minutes")
        }.padding().padding()
    }
}

struct EditEventView_Previews: PreviewProvider {
    static var previews: some View {
        EditEventView(events: .constant([Event(name: "First event", duration: 45)]), index: 0)
    }
}
