//
//  NoteView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 23/4/2567 BE.
//

import SwiftUI

struct NoteView: View {
	var placrHolder: String = ""
	@Binding var note: String
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.stroke(Color(hex: "d9b4ae"), lineWidth: 2)
			
			TextView(placrHolder: placrHolder, text: $note)
				.padding(8)
		}
    }
}

struct TextView: UIViewRepresentable {
	var placrHolder: String = ""
	@Binding var text: String
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(placrHolder: placrHolder, value: $text)
	}
 
	func makeUIView(context: Context) -> UITextView {
		let textView = UITextView()
 
		textView.font = UIFont(name: "Kanit-Regular", size: 16) ?? UIFont()
		textView.autocapitalizationType = .sentences
		textView.isSelectable = true
		textView.delegate = context.coordinator
		textView.isUserInteractionEnabled = true
		textView.textColor = UIColor(Color.gray)
		textView.text = placrHolder
 
		return textView
	}
 
	func updateUIView(_ uiView: UITextView, context: Context) {
		uiView.text = text
		uiView.font = UIFont(name: "Kanit-Regular", size: 16) ?? UIFont()
	}
	
	class Coordinator: NSObject, UITextViewDelegate {
		var placrHolder: String = ""
		var value: Binding<String>
		
		init(placrHolder: String, value: Binding<String>) {
			self.value = value
			self.placrHolder = placrHolder
		}
		
		func textViewDidBeginEditing(_ textView: UITextView) {
			if textView.text == placrHolder {
				textView.text == ""
				textView.textColor = UIColor(Color(hex: "d9b4ae"))
			}
		}
		
		func textViewDidChange(_ textView: UITextView) {
			
		}
		
		func textViewDidEndEditing(_ textView: UITextView) {
			if textView.text == "" {
				textView.text == placrHolder
				textView.textColor = UIColor(Color.gray)
			} else {
				textView.textColor = UIColor(Color(hex: "d9b4ae"))
			}
		}
	}
}
