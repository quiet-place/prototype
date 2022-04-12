//
//  ShowLicenseAgreement.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/11.
//

import SwiftUI

struct ShowLicenseAgreement: View {
    @State private var showingSheet: Bool = false
    
    @State var name: String = "나무이름 입력"
    enum Category: String, CaseIterable, Identifiable {
        case health, life, culture
        var id: Self { self }
    }

    @State private var selectedCategory: Category = .life
    
    var treedata: Treedata
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("ground의 나무생성하기(+)")
        }
        .fullScreenCover(isPresented: $showingSheet) {
            VStack {
                Text(treedata.name)
                
                HStack{
                    Button(action: {
                        //여기에 이미지 바꾸는 액션 넣기
                    }, label: {
                        Image(systemName: "arrowtriangle.left.fill").resizable()
                            .frame(width: 50, height: 50)
                    })
                    treedata.image
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "arrowtriangle.right.fill").resizable()
                            .frame(width: 50, height: 50)
                    })
                }
                
                TextField("나무이름 입력", text: $name)
                .multilineTextAlignment(.center)
                //.textFieldStyle(.roundedBorder)
                .clipShape(Rectangle())
                .frame(width: 200, height: 50, alignment:.center)
                .foregroundColor(Color.black)
                .background(Color.brown)
                .cornerRadius(15)
                
                
                //Category
                Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized)
                        }
                    }.pickerStyle(.segmented)
                    .padding()
                
                //Text
                Text("나무와 함께 성장해 보아요")
                
                
                
                Button("나무 생성하기",
                       action: { self.showingSheet = false })
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct ShowLicenseAgreement_Previews: PreviewProvider {
    static var previews: some View {
        ShowLicenseAgreement(treedata: treedatas[2])
    }
}
