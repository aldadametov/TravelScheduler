//
//  WebView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 19.04.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let urlRequest = createURLRequest() {
            webView.load(urlRequest)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlRequest = createURLRequest() {
            uiView.load(urlRequest)
        }
    }

    private func createURLRequest() -> URLRequest? {
        return URLRequest(url: url)
    }
}


