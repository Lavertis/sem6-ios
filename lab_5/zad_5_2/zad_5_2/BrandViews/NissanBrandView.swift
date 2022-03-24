//
//  ThirdBrandView.swift
//  zad_5_2
//
//  Created by Rafał Kuźmiczuk on 25/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct NissanBrandView: View {
    var models = ["Quashqai", "Juke", "370Z", "GT-R", "Skyline"]
    
    var body: some View {
        VStack {
            ForEach(models, id: \.self) {
                Text($0).padding()
            }
        }
    }
}

struct ThirdBrandView_Previews: PreviewProvider {
    static var previews: some View {
        NissanBrandView()
    }
}
