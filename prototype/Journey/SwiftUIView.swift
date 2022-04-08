//
//  ContentView.swift
//  prototypeFooter
//
//  Created by KoJeongseok on 2022/04/07.
//
// jouuuu
import SwiftUI

struct FloatingButtonView: View {
    
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            Text("게시글 화면")
                .font(.title.bold())
            
            // FAB
            VStack {
                // Spacer: 최대한 해당 축으로 밀어낸다
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // show Sheet toggle
                        showSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .background(Color.green)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    })
                        .padding()
                    .shadow(radius: 5)
                    .halfSheet(showSheet: $showSheet) {
                        
                        // Your Half Sheet View....
                        VStack {
                            Text ("게시글 작성 화면")
                                .font(.title.bold())
                        }
                        
                    }
                }
            }
        }
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Custom Half Sheet Modifier.....
extension View {
    
    // Binding Show Variable...
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder sheetView: @escaping ()->SheetView)->some View {
        
        // why we using overlay or background
        // bcz it will automatically use the swiftui frame Size only....
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet)
            )
    }
}

// UIkit Intergration...
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        if showSheet {
            // Pressentin Modal View....
            
            let sheetController = UIHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true) {
                
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

