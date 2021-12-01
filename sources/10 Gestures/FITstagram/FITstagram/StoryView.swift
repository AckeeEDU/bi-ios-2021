//
//  StoryView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 01.12.2021.
//

import SwiftUI

struct StoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State var isEmojisPresented = false

    var body: some View {
        ZStack {
            Text("Stories")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: { Image(systemName: "xmark") }
            }

            ToolbarItemGroup(placement: .bottomBar) {
                Button { isEmojisPresented = true } label: { Image(systemName: "face.smiling") }
            }
        }
        .sheet(isPresented: $isEmojisPresented) {
            NavigationView {
                EmojisView()
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
