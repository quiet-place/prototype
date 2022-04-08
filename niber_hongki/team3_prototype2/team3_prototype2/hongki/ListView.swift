//
//  ListView.swift
//  team3_prototype2
//
//  Created by KiWoong Hong on 2022/04/07.
//

import SwiftUI

struct ListView: View {
    let data = Array(1...100).map { "ahrfhr \($0)" }
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(data, id: \.self) {i in
                                leafRow()
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
