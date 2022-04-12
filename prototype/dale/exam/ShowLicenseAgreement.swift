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
    
    var treeData = ["cactus", "palmTree", "tree"]
    
    @State var i: Int = 1
    
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("ground의 나무생성하기(+)")
        }
        .fullScreenCover(isPresented: $showingSheet) {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.showingSheet = false
                    }, label: {
                        Image(systemName: "clear")
                            .frame(width: 100, height: 100)
                    })
                    .padding()
                    
                }
                
                
                HStack{
                    Button(action: {
                        if i > 0 {
                            self.i -= 1
                        } else {
                            i = treeData.count - 1
                        }
                        
                    }, label: {
                        Image(systemName: "arrowtriangle.left.fill").resizable()
                            .frame(width: 50, height: 50)
                    })
                    Image(treeData[i])
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    
                    Button(action: {
                        if i < treeData.count - 1 {
                            self.i += 1
                        } else {
                            i = 0
                        }
                        
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
                
                    
                    Button("생성",
                           action: { self.showingSheet = false })
                    .padding()
    
                    
                    
                    
                
                
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct ShowLicenseAgreement_Previews: PreviewProvider {
    static var previews: some View {
        ShowLicenseAgreement()
    }
}
