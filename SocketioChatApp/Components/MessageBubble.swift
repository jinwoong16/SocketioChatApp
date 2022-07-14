	//
	//  MessageBubble.swift
	//  SocketioChatApp
	//
	//  Created by jinwoong Kim on 2022/07/13.
	//

import SwiftUI

struct MessageBubble: View {
	var message: Message
	
	var body: some View {
		VStack(alignment: message.isSender ? .trailing : .trailing) {
			Text(message.text)
				.padding()
				.background(message.isSender ? Color("Gray") : Color("Red"))
				.foregroundColor(message.isSender ? Color(.black) : Color(.white))
				.cornerRadius(20)
				.frame(maxWidth: 300, alignment: message.isSender ? .trailing : .leading)
		}
		.frame(maxWidth: .infinity, alignment: message.isSender ? .trailing : .leading)
		.padding(message.isSender ? .trailing : .leading)
		.padding(.bottom, 20)
	}
}

struct MessageBubble_Previews: PreviewProvider {
	static var previews: some View {
		MessageBubble(message: Message(id: "123214", user: "hehe", text: "lorem dlema didmsiekdm alsemfdk dksmmmdk qpdmxielfn dkem dlsmemd kdmen skdmensk nndke aqpzmvdlek", isSender: true))
	}
}
