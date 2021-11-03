//
//  DetailView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/6/21.
//

import SwiftUI

struct DetailView: View {
    var username: String

    var body: some View {
        Text("Your username is \(username)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(username: "username")
    }
}
