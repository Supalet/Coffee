//
//  ListTagView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 23/4/2567 BE.
//

import SwiftUI

struct ListTagModel: Hashable {
	var id: String
	var name: String
	var isSelect: Bool
}

struct ListTagView: View {
	var title: String = "Type"
	@Binding var list: [ListTagModel]
	
	var callBack: ((String) -> Void)
	
    var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text(title)
				.font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
				.foregroundColor(Color(hex: "d9b4ae"))

			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 10) {
					ForEach(list, id: \.self) { item in
						ListTagCell(detail: item) { name in
							if let index = list.firstIndex(where: { $0.isSelect }) {
								list[index].isSelect = false
							}
							
							if let index = list.firstIndex(where: { $0.name == name }) {
								list[index].isSelect = true
								callBack(list[index].name)
							}
						}
					}
				}
				.padding(.horizontal,3)
			}
		}
    }
}

//#Preview {
//	ListTagView(callBack: { item in print(item) })
//}
