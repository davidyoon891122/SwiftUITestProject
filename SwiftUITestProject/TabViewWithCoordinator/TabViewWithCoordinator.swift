//
//  TabViewWithCoordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import SwiftUI

struct TabViewWithCoordinator: View {
    
    @ObservedObject var coordinator: TabViewCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.tabViewType) {
            MainView(coordinator: MainCoordinator())
                .tabItem { Label(
                    title: { Text("Main") },
                    icon: { Image(systemName: "42.circle") }
                ) }
                .tag(TabViewType.main)
            AccountView(coordinator: AccountCoordinator(coordinator: coordinator))
                .tabItem { Label(
                    title: { Text("Account") },
                    icon: { Image(systemName: "42.circle") }
                ) }
                .tag(TabViewType.account)
            
            SettingsView(coordinator: SettingsCoordinator(coordinator: coordinator))
                .tabItem { Label(
                    title: { Text("Settings") },
                    icon: { Image(systemName: "42.circle") }
                ) }
                .tag(TabViewType.settings)
        }
    }
}

#Preview {
    TabViewWithCoordinator(coordinator: TabViewCoordinator())
}
