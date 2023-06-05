//
//  ContentView.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var artikelViewModel = ViewModelArtikel()
    
    var body: some View {
        TabView {
            ViewArtikel(viewModel: artikelViewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Beranda")
                }

            ViewAir()
                .tabItem {
                    Image(systemName: "drop.triangle")
                    Text("Pengingat")
                }

            ViewKalkulator()
                .tabItem {
                    Image(systemName: "scalemass")
                    Text("Kalkalori")
                }

            ViewPelacak()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Pelacak")
                }
        }
        .background(Color.green)
        .foregroundColor(Color.black)
    }
}
