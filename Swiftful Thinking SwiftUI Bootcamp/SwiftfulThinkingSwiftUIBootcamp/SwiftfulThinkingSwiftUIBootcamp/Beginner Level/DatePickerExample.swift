//
//  DatePickerExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct DatePickerExample: View {
    
    @State var selectedDate = Date.now
    let startingDate = Calendar.current.date(
        from: DateComponents(year: 2018)
    ) ?? Date.now
    let endingDate = Date.now
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            
            Text("SELECTED DATE IS :")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            /* - displayedComponents로 date와 time중 실제로 사용(표시)할 component를 정한다.
             *   - .date or .hourAndMinute or [.date, .hourAndMinute]
             * - in: closedRange에 `Date` 범위를 넣으면, 실제로 선택할 수 있는 날짜의 범위를 지정할 수 있다.ㅇ
             */
            DatePicker(
                "Select a Date",
                selection: $selectedDate,
                in: startingDate...endingDate,
                displayedComponents: .date
            )
            /* foregroundColor는 title은 변경시키지만 date/time 버튼의 text 색상은 변경시키지 않음
             * 영상에서는 acceontColor()를 사용하면 date/time 버튼의 text 색상도 변경되지만 실제로는 그렇지 않았다. (iOS 16이라서?)
             * accentColor()는 iOS 15에서 deprecated 되었으므로 tint()를 사용해야 한다.
             */
            .foregroundColor(.red)
            //            .accentColor(.red)
            //            .tint(.red)
            .datePickerStyle(
                //                .compact        // date/time 선택하는 버튼으로 표시
                .graphical      // 실제 달력이 나타남. displayedComponent가 .dateAndMinute이면 그냥 버튼만 표시된다.
                //                .wheel          // Picker처럼 wheel 형태로 보여줌
            )
        }
    }
}

struct DatePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExample()
    }
}
