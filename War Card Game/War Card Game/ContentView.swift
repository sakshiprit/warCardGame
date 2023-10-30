//
//  ContentView.swift
//  War Card Game
//
//  Created by Sakshi Patil on 25/10/2023.
//

import SwiftUI

struct ContentView: View {
	@State var playerCard: String = "card7"
	@State var cpuCard: String = "card13"
	
	@State var playerScore: Int = 0
	@State var cpuScore: Int = 0
	
	var body: some View {
		
		ZStack {
			// Background
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			
			VStack {
				// Headline logo
				Spacer()
				Image("logo")
					.imageScale(.large)
					.foregroundStyle(.tint)
					.padding()
				
				// Cards
				HStack {
					Image(playerCard)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding()
					
					Image(cpuCard)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding()
				}
				Spacer()
				
				// Deal button
				Button {
					deal()
				} label: {
					Image("button")
				}
				
				Spacer()
				HStack {
					Spacer()
					VStack{
						Text("Player")
							.font(.headline)
							.padding(.bottom)
						Text(String(playerScore))
					}
					Spacer()
					VStack{
						Text("CPU")
							.font(.headline)
							.padding(.bottom)
						Text(String(cpuScore))
					}
					
					Spacer()
				}
				.foregroundColor(.white)
				
				.padding()
				Spacer()
			}
			.padding()
		}
		
	}
	
	func deal(){
		// Randomize the player's card
		let playerCardValue = Int.random(in: 2...14)
		playerCard = "card" + String(playerCardValue)
		
		// Randomize the cpu's card
		let cpuCardValue = Int.random(in: 2...14)
		cpuCard = "card" + String(cpuCardValue)
		// Update the cards
		if playerCardValue > cpuCardValue {
			// Add 1 to player score
			playerScore += 1
		} else if cpuCardValue > playerCardValue {
			// Add 1 to cpu score
			cpuScore += 1
		} else {
			// Tie
		}
	}
}

#Preview {
	ContentView()
}
