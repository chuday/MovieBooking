//
//  DateButton.swift
//  movieBooking
//
//  Created by Mikhail Chudaev on 19.06.2023.
//

import SwiftUI

struct DateButton: View {
    
    @State var weekDay: String = "Sat"
    @State var numDay: String = "23"
    
    @State var width: CGFloat = 50
    @State var height: CGFloat = 80
    
    @State var action: () -> Void = {}
    
    @Binding var isSelected: Bool
    
    var currentBorderColors: [Color] = [Color("cyan"), Color("cyan").opacity(0), Color("cyan").opacity(0)]
    var currentGradient: [Color] = [Color("backgroundColor"), Color("grey")]
    
    var selectedBorderColors: [Color] = [Color("pink"), Color("pink").opacity(0), Color("pink").opacity(0)]
    var selectedGradient: [Color] = [Color("majenta"), Color("backgroundColor")]
    
    var body: some View {
        
        Button {
            action()
        } label: {
            VStack {
                Text(weekDay)
                
                Text(numDay)
                    .fontWeight(.bold)
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(LinearGradient(colors: isSelected ? selectedGradient : currentGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(colors: isSelected ? selectedBorderColors : currentBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(width: width - 1, height: height - 1)
            }
        }
    }
}
