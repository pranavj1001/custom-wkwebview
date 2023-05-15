//
//  ContentView.swift
//  custom-wkwebview
//
//  Created by Pranav Jain on 5/8/23.
//

import Combine
import WebKit
import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    
    @StateObject var model = WebViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    HStack {
                        TextField("Tap an url",
                                  text: $model.urlString)
                            .keyboardType(.URL)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                    
                    Button("Go", action: {
                        model.loadUrl()
                    })
                    .foregroundColor(.white)
                    .padding(10)
                    
                }.padding(10)
                
                ZStack {
                    WebView(webView: model.webView)
                    
                    if model.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
                
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {
                    model.goBack()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                })
                .disabled(!model.canGoBack)
                
                Button(action: {
                    model.goForward()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.right")
                })
                .disabled(!model.canGoForward)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
