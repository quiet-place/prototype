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
            //Custom Picker...
            HStack{
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "private" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(Color.white.opacity(pageData.selectedTab == "private" ? 1 : 0))
                    .cornerRadius(10)
                    .onTapGesture{
                        withAnimation{
                            pageData.selectedTab = "private"
                        }
                    }
                
                Text("1")
                    .frame(width: 35, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 3))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "tabs" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(Color.white.opacity(pageData.selectedTab == "tabs" ? 1 : 0))
                    .cornerRadius(10)
                    .onTapGesture{
                        withAnimation{
                            pageData.selectedTab = "tabs"
                        }
                    }
                
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "device" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(Color.white.opacity(pageData.selectedTab == "device" ? 1 : 0))
                    .cornerRadius(10)
                    .onTapGesture{
                        withAnimation{
                            pageData.selectedTab = "device"
                        }
                    }
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.top)
            
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
