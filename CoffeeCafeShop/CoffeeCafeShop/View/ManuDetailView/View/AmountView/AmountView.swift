//
//  AmountView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 23/4/2567 BE.
//

import SwiftUI

struct AmountView: View {
	@Binding var amount: Int
	
    var body: some View {
		HStack(spacing: 20) {
			Button {
				if amount != 0 {
					amount -= 1
				}
			} label: {
				Image(systemName: "minus.circle")
					.resizable()
					.foregroundColor(Color(hex: "d9b4ae"))
					.frame(width: 20, height: 20)
			}
			
			Text(amount.formatNumber())
				.lineLimit(1)
				.font(FontManager.sheard.getCustomFont(type: .regular, size: 25))
				.foregroundColor(Color(hex: "d9b4ae"))
			
			Button {
				amount += 1
			} label: {
				Image(systemName: "plus.circle")
					.resizable()
					.foregroundColor(Color(hex: "d9b4ae"))
					.frame(width: 20, height: 20)
			}
		}
		.frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
	AmountView(amount: .constant(0))
}
