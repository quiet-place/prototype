//
//  searchBar.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/06.
//

import SwiftUI

struct searchBar: View {
    @Binding var text : String
    @State var editText : Bool = false
    
    var body: some View {
        HStack{
            TextField("검색어를 넣어주세요" , text : self.$text)
                .padding(15)
                .padding(.horizontal,15)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .overlay(
                    HStack{
                        Spacer()
                        
                        if self.editText{
                            Button(action : {
                                self.editText = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(.black))
                                    .padding()
                            }
                        }else{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.black))
                                .padding()
                        }
                    }
                ).onTapGesture {
                    self.editText = true
                }
        }
    }
}

//struct searchBar_Previews: PreviewProvider {
//    @State var text : String = ""
//
//    static var previews: some View {
//        searchBar(text: self.$text)
//    }
//}
