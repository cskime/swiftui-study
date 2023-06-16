//
//  MenuBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/16.
//

import SwiftUI

/* Picker -> Menu
 * Picker에서 MenuPickerStyle이 Menu라는 UI로 떨어져 나왔다.
 */

struct MenuBootcamp: View {
    var body: some View {
        Menu("Click me!") {
            Button("One") {
                
            }
            
            Button("Two") {
                
            }
            
            Button("Three") {
                
            }
            
            Button("Four") {
                
            }
        }
    }
}

struct MenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MenuBootcamp()
    }
}
