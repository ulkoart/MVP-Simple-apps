//
//  Theme.swift
//  SUIApp
//
//  Created by Улько Артем Викторович on 09.08.2023.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
	case bubblegum
	case buttercup
	case indigo
	case lavender
	case magenta
	case navy
	case orange
	case oxblood
	case periwinkle
	case poppy
	case purple
	case seafoam
	case sky
	case tan
	case teal
	case yellow

	var accentColor: Color {
		switch self {
		case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
		case .indigo, .magenta, .navy, .oxblood, .purple: return .white
		}
	}

	var mainColor: Color {
		Color(rawValue)
	}

	var mainColorFixed14iOS: Color {
		switch self {
		case .poppy:
			return Color.red
		case .orange:
			return Color.orange
		case .yellow:
			return Color.yellow
		case .indigo:
			return Color.blue
		default:
			return Color.gray
		}
	}

	var name: String {
		rawValue.capitalized
	}

	var id: String {
			name
	}
}
