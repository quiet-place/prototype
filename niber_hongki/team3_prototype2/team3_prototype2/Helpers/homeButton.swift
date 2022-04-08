//
//  homeButton.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/08.
//

import SwiftUI

struct homeButton: View {
    var body: some View {
        NavigationLink(destination: homeView()){
            Image("house")
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct homeView : View {
    var body: some View {
        Text("Home")
    }
}

struct homeButton_Previews: PreviewProvider {
    static var previews: some View {
        homeButton()
    }
}
