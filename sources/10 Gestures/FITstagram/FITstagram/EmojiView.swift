//
//  EmojiView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 01.12.2021.
//

import SwiftUI

extension View {
    @ViewBuilder
    func selectedFrame(_ isSelected: Bool) -> some View {
        if isSelected {
            self
                .padding()
                .overlay(
                    Rectangle()
                        .stroke()
                )
        } else {
            self
        }
    }
}

struct EmojiView: View {
    let emoji: String

    @State private var isSelected = false

    var body: some View {
        Text(emoji)
            .selectedFrame(isSelected)
            .onTapGesture {
                isSelected.toggle()
            }
    }
}
