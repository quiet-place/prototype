//
//  Home.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/07.
//

import SwiftUI

struct Home: View {
    @StateObject var pageData = PageViewModel()
    //Slide Animation
    @Namespace var animation
    //LongPressGesture
    @State var isComplete: Bool = false
    
    //Columns..
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
    
    var body: some View {
        VStack{
            
            ScrollView{
                
                //Tabs With Pages...
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(pageData.urls){page in
                        
                        WebView(url: page.url)
                            .frame(height: 250)
                            .cornerRadius(15)
                            .contextMenu{
                                Button{
                                    print("Update selected")
                                }label:{
                                    Label("Update", systemImage: "pencil")
                                }
                                Button{
                                    print("Delete selected")
                                }label:{
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            
                    }
                })
                .padding()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.green.ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
