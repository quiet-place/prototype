//
//  tree.swift
//  prototype
//
//  Created by apple developer academy on 2022/04/07.
//

import SwiftUI

struct tree: View {
    var body: some View {
        VStack() {
            Image("logo")
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .background(Color.indigo)
                .clipShape(Circle())
                .shadow(radius: 3)
                
            Spacer()
        }.navigationBarTitleDisplayMode(.inline)
    }
}


struct raven_Previews: PreviewProvider {
    static var previews: some View {
        tree()
    }
}

