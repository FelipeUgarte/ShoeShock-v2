//
//  CongratulationsView.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 16-07-22.
//

import SwiftUI

struct CongratulationsView: View {

    var dismiss: (() -> Void)?
    var present: (() -> Void)?

    var body: some View {
        NavigationView {
            VStack {
                Text("Congratulations!")
                    .font(.title)
                    .foregroundColor( .blue)

                Text("Your Purchase was successful")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.009, brightness: 0.473))
                Button {
                    self.present?()
                } label: {
                    Text("Go back to home")
                }
                .padding()

            }
            .navigationTitle("Purchase confirmation")
        }
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
//        CongratulationsView(dismiss: {})
        CongratulationsView(dismiss: {}, present: {})
    }
}
