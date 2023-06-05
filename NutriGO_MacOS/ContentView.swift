//
//  ContentView.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ViewArtikelMac()) {
                    Label("Beranda", systemImage: "house")
                }
                .tag(1)
                
                NavigationLink(destination: ViewAirMac()) {
                    Label("Pengingat", systemImage: "drop.triangle")
                }
                .tag(2)
                
                NavigationLink(destination: ViewKalkulatorMac()) {
                    Label("Kalkalori", systemImage: "scalemass")
                }
                .tag(3)
                
                NavigationLink(destination: ViewPelacakMac()) {
                    Label("Pelacak", systemImage: "list.bullet")
                }
                .tag(4)
            }
            .listStyle(SidebarListStyle())
            .padding(.top, 20) // Move the list slightly downward
            
            Text("Select an item from the sidebar")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 800, idealWidth: 1000, minHeight: 600) // Set the initial size of the window
        .navigationTitle("Finder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

