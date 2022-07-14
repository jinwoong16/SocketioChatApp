//
//  Message.swift
//  SocketioChatApp
//
//  Created by jinwoong Kim on 2022/07/13.
//

import Foundation

struct Message: Identifiable, Codable {
	var id: String
	var user: String
	var text: String
	var isSender: Bool
	
}
