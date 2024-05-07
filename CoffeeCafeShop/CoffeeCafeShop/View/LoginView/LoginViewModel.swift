//
//  LoginViewModel.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import FirebaseCore
import FirebaseAuth
import SwiftUI
import SwiftyJSON
import FirebaseDatabaseInternal

class LoginViewModel: ObservableObject {
	@Published var usernameValue: String = ""
	@Published var passwordValue: String = ""
	@Published var versionApplicationText: String = ""
	@Published var opacity: CGFloat = UserManager.shared.dbInfo != nil ? 0 : 1
	@Published var navigateToRegister = false
	@Published var navigateToHome = false
	
	@Published var isLoading: Bool = false
	@Published var errorMessage: customAlertModel = customAlertModel()
	@Published var isShowError: Bool = false
	
	var ref: DatabaseReference?
	
	init() {
		Auth.auth().createUser(withEmail: "ka.supalert@gmail.com", password: "123456")
		Auth.auth().signIn(withEmail: "ka.supalert@gmail.com", password: "123456") { user, error in
			self.ref = Database.database().reference()
		}
		self.ref = Database.database().reference()
	}
	
	func getVersionApplication() {
		var textVersion = "Version "
		if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
		   let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
			textVersion += appVersion + "(\(buildNumber))"
		}
		versionApplicationText = textVersion
	}
	
	func requestLogin(callBack: @escaping (() -> Void)) {
		if usernameValue == "" || passwordValue == "" {
			displayError(title: "Error", detail: "กรุณาตรวจสอบ username password", action: {})
            return
        }
        
		displayIndicater(isShow: true)
        ref?.child("User").observeSingleEvent(of: .value, with: { snapshot in
			self.displayIndicater(isShow: false)
            let user = JSON(snapshot.value).dictionary?.filter { $0.key.lowercased() == self.usernameValue.lowercased() }
            if user?[self.usernameValue]?["password"].stringValue == self.passwordValue {
				UserManager.shared.dbInfo = UserModel(username: self.usernameValue,
													  email: user?[self.usernameValue]?["email"].stringValue ?? "",
													  name: user?[self.usernameValue]?["name"].stringValue ?? "",
													  phoneNumber: user?[self.usernameValue]?["phoneNumber"].stringValue ?? "",
													  image: user?[self.usernameValue]?["image"].stringValue ?? "")
//				self.navigateToHome.toggle()
				callBack()
            } else {
				self.displayError(title: "Error", detail: "กรุณาตรวจสอบ username password", action: {})
            }
        })
    }
}

// MARK: - DisplayPopup
extension LoginViewModel {
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
