//
//  SquareView.swift
//  TickityTacTow
//
//  Created by Jared Davidson on 5/28/21.
//

import Foundation
import SwiftUI
// creates three options for the status of the square, empty, home, or visitor
enum SquareStatus {
    case empty
    case home
    case visitor
}

// setting up the back ends of the squares, it allows us to look at the status during the game
class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    
    init(status : SquareStatus) {
        self.squareStatus = status
    }
}
// struct?? front end...what we see... It is setting up the button for each action
struct SquareView : View {
    @ObservedObject var dataSource : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                    "X" : self.dataSource.squareStatus == .visitor ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
                .frame(width: 70, height: 70, alignment: .center)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .padding(4)
        })
    }
}

