//
//  HideTabBarView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/20/23.
//

import SwiftUI

struct HideTabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(
                        title: { Text("") },
                        icon: { Image(systemName: "house.fill") }
                    )
                }
            SettingView()
                .tabItem {
                    Label(
                        title: { Text("Label") },
                        icon: { Image(systemName: "42.circle") }
                    )
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("HomeView")
                NavigationLink(destination: HomeSubView(), label: {
                    Text("Go to subview")
                })
            }
            .showTabBar()
        }
    }
}

struct HomeSubView: View {
    var body: some View {
        Text("Home SubView")
            .hiddenTabBar()
    }
}

struct SettingView: View {
    var body: some View {
        Text("SettingView")
    }
}

#Preview {
    HideTabBarView()
}
