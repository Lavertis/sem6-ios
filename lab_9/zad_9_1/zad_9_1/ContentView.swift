//
//  ContentView.swift
//  zad_9_1
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

class MyImage {
    var title: String
    var path: String
    
    init(title: String, path: String) {
        self.title = title
        self.path = path
    }
}

let images: [MyImage] = [
    MyImage(title: "Autumn forest", path: "autumn_forest"),
    MyImage(title: "Riverbed", path: "river"),
    MyImage(title: "Plane hidden in forest", path: "plane_in_forest"),
    MyImage(title: "Autumn leaf", path: "autumn_leaf")
]

struct ContentView: View {
    @State private var index: Int = 0
    @State private var showTitle: Bool = false
    @State private var offset: CGSize = .zero
    
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded { finished in
                self.showTitle = !self.showTitle
        }
        
        return VStack {
            Image(images[index].path)
                .resizable()
                .offset(x: self.offset.width)
                .scaledToFit()
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            if value.translation.width < -(UIScreen.main.bounds.size.width * 0.4) && self.index < images.count - 1 {
                                // left
                                self.index = self.index + 1
                            }
                            if value.translation.width > (UIScreen.main.bounds.size.width * 0.4) && self.index > 0 {
                                // right
                                self.index = self.index - 1
                            }
                            self.offset = .zero
                        })
                        .onChanged({ value in
                            if value.translation.width < 0 && self.index < images.count - 1 {
                                // left
                                self.offset = value.translation
                            }
                            if value.translation.width > 0 && self.index > 0 {
                                // right
                                self.offset = value.translation
                            }
                        })
            )
                .gesture(longPress)
            
            Text(showTitle ? images[index].title : " ")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
