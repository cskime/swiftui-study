//
//  OnboardingView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/07.
//

import SwiftUI

struct OnboardingView: View {
    
    /* Onboardin State:
     * 0 : Welcome screen
     * 1 : Add name
     * 2 : Add age
     * 3 : Add gender
     */
    @State private var onboardingState = 0
    
    /* Insertion / Removal transition을 다르게 설정함
     * 여러 View에서 재사용하기 위해 AnyTransition 추출
     */
    private let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    // Onboarding Inputs
    @State private var name = ""
    @State private var age: Double = 50
    @State private var gender = ""
    
    // for the alert
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignIn = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}


// MARK: - COMPONENTS

extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            /* Disable animations on a specific view
             * ref : https://www.avanderlee.com/swiftui/disable-animations-transactions/
             * 1. animation(nil) : iOS 15에서 deprecated
             * 2. animation(nil, value: UUID()) : iOS 15부터 사용하는 새로운 animation. 하지만 UUID를 넣는건 마음에 안든다.
             * 3. transaction : transaction.animation을 nil로 설정하는 방법.
             */
//            .animation(nil)
//            .animation(nil, value: UUID())
            .transaction { $0.animation = nil }
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                /* Underline */
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            /* 가운데에서 살짝 위로 올라가게 만들기 위해 Spacer 두 개 사용 */
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(String(format: "%.0f", age))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            /* 영상에서는 menu style로 설정
             * iOS 15? 부터는 기본값이 menu인 것 같다.
             * iOS 15부터는 menu style이 영상처럼 나오지 않는다.
             * Submenu는 이제 'Menu'를 사용해야 한다. iOS 15부터 Picker에서 분리되었다.
             */
//            Picker(selection: $gender) {
                  /* 실제 picker의 값이 String 타입이므로 tag도 String 타입으로 설정했다.
                   */
//                Text("Male").tag("Male")
//                Text("Female").tag("Female")
//                Text("Non-Binary").tag("Non-Binary")
//            } label: {
//                Text("Select a gender")
//                    .font(.headline)
//                    .foregroundColor(.purple)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(.white)
//                    .cornerRadius(10)
//            }
//            .pickerStyle(.menu)
            
            Menu {
                Button("Male") {
                    gender = "Male"
                }
                Button("Female") {
                    gender = "Female"
                }
                Button("Non-Binary") {
                    gender = "Non-Binary"
                }
            } label: {
                Text(gender.isEmpty ? "Select a gender" : gender)
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}


// MARK: - FUNCTIONS

extension OnboardingView {
    
    func handleNextButtonPressed() {
        
        // Check Inputs
        switch onboardingState {
        case 1:
            /* 입력한 이름이 3글자 이상일 때만 다음 단계를 진행할 수 있다. */
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 😩")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! 😳")
                return
            }
            
        default:
            break
        }
        
        // Go to next section
        if onboardingState == 3 {
            signIn()
        } else {
            /* Animation을 주면 화면이 바뀔 때 fade in/out animation이 적용된다.
             */
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        
        withAnimation(.spring()) {
            currentUserSignIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
