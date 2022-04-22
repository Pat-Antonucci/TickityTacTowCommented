//
//  ContentView.swift
//  Shared
//
//  Created by Jared Davidson on 5/28/21.
//

import SwiftUI

struct ContentView: View {
    //Opens an instance of ticTacToeModel class
    @StateObject var ticTacToeModel = TicTacToeModel()
    //Is the game over....currently not over
    @State var gameOver : Bool = false
    
    //The function that will put an "X" on the gameboard.
    func buttonAction(_ index : Int) {
        _ = self.ticTacToeModel.makeMove(index: index, player: .home)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }
    
    var body: some View {
        VStack {
            Text("Tickity Tac Toe")
            //Name of the game
                .bold()
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom)
                .font(.title2)
            ForEach(0 ..< ticTacToeModel.squares.count / 3, content: {
                row in
                HStack {
                    ForEach(0 ..< 3, content: {
                        column in
                        //Keeps track of the index of the 9 locations 0...8
                        let index = row * 3 + column
                        SquareView(dataSource: ticTacToeModel.squares[index], action: {self.buttonAction(index)})
                        // This is creating the scene of the game itself
                    })
                }
            })
        }.alert(isPresented: self.$gameOver, content: {
            Alert(title: Text("Game Over"),
                  message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .home ? "You Win!": "AI Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                    self.ticTacToeModel.resetGame()
                  }))
            //Code to create an end of the game variable
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
