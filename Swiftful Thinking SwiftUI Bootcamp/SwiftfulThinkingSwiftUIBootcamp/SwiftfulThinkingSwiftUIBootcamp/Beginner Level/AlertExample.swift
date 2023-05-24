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
    
    @State var alertData = "Detail Data"
    
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
//            .alert(isPresented: $showAlert) {
////                    getBasicAlert()
//                getCustomizedAlert()
//            }
            
            /* iOS 15부터는 Alert struct 대신 새로 추가된 .alert modifier를 사용해야 한다.
             * - .alert(_:isPresented:presenting:actions:message:)
             * - presenting : An optional source of truth for the alert. The system passes the contents to the modifier’s closures. You use this data to populate the fields of an alert that you create that the system displays to the user.
             * details: https://medium.com/devtechie/how-to-show-alert-in-swiftui-ios-15-8b99d9dcb214
             */
            .alert("This is an alert", isPresented: $showAlert, presenting: alertData) { data in
                /* Alert에 사용하는 Button에는 `role` parameter를 사용할 수 있다.
                 * cancel role button은 선언한 순서에 상관 없이 항상 leading position에 위치한다. (가장 왼쪽 or 가장 아래쪽)
                 */
                Button("OK") {
                    print("Using data when presenting")
                }
                Button("Not OK", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: { data in
                Text("This is a message with \(data).")
                    /* Message parameter 안에서는 formatting modifier가 동작하지 않는다.
                     * - Only unstyled message supported.
                     */
                    .font(.title)
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
