	//
	//  ContentView.swift
	//  SocketioChatApp
	//
	//  Created by jinwoong Kim on 2022/07/12.
	//

import SwiftUI

struct ContentView: View {
	@StateObject var messageManager: MessageManager = MessageManager()
	
	var body: some View {
//		VStack {
//			Text("Received message from NODE")
//				.font(.largeTitle)
//			ForEach(service.messages, id: \.self) { msg in
//				Text(msg).padding()
//			}
//		}
		Join()
			.environmentObject(messageManager)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
