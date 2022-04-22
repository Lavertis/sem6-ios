//
//  Event.swift
//  zad_8_1
//
//  Created by Rafał Kuźmiczuk on 22/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import Foundation

struct Event {
    var name: String
    var duration: Double

    static func getEvents() -> [Event] {
        var events: [Event] = []
        for i in 1...5 {
            let event = Event(name: "Event_\(i)", duration: 0)
            events.append(event)
        }
        return events
    }
}
