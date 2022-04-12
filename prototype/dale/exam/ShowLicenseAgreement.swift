//
//  ShowLicenseAgreement.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/11.
//

import SwiftUI

struct ShowLicenseAgreement: View {
    @State private var isShowingSheet = false
    var treedata: Treedata
    
    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }) {
            Text("ground의 나무생성하기(+)")
        }
        .sheet(isPresented: $isShowingSheet,
               onDismiss: didDismiss) {
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
                
                Button("나무 생성하기",
                       action: { isShowingSheet.toggle() })
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
