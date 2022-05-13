//
//  EmptyStateView.swift
//  JerryDaiApp
//
//  Created by Jerry Dai on 2022-05-12.
//

import SwiftUI

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "music.note")
        .font(.system(size: 85))
        .padding(.bottom)
      Text("Start searching for music...")
        .font(.title)
      Spacer()
    }
    .padding()
    .foregroundColor(Color(.systemIndigo))
  }
}
