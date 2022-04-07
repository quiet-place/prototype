//
//  ListView.swift
//  team3_prototype2
//
//  Created by KiWoong Hong on 2022/04/07.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(alignment: .top) {
                    /*
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) {i in
                            Text(i)
                        }
                    }*/
                
                    LazyVStack {
                        ForEach(0..<10) { i in
                            leafRow()
                        }
                    }
                    LazyVStack {
                        ForEach(0..<10) { i in
                            leafRow()
                        }
                    }
                }
            }
            .navigationTitle("Tree Name")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
