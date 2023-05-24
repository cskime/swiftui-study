//
//  AlertExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/25.
//

import SwiftUI

struct AlertExample: View {
    
    @State var showAlert = false
    @State var alertType: MyAlerts?
//    @State var alertTitle = ""
//    @State var alertMessage = ""
    @State var backgroundColor = Color.yellow
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Button 1") {
                    alertType = .error
//                    alertTitle = "ERROR UPLOADING VIDEO"
//                    alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video 🥰"
//                    alertMessage = "Your video is noew public!"
                    showAlert.toggle()
                }
            }
            /* alert(isPresented:content:)는 deprecated될 예정
             * alert(_:isPresented:isPresenting:content:)?를 사용해야한다.
             * Stack에 달면 안에 있는 모든 Button에 alert이 달린다.
             */
            .alert(isPresented: $showAlert) {
//                    getBasicAlert()
                getCustomizedAlert()
            }
        }
    }
    
    func getBasicAlert() -> Alert {
        Alert(
            title: Text("There is the title"),
            message: Text("Here we will describe the error."),
//            primaryButton: .destructive(Text("OK")),
            primaryButton: .destructive(Text("Delete"), action: {
                backgroundColor = .red
            }),
//            secondaryButton: .cancel()
            secondaryButton: .cancel(Text("Cancel"), action: {
                backgroundColor = .yellow
            })
        )
    }
    
    func getCustomizedAlert() -> Alert {
        /* Alert type을 사용해서 상황에 따라 다른 alert 사용하기
         */
        switch alertType {
        case .error:
            return Alert(
    //            title: Text(alertTitle),
    //            message: Text(alertMessage),
                title: Text("There was an error")
//                dismissButton: .default(Text("OK"))
            )
            
        case .success:
            return Alert(
                title: Text("This was a success!"),
                message: nil,
                dismissButton: .default(
                    Text("OK"),
                    action: {
                        backgroundColor = .green
                    }
                )
            )
            
        default:
            return Alert(title: Text("ERROR"))
        }
    }
}

struct AlertExample_Previews: PreviewProvider {
    static var previews: some View {
        AlertExample()
    }
}
