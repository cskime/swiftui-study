//
//  CustomModelExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/31.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString  // UserModel을 만들 때 마다 랜덤으로 unique한 id를 만들어 준다.
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct CustomModelExample: View {
    
    /* 실제로는 이름 말고도 더 많은 정보를 갖고 있다. (e.g. id, name, bio, ...)
     * User 같은 custom data model을 만들어서 사용하는 방법
     */
//    @State var users = [
//        "Nick", "Emily", "Samantha", "Chris"
//    ]
    @State var users = [
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "itsemily1995", followerCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", followerCount: 355, isVerified: false),
        UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                /* Custom model을 ForEach나 List의 data로 사용하기 위해 Identifiable protocol을 채택해야 한다.
                 */
//                ForEach(users, id: \.self) { user in
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

struct CustomModelExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomModelExample()
    }
}
