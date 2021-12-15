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

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

struct DrawingView: View {
    @State var drawings: [[CGPoint]] = [[]]

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.red.opacity(0.001)

                ForEach(drawings, id: \.self) { drawing in
                    Path { path in
                        guard drawing.isEmpty == false else { return }
                        path.move(to: drawing.first!)
                        path.addLines(drawing)
                    }
                    .stroke(.black)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let index = drawings.count - 1
                        let points = drawings[index] + [value.location]
                        drawings[index] = points
                    }
                    .onEnded { _ in
                        drawings.append([])
                    }
            )
        }
    }
}

struct StoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isEmojisPresented = false

    @State private var views: [IdentifiableView] = []//IdentifiableView { EmojiView(emoji: "🤬") }]

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

                Button {
                    views.append(IdentifiableView { DrawingView() })
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
        .sheet(isPresented: $isEmojisPresented) {
            NavigationView {
                EmojisView { emoji in
                    let view = IdentifiableView { EmojiView(emoji: emoji) }
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
