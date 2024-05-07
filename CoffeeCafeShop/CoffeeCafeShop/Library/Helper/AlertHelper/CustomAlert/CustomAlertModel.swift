//
//  CustomAlertModel.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import Foundation

struct customAlertModel {
	var title: String?
	var detail: String?
	var leftTitle: String?
	var rightTitle: String?
	var leftAction: (() -> Void)?
	var rightAction: (() -> Void)?
}
