//
//  uploadButton.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/07.
//

import SwiftUI

struct uploadButton: View {
    var body: some View {
        
        NavigationLink(destination: uploadView()){
            Image("plus.circle")
        }
        .buttonStyle(PlainButtonStyle())
        .navigationTitle("backck")
        
    }
    
}

struct uploadView : View {
    var body : some View {
        Text("글 작성 뷰")
    }
}

struct uploadButton_Previews: PreviewProvider {
    static var previews: some View {
        uploadButton()
    }
}
