//
//  ExtensionFormat.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import Foundation

// False ไม่เข้าเงื่อนไข
extension String {
	func checkEmailFormat() -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailPred.evaluate(with: self)
	}
	
	func checkPasswordFormat() -> Bool {
		let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$"
		let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
		return passwordPred.evaluate(with: self)
	}
}

public extension Int {
	func toString() -> String {
		return String(self)
	}
	
	func formatNumber() -> String {
		let formater = NumberFormatter()
		formater.locale = Locale(identifier: "en_Us")
		formater.groupingSeparator = ","
		formater.numberStyle = .decimal
		return formater.string(from: NSNumber(value: self)) ?? ""
	}
}

extension Float {
	func format() -> String {
		let formater = NumberFormatter()
		formater.groupingSeparator = ","
		formater.numberStyle = .decimal
		formater.maximumFractionDigits = 2
		return formater.string(from: NSNumber(value: self)) ?? ""
	}
	
	func format(_ digits: Int? = 2) -> String {
		let formater = NumberFormatter()
		formater.groupingSeparator = ","
		formater.numberStyle = .decimal
		formater.minimumFractionDigits = digits ?? 2
		formater.maximumFractionDigits = digits ?? 2
		return formater.string(from: NSNumber(value: self)) ?? ""
	}
}

extension Double {
	func format(_ digits: Int? = 2) -> String {
		let formater = NumberFormatter()
		formater.groupingSeparator = ","
		formater.numberStyle = .decimal
		formater.minimumFractionDigits = digits ?? 2
		formater.maximumFractionDigits = digits ?? 2
		return formater.string(from: NSNumber(value: self)) ?? ""
	}
}
