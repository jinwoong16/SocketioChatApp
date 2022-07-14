//
//  Socket.swift
//  SocketioChatApp
//
//  Created by jinwoong Kim on 2022/07/12.
//

import Foundation
import SocketIO

final class Socket {
	private var manager = SocketManager(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress])
	private var socket: SocketIOClient
	
	init() {
		self.socket = manager.defaultSocket
		self.socket.on(clientEvent: .connect, callback: { (data, ack) in
			print("Connected")
			self.socket.emit("NodeJS Server Port", "Connected with Client now.")
		})
		
		self.socket.connect()
	}
	
	func joinChannel(nickname: String, channel: String, completion: @escaping (_ res: Message) -> ()) {
		self.socket.emit("join", ["name": nickname, "channel": channel])
		self.socket.on("message", callback: { data, ack in
			do {
				let dat = try JSONSerialization.data(withJSONObject: data[0])
				let res = try JSONDecoder().decode(Message.self, from: dat)
				completion(res)
			} catch {
				print(error)
			}
		})
	}
}
