//
//  ManuDetailViewModel.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 23/4/2567 BE.
//

import SwiftUI

class ManuDetailViewModel: ObservableObject {
	@Published var manu: ManuModel = ManuModel(id: "", name: "", image: "", detail: "", type: [])
	@Published var typeList: [ListTagModel] = []
	@Published var sizeList: [ListTagModel] = []
	@Published var amount = 0
	
	func getTypeList() {
		typeList = manu.type.compactMap({ item in
			ListTagModel(id: "", name: item.type, isSelect: false)
		})
		amount = 0
	}
	
	func getSizeList(nameType: String) {
		if let indexType = typeList.firstIndex(where: { $0.isSelect }) {
			typeList[indexType].isSelect = false
		}
		if let indexTypeSelect = typeList.firstIndex(where: { $0.name == nameType }) {
			typeList[indexTypeSelect].isSelect = true
			sizeList = manu.type[indexTypeSelect].size.compactMap({ item in
				ListTagModel(id: "", name: item.size, isSelect: false)
			})
		} else {
			sizeList = []
		}
		amount = 0
	}
	
	func selectSize(nameSize: String) {
		if let indexSize = sizeList.firstIndex(where: { $0.isSelect }) {
			sizeList[indexSize].isSelect = false
		}
		if let indexSizeSelect = sizeList.firstIndex(where: { $0.name == nameSize }) {
			sizeList[indexSizeSelect].isSelect = true
		}
		amount = 0
	}
}
