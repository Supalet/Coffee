//
//  UserManager.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import Foundation

class UserManager: NSObject {
	static let shared = UserManager()

	public var dbInfo: UserModel? {
		get {
			let defaults = UserDefaults.standard

			do {
				let data = defaults.data(forKey: "user_info_key")
				if data != nil {
					let model = try JSONDecoder().decode(UserModel?.self, from: data!)
					return model
				} else {
					return nil
				}
			} catch _ {
				return nil
			}
		}
		set {
			let defaults = UserDefaults.standard

			do {
				let data = try newValue?.jsonData()
				defaults.set(data, forKey: "user_info_key")
				defaults.synchronize()
			} catch let error {
				print("save data error: \(error.localizedDescription)")
			}
		}
	}
}
