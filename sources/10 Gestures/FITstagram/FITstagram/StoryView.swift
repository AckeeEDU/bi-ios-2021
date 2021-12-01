//
//  StoryView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 01.12.2021.
//

import SwiftUI

struct IdentifiableView: View, Identifiable {
    let id = UUID()
    let content: AnyView

    init<Content: View>(content: () -> Content) {
        self.content = AnyView(content())
    }

    var body: some View {
        content
    }
}

struct StoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isEmojisPresented = false

    @State private var views: [IdentifiableView] = []

    var body: some View {
        ZStack {
            ForEach(views) { view in
                view
            }
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
                EmojisView { emoji in
                    let view = IdentifiableView { Text(emoji) }
                    views.append(view)
                }
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
