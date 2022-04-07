//
//  forest.swift
//  prototype
//
//  Created by apple developer academy on 2022/04/07.
//

import SwiftUI

struct forest: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: tree()) {
                Text("Forest sample view")
            }.navigationTitle("")
        }
    }
}



struct forest_Previews: PreviewProvider {
    static var previews: some View {
        forest()
    }
}
