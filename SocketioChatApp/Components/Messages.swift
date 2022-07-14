	//
	//  Messages.swift
	//  SocketioChatApp
	//
	//  Created by jinwoong Kim on 2022/07/13.
	//

import SwiftUI

struct Messages: View {
	var messages: [Message] = []
	
	var body: some View {
		ScrollView {
			ForEach(messages) { message in
				MessageBubble(message: message)
			}
			.padding(.top, 20)
		}
	}
}

struct Messages_Previews: PreviewProvider {
	static var previews: some View {
		Messages(messages: [Message(id: "1234", user: "sdf", text: "hello! my name is woong", isSender: true), Message(id: "12324", user: "ddk", text: "Oh, you are here now!", isSender: false)])
	}
}
