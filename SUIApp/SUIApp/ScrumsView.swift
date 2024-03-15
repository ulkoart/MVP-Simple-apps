//
//  ScrumsView.swift
//  SUIApp
//
//  Created by Улько Артем Викторович on 09.08.2023.
//

import SwiftUI


struct ScrumsView: View {
	@Binding var scrums: [DailyScrum]
  
	var body: some View {
		NavigationStack {
			List($scrums) { $scrum in
				NavigationLink(destination: DetailView(scrum: $scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColorFixed14iOS)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: {}) {
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
	}
}


struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		ScrumsView(scrums: .constant(DailyScrum.sampleData))
	}
}
