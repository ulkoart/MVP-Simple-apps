//
//  SUIAppApp.swift
//  SUIApp
//
//  Created by Улько Артем Викторович on 09.08.2023.
//

import SwiftUI

@main
struct SUIAppApp: App {
	
	@State private var scrums = DailyScrum.sampleData

	var body: some Scene {
		WindowGroup {
			ScrumsView(scrums: $scrums)
		}
	}
}
