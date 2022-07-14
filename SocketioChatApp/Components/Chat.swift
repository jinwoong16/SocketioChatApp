	//
	//  Chat.swift
	//  SocketioChatApp
	//
	//  Created by jinwoong Kim on 2022/07/12.
	//

import SwiftUI

struct Chat: View {
//	@EnvironmentObject var service: Socket
	
	@Binding var username: String
	@Binding var channel: String
	
	var body: some View {
		ZStack {
			Color("Red").ignoresSafeArea()
			VStack {
				Messages(messages: [Message(id: "1234", user: "sdf", text: "hello! my name is woong", isSender: true), Message(id: "12324", user: "ddk", text: "Oh, you are here now!", isSender: false)])
					.navigationBarTitleDisplayMode(.inline)
					.toolbar(content: {
						ToolbarItem(placement: .principal, content: {
							HStack {
								Image(systemName: "circle.fill")
									.foregroundColor(.green)
									.font(.system(size: 10))
								Text(channel)
									.font(.title2)
									.foregroundColor(Color("Gray"))
							}
						})
					})
				
				// Text field goes here.
				
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(ignoresSafeAreaEdges: .bottom)
		}
	}
}

struct Chat_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			Chat(username: .constant("jinwoong"), channel: .constant("num1"))
				.environmentObject(Socket())
		}
	}
}
