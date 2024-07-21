//
//  Settings.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 04.07.24.
//

import SwiftUI
//import RevenueCat
//import RevenueCatUI

struct Settings: View {
    
    @Environment(\.dismiss) var dismiss
    
//    @EnvironmentObject var dataManager: DataManager
    
    @State private var showingPaywall: Bool = false
    
    @AppStorage("oldView") var oldView: Bool = false
    @AppStorage("minimalistView") var minimalist: Bool = false
    @AppStorage("showingTitle") var showingTitle: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NavigationLink {
//                            if !dataManager.isSubscriptionActive {
////                                PaywallView(displayCloseButton: false)
//                            } else {
//                                VStack {
//                                    Text("🎉")
//                                        .font(.system(size: 60))
//                                    Text("Yay!")
//                                        .font(.title2)
//                                        .bold()
//                                    Text("You are a Pro Member! Thank you for supporting my app!")
//                                }
//                            }
                        } label: {
                            Label {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("cluu")
                                            .foregroundColor(.primary)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Text("Pro")
                                            .foregroundColor(.primary)
                                            .padding(2)
                                            .background(LinearGradient(colors: [Color.indigo, Color.purple], startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 1.0, y: 1.0))
                                                .opacity(0.5))
                                            .cornerRadius(4)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Spacer()
//                                        if dataManager.isSubscriptionActive {
//                                            Image(systemName: "checkmark.circle")
//                                                .background(Color.green)
//                                                .font(.title3)
//                                                .fontWeight(.bold)
//                                                .cornerRadius(100)
//                                                .foregroundStyle(Material.thick)
//                                        } else {
//                                            Image(systemName: "xmark.circle")
//                                                .background(Color.red)
//                                                .font(.title3)
//                                                .fontWeight(.bold)
//                                                .cornerRadius(100)
//                                                .foregroundStyle(Material.thick)
//                                        }
                                    }
                                    .padding(.leading)
                                }
                            } icon: {
                                Image("prologo")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(15)
                                    .scaledToFit()
                                    .frame(width: 70, height: 60)
                                    .padding(.leading)
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                    Section {
                        NavigationLink {
                            ScrollView {
                                VStack {
                                    Text("For Changing the Language, go to Settings > Looped > Language. Then select your Language.")
                                        .padding()
                                        .background(Material.regular)
                                        .cornerRadius(15)
                                        .padding()
                                    Spacer()
                                }
                            }
                        } label: {
                            Label {
                                Text("Language")
                            } icon: {
                                Image("language")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
//                            ChangeAppIconView()
//                                .environmentObject(dataManager)
                        } label: {
                            Label {
                                Text("App Icon")
                            } icon: {
                                Image("icon")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
                            NavigationStack {
                                ScrollView {
                                    VStack (alignment: .leading) {
                                        Button {
                                            oldView = false
                                            minimalist = false
                                        } label: {
                                            HStack {
                                                Text("Use New Version")
                                                Spacer()
                                                if (!oldView && !minimalist) {
                                                    Image(systemName: "checkmark")
                                                        .foregroundStyle(Color.blue)
                                                }
                                            }
                                            .padding()
                                            .background(Material.thin)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.horizontal)
                                        }
                                        Button {
                                            oldView = true
                                            minimalist = false
                                        } label: {
                                            HStack {
                                                Text("Use Old Version")
                                                Spacer()
                                                if (oldView && !minimalist) {
                                                    Image(systemName: "checkmark")
                                                        .foregroundStyle(Color.blue)
                                                }
                                            }
                                            .padding()
                                            .background(Material.thin)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.horizontal)
                                        }
                                        Button {
                                            minimalist = true
                                            oldView = false
                                        } label: {
                                            HStack {
                                                Text("Use Minimalistic Version")
                                                Spacer()
                                                if (!oldView && minimalist) {
                                                    Image(systemName: "checkmark")
                                                        .foregroundStyle(Color.blue)
                                                }
                                            }
                                            .padding()
                                            .background(Material.thin)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.horizontal)
                                        }
                                    }
                                    HStack {
                                        Text("Choose here, what you want Looped to look like.")
                                            .font(.footnote)
                                            .padding(.horizontal)
                                            .padding(.top, 5)
                                            .foregroundStyle(.secondary)
                                        Spacer()
                                    }
                                    Toggle("Showing Title", isOn: $showingTitle)
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .background(Material.thin)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.horizontal)
                                }
                                .navigationTitle("Appearance")
                            }
                        } label: {
                            Label {
                                Text("Appearance")
                            } icon: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(Color.blue)
                                    Image(systemName: "viewfinder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 17)
                                        .foregroundStyle(Color.white)
                                        .bold()
                                }
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                    Section {
                        NavigationLink {
//                            WebView(url: URL(string: "https://mja.technology/apps/looped/faq")!)
                        } label: {
                            Label {
                                Text("FAQ")
                            } icon: {
                                Image("faq")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        
                        Link(destination: URL(string: "https://apps.apple.com/app/id6473401972?action=write-review")!) {
                            Label {
                                Text("Rate the App")
                            } icon: {
                                Image("rate")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .foregroundStyle(.primary)
                        .listRowBackground(Color.gray.opacity(0.1))
                        
                        ShareLink(item: URL(string: "https://apps.apple.com/app/id6473401972")!){
                            Label {
                                Text("Share Looped")
                            } icon: {
                                Image("share")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .foregroundStyle(.primary)
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                    Section {
                        NavigationLink {
                            ScrollView {
                                VStack {
                                    Text("Looped was developed to help you focus on your habits and succeed with them. The app should help you to have an overview over the days you either succeeded or failed with your habit.")
                                        .italic()
                                        .padding()
                                        .background(Material.regular)
                                        .cornerRadius(15)
                                        .padding()
//                                    Text(verbatim: "Version \(AppVersionProvider.appVersion())")
                                        .bold()
                                        .padding(10)
                                        .background(Material.regular)
                                        .cornerRadius(15)
                                        .padding()
                                        .foregroundColor(.secondary)
                                    Spacer()
                                }
                            }
                        } label: {
                            Label {
                                Text("About this App")
                            } icon: {
                                Image("about")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
                            NavigationStack {
//                                Changelog()
//                                    .navigationTitle("Changelog")
                            }
                        } label: {
                            Label {
                                Text("Changelog")
                            } icon: {
                                Image("changelog")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
//                            WebView(url: URL(string: "https://www.mja.technology/apps/looped/privacy-policy")!)
                        } label: {
                            Label {
                                Text("Privacy Policy")
                            } icon: {
                                Image("privacy")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
//                            WebView(url: URL(string: "https://www.mja.technology/apps/imprint")!)
                        } label: {
                            Label {
                                Text("Imprint")
                            } icon: {
                                Image("imprint")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                        NavigationLink {
//                            WebView(ur/*l: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")*/!)
                        } label: {
                            Label {
                                Text("Terms of Use")
                            } icon: {
                                Image("terms")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .listRowBackground(Color.gray.opacity(0.1))
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Image("dev")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 140)
                            Text("Made with ♥ in Germany")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                            Text("Thank you for using Looped!")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.top, -30)
                    .frame(height: 150)
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                
            }
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onAppear {
//                Purchases.shared.getCustomerInfo { (customerInfo, error) in
//                    dataManager.isSubscriptionActive = customerInfo?.entitlements.all["pro"]?.isActive ?? false
//                }
            }
            .sheet(isPresented: $showingPaywall) {
//                PaywallView(displayCloseButton: true)
            }
        }
    }
}

#Preview {
    Settings()
//        .environmentObject(DataManager())
}
