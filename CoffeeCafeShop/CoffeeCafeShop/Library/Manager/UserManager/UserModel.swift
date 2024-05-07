//
//  UserModel.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import Foundation

struct UserModel: Codable {
	var username: String
	var email: String
	var name: String
	var phoneNumber: String
	var image: String
}

// MARK: Convenience initializers
extension UserModel {
	init(data: Data) throws {
		self = try JSONDecoder().decode(UserModel.self, from: data)
	}
	
	func jsonData() throws -> Data {
		return try JSONEncoder().encode(self)
	}
	
	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}
