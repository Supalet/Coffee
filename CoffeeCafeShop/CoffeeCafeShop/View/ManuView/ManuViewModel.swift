//
//  ManuViewModel.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import FirebaseCore
import FirebaseAuth
import SwiftUI
import SwiftyJSON
import FirebaseDatabaseInternal

struct ManuModel: Hashable {
	var id: String
	var name: String
	var image: String
	var detail: String
	var type: [ManuTypeModel]
}

struct ManuTypeModel: Hashable {
	var type: String
	var size: [ManuSizeModel]
}

struct ManuSizeModel: Hashable {
	var size: String
	var price: Int
}

class ManuViewModel: ObservableObject {
	@Published var manuList: [ManuModel] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: customAlertModel = customAlertModel()
	@Published var isShowError: Bool = false
	@Published var opacity: CGFloat = UserManager.shared.dbInfo != nil ? 0 : 1
	@Published var navigateToDetail: Bool = false
	
	var ref: DatabaseReference?
	
	init() {
		self.ref = Database.database().reference()
		getManuList()
	}
	
	func getManuList() {
		self.displayIndicater(isShow: true)
		ref?.child("Manu").observeSingleEvent(of: .value, with: { snapshot in
			let response = JSON(snapshot.value).dictionary
			self.manuList = response?.compactMap({ (key: String, value: JSON) in
				var type = value["Type"].dictionaryValue.compactMap { (keyType: String, valueType: JSON) in
					var size = valueType.dictionaryValue.compactMap { (keySize: String, valueSize: JSON) in
						ManuSizeModel(size: keySize, price: valueSize.intValue)
					}
					return ManuTypeModel(type: keyType, size: size)
				}
				return ManuModel(id: value["Id"].stringValue, name: key, image: value["Image"].stringValue, detail: value["Description"].stringValue, type: type)
			}) ?? []
			
			self.displayIndicater(isShow: false)
			if self.manuList.count == 0 {
				self.displayError(title: "Error", detail: "หาข้อมูลไม่เจอ", action: {})
			}
		})
	}
}

// MARK: - DisplayPopup
extension ManuViewModel {
	func displayError(title: String, detail: String, action: @escaping (() -> Void)) {
		if !isShowError {
			errorMessage = customAlertModel(title: title, detail: detail, leftTitle: "OK", leftAction: action)
			isShowError = true
		}
	}
	
	func displayIndicater(isShow: Bool) {
		isLoading = !isLoading && isShow
	}
}
