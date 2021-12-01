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

    @GestureState private var currentOffset: CGSize = .zero
    @State private var offset: CGSize = .zero

    var body: some View {
        Text(emoji)
            .selectedFrame(isSelected)
            .offset(offset + currentOffset)
            .onTapGesture {
                isSelected.toggle()
            }
            .gesture(isSelected ? dragGesture : nil)
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .updating($currentOffset) { value, state, _ in
                state = value.translation
            }
//            .onChanged {
//                currentOffset = $0.translation
//            }
            .onEnded {
                offset += $0.translation
            }
    }
}

func += (lhs: inout CGSize, rhs: CGSize) {
    lhs.width += rhs.width
    lhs.height += rhs.height
}

func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    .init(width: lhs.width + rhs.width, height: rhs.height + lhs.height)
}
