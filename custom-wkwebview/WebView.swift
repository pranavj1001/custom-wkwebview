//
//  WebView.swift
//  custom-wkwebview
//
//  Created by Pranav Jain on 5/8/23.
//

import UIKit
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
