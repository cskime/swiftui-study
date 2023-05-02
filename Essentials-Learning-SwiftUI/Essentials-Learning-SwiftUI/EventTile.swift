//
//  EventTile.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/02.
//

import SwiftUI

struct Event {
    let title: String
    let date: Date
    let location: String
    let symbol: String
}

struct EventTile: View {
    let event: Event
    let stripeHeight = 15.0
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: event.symbol)
                .font(.title)
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                Text(
                    event.date,
                    format: Date.FormatStyle()
                        .day(.defaultDigits)
                        .month(.wide)
                )
                Text(event.location)
            }
        }
        /*
         padding을 중첩해서 사용할 수 있다.
         각각의 padding은 직전 view에 적용되며,
         중첩된 다음 padding은 첫 번째 padding이 적용되어 반환된 새로운 view에 다시 padding을 준다.
         */
        .padding()
        .padding(.top, stripeHeight)
        .background {
            ZStack(alignment: .top) {
                Rectangle()
                    .opacity(0.3)
                Rectangle()
                    .frame(maxHeight: stripeHeight)
            }
            .foregroundColor(.teal)
        }
        .clipShape(RoundedRectangle(cornerRadius: stripeHeight, style: .continuous))
    }
}

struct EventTile_Previews: PreviewProvider {
    static let event = Event(title: "Buy Daisies", date: .now, location: "Flower SHop", symbol: "gift")
    
    static var previews: some View {
        EventTile(event: event)
    }
}
