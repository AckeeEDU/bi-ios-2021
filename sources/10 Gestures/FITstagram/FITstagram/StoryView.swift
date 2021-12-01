//
//  StoryView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 01.12.2021.
//

import SwiftUI

struct StoryView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Text("Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "xmark") }
                }
            }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoryView()
        }
    }
}
