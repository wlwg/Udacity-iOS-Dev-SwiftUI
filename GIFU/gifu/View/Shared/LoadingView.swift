//
//  LoadingView.swift
//  gifu
//
//  Created by Will Wang on 2020-07-21.
//  Copyright © 2020 EezyFun. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var show: Bool = false

    var body: some View {
        Image("loading")
            .renderingMode(.template)
            .foregroundColor(Color.primaryColor)
            .rotationEffect(Angle(degrees: show ? 360 : 0))
            .animation(
                Animation.linear(duration: 0.4).repeatForever(autoreverses: false)
            )
            .onAppear() {
                self.show.toggle()
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
