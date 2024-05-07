//
//  ListTagCell.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 23/4/2567 BE.
//

import SwiftUI

struct ListTagCell: View {
	@State var detail: ListTagModel = ListTagModel(id: "0", name: "M", isSelect: false)
	
	var callBack: ((String) -> Void)
	
	var body: some View {
		ZStack {
			Button {
				callBack(detail.name)
			} label: {
				Text(detail.name)
					.padding(.horizontal, 16)
					.padding(.vertical, 8)
					.background(detail.isSelect ? Color(hex: "d9b4ae") : Color.clear)
					.foregroundColor(detail.isSelect ? Color.white : Color(hex: "d9b4ae"))
					.cornerRadius(10)
					.font(FontManager.sheard.getCustomFont(type: .bold, size: 16))
					.overlay (
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color(hex: "d9b4ae"), lineWidth: 2)
					)
			}
		}
		.padding(.vertical, 1)
    }
}

#Preview {
	ListTagCell(callBack: { item in print(item) })
}
