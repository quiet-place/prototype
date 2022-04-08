//
//  leafRow.swift
//  team3_prototype2
//
//  Created by KiWoong Hong on 2022/04/07.
//

import SwiftUI

struct leafRow: View {
    let thumb = ["sample1", "sample2", "sample3"]
    var body: some View {
        VStack {
            Image(thumb[Int.random(in: 0...2)])
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .cornerRadius(10)
            Text("miribogi_text_miri")
                .lineLimit(1)
            HStack {
                Text("March 3, 2022")
                Image(systemName: "drop.circle.fill")
                Image(systemName: "flame.circle.fill")
            }
        }
        /*
        VStack {
            Image(thumb[Int.random(in: 0...2)])
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .clipped()
            Text("miribogi_text_miri")
                .lineLimit(1)
            HStack {
                Text("March 3, 2022")
                Image(systemName: "drop.circle.fill")
                Image(systemName: "flame.circle.fill")
            }
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.green)
            .opacity(0.8))
        .padding(10)
         */
    }
}

struct leafRow_Previews: PreviewProvider {
    static var previews: some View {
        leafRow()
    }
}
