//
//  EmojisView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 01.12.2021.
//

import SwiftUI

func isEmojiSupported(emoji: String) -> Bool {
    let uniChars = Array(emoji.utf16)
    let font = CTFontCreateWithName("AppleColorEmoji" as CFString, 0.0, nil)
    var glyphs: [CGGlyph] = [0, 0]
    return CTFontGetGlyphsForCharacters(font, uniChars, &glyphs, uniChars.count)
}

let emojis: [String] = {
    (0x1F600...0x1FAF6)
        .compactMap(UnicodeScalar.init)
        .map(String.init)
        .filter(isEmojiSupported)
}()

struct EmojisView: View {
    var onEmojiSelected: (String) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            LazyVGrid(columns: (0..<7).map { _ in GridItem(spacing: 2) }, spacing: 2) {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        onEmojiSelected(emoji)
                        dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(.secondarySystemBackground))

                            Text(emoji)
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding(4)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: { Image(systemName: "xmark") }
            }
        }
    }
}

struct EmojisView_Previews: PreviewProvider {
    static var previews: some View {
        EmojisView { _ in }
    }
}
