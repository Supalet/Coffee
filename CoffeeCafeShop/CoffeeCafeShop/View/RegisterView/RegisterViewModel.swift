//
//  RegisterViewModel.swift
//  CoffeeCafeShop
//
//  Created by Ice on 16/4/2567 BE.
//

import FirebaseCore
import FirebaseAuth
import SwiftUI
import SwiftyJSON
import FirebaseDatabaseInternal

class RegisterViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
	@Published var errorMessage: customAlertModel = customAlertModel()
	@Published var isShowError: Bool = false
    
    var ref: DatabaseReference?
    
    init() {
        self.ref = Database.database().reference()
    }
    
    func registerMember() {
        if (username == "" ||
            email == "" ||
            name == "" ||
            phoneNumber == "" ||
            password == "" ||
            confirmPassword == "" ||
			password != confirmPassword ||
			!password.checkPasswordFormat() ||
			!email.checkEmailFormat()) {
			self.displayError(title: "Error", detail: "กรุณาตรวจสอบข้อมูลให้ครบถ้าน", action: {})
            return
        }
        
        ref?.child("User").observeSingleEvent(of: .value, with: { snapshot in
            let user = JSON(snapshot.value).dictionary?.filter { $0.key == self.username }
            if user?.count == 0 {
                self.ref?.child("User").updateChildValues([String(self.username): ["email": self.email,
                                                                                   "name": self.name,
                                                                                   "phoneNumber": self.phoneNumber,
                                                                                   "password": self.password]])
            } else {
				self.displayError(title: "Error", detail: "เกิดข้อผิดพลาด", action: {})
            }
        })
    }
}

// MARK: - DisplayPopup
extension RegisterViewModel {
	func displayError(title: String, detail: String, action: @escaping (() -> Void)) {
		if !isShowError {
			errorMessage = customAlertModel(title: title, detail: detail, leftTitle: "OK", leftAction: action)
			isShowError = true
		}
	}
}
