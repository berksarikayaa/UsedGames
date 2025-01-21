//
//  ContentView.swift
//  UsedGames
//
//  Created by Berk Sarikaya on 20.01.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @ObservedObject var gameStore = GameStore()
    
    @State var gameToDelete: Game?
    
    var body: some View {
        NavigationView {
            List{
                ForEach(gameStore.games) { (game) in
                    NavigationLink(destination: Text(game.name)){GameListItem(game: game)
                    }
                }
                .onDelete(perform: {indexSet in self.gameToDelete = gameStore.game(at: indexSet)
                })
                .onMove(perform: {indices, newOffset in gameStore.move(indices: indices, to: newOffset)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle("UsedGames")
            .navigationBarItems(leading: EditButton(),
                                 trailing: Button(action: {gameStore.createGame()} ,label: {Text("Add")}))
            .navigationBarTitleDisplayMode(.large)
            .animation(.easeIn)
            .actionSheet(item:$gameToDelete) {(game) -> ActionSheet in
                ActionSheet(title: Text("Are you sure?"), message: Text("You will delete\(game.name)"),
                            buttons: [.cancel(),
                                      .destructive(Text("Delete"),
                                                   action: {
                    if let indexSet = gameStore.indexSet(for:game){
                        gameStore.delete(at: indexSet)
                    }
                    
                })
                            ])
            }
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


