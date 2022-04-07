//
//  header.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/06.
//

import SwiftUI


struct header: View {
    @State var text : String = ""
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                GeometryReader { geometry in
                    Path { path in
                       path.move(to: CGPoint(x: 0, y: -50))
                       path.addLine(to: CGPoint(x: 0, y: 120))
                       path.addLine(to: CGPoint(x: 390, y: 120))
                       path.addLine(to: CGPoint(x: 390, y: -50))
                        }
                .fill(
                   .linearGradient(
                    Gradient(colors: [.green, .blue]),
                       startPoint: .init(x: 0.5, y: 0.1),
                       endPoint: .init(x: 0.5, y: 0.3)
                        )
                    )
                }
                VStack(spacing: 20){
                    NavigationLink(destination: treeInformation()){
                        VStack{
                            Image("Image-2")
                            .renderingMode(.original)
        
                            Text("tree information")
                                .foregroundColor(.black)
                        }
                    }

                    searchBar(text: self.$text)
                    
                    Spacer()
                    HStack{
                        Spacer()
                        uploadButton()
                    }.padding()
                    

                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct header_Previews: PreviewProvider {
    static var previews: some View {
        header()
    }
}

