//
//  MessageManager.swift
//  SocketioChatApp
//
//  Created by jinwoong Kim on 2022/07/14.
//

import Foundation

class MessageManager: ObservableObject {
	private var socket: Socket
	
	@Published private(set) var message: Message = Message(id: "", user: "", text: "", isSender: false)
	
	init() {
		self.socket = Socket()
	}
	
	func joinChannel(user: String, channel: String) {
		socket.joinChannel(nickname: user, channel: channel) { data in
			self.message = Message(id: data.id, user: data.user, text: data.text, isSender: data.isSender)
		}
	}
}
