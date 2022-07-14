	//
	//  Join.swift
	//  SocketioChatApp
	//
	//  Created by jinwoong Kim on 2022/07/12.
	//

import SwiftUI

struct Join: View {
	@State private var username: String = ""
	@State private var channel: String = ""
	@State private var enable: Bool = false
	
	@EnvironmentObject var messageManager: MessageManager
	
	var body: some View {
		NavigationView {
			VStack {
				Image(systemName: "lock")
					.foregroundColor(.white)
					.font(.system(size: 30))
					.padding(10)
					.background(Color("Red"))
					.cornerRadius(50)
					.padding(.bottom)
				
				ZStack(alignment: .leading) {
					if username.isEmpty {
						Text("User name")
							.foregroundColor(.gray.opacity(0.6))
							.padding()
					}
					TextField("", text: $username)
						.autocapitalization(.none)
						.foregroundColor(.white)
						.padding()
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color("Gray"), lineWidth: 2)
						)
				}
				.padding(.horizontal)
				.padding(.bottom)
				
				ZStack(alignment: .leading) {
					if channel.isEmpty {
						Text("Channel")
							.foregroundColor(.gray.opacity(0.6))
							.padding()
					}
					TextField("", text: $channel)
						.autocapitalization(.none)
						.foregroundColor(.white)
						.padding()
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color("Gray"), lineWidth: 2)
						)
				}
				.padding(.horizontal)
				
				NavigationLink(destination: Chat(username: $username, channel: $channel), label: {
					Text("SIGN IN")
						.foregroundColor(.white)
						.frame(maxWidth: .infinity)
						.padding()
						.background(username.isEmpty || channel.isEmpty ? Color(.gray) : Color("Red"))
						.cornerRadius(10)
						.padding()
				})
				.simultaneousGesture(TapGesture().onEnded {
					messageManager.joinChannel(user: username, channel: channel)
				})
				.disabled(username.isEmpty || channel.isEmpty)
				
			}
			.navigationBarTitle("")
			.navigationBarHidden(true)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(Color("Black").ignoresSafeArea())
		}
	}
}

struct Join_Previews: PreviewProvider {
	static var previews: some View {
		Join()
	}
}
