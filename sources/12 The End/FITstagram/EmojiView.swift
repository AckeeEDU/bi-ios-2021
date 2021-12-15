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
//                .background(
//                    Rectangle()
//                        .fill(Color.red)
//                )
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

    @GestureState private var currentScale: CGFloat = 1
    @State private var scale: CGFloat = 0

    @GestureState private var currentAngle: Angle = .zero
    @State private var angle: Angle = .zero

    var body: some View {
        Text(emoji)
            .selectedFrame(isSelected)
            .scaleEffect(scale + currentScale)
            .rotationEffect(angle + currentAngle)
            .offset(offset + currentOffset)
            .onTapGesture {
                isSelected.toggle()
            }
            .gesture(isSelected ? dragGesture : nil)
            .gesture(isSelected ? magnificationGesture : nil)
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

    private var magnificationGesture: some Gesture {
        MagnificationGesture()
            .updating($currentScale) { value, state, _ in state = value }
            .onEnded { scale += $0 - 1 }
            .simultaneously(with: rotationGesture)
    }

    private var rotationGesture: some Gesture {
        RotationGesture()
            .updating($currentAngle) { value, state, _ in state = value }
            .onEnded { angle += $0 }
    }
}

func += (lhs: inout CGSize, rhs: CGSize) {
    lhs.width += rhs.width
    lhs.height += rhs.height
}

func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    .init(width: lhs.width + rhs.width, height: rhs.height + lhs.height)
}
