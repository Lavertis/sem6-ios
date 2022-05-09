//
//  EditEventView.swift
//  zad_9_4
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct EditEventView: View {
    @Binding var event: Event
    @State private var isEditing = false

    var body: some View {
        VStack {
            TextField("Event name", text: $event.name)
                .multilineTextAlignment(.center)
            Slider(
                value: $event.duration,
                in: 0.0...60.0,
                step: 5,
                onEditingChanged: { editing in
                    self.isEditing = editing
            })
            Text("Duration: \(Int(event.duration)) minutes")
        }.padding().padding()
    }
}

struct EditEventView_Previews: PreviewProvider {
    static var previews: some View {
        EditEventView(event: .constant(Event(name: "First event", duration: 45)))
    }
}
