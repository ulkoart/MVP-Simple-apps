//
//  ThemeView.swift
//  SUIApp
//
//  Created by Улько Артем Викторович on 15.09.2023.
//

import SwiftUI

struct ThemeView: View {

	let theme: Theme

	var body: some View {
		Text(theme.name)
			.padding(4)
			.frame(maxWidth: .infinity)
			.background(theme.mainColor)
			.foregroundColor(theme.accentColor)
			.clipShape(RoundedRectangle(cornerRadius: 4))
	}
}

struct ThemeView_Previews: PreviewProvider {
	static var previews: some View {
		ThemeView(theme: .buttercup)
	}
}
