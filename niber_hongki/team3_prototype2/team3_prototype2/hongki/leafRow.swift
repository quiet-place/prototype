//
//  leafRow.swift
//  team3_prototype2
//
//  Created by KiWoong Hong on 2022/04/07.
//

import SwiftUI

struct leafRow: View {
    var body: some View {
        VStack {
            Image(systemName: "leaf") // thumbnail
                
                .resizable()
                .frame(width: 130, height: 130) // 패딩껴서 두개의 스택이 들어가게
            Text("miribogi_text_miri")
                .lineLimit(1)
            HStack {
                Text("March 3, 2022")
                Image(systemName: "drop.circle.fill")
                Image(systemName: "flame.circle.fill")
            }
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.accentColor))
    }
}

struct leafRow_Previews: PreviewProvider {
    static var previews: some View {
        leafRow()
    }
}
