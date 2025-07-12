//
//  ServiceContentViewerWebView.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI
import WebKit

struct ServiceContentViewerWebView: UIViewRepresentable {
    let htmlText: String
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.userContentController.add(context.coordinator, name: "contentHandler")
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        
        if let url = Bundle.main.url(forResource: "service_content_viewer", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        context.coordinator.latestHTML = htmlText
        context.coordinator.injectHTMLIfPossible(in: webView)
    }
    
    class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate {
        private let parent: ServiceContentViewerWebView
        var latestHTML: String
        private var pageLoaded = false
        
        init(_ parent: ServiceContentViewerWebView) {
            self.parent = parent
            self.latestHTML = parent.htmlText
        }
        
        func injectHTMLIfPossible(in webView: WKWebView) {
            guard pageLoaded else { return }
            
            let escaped = latestHTML
                .replacingOccurrences(of: "\\", with: "\\\\")
                .replacingOccurrences(of: "\"",  with: "\\\"")
                .replacingOccurrences(of: "\n", with: "\\n")
                .replacingOccurrences(of: "\r", with: "")
            
            webView.evaluateJavaScript("window.setHTMLContent(\"\(escaped)\");", completionHandler: nil)
        }
        
        func userContentController(_ userContentController: WKUserContentController,
                                   didReceive message: WKScriptMessage) {
            guard message.name == "contentHandler",
                  let dict = message.body as? [String: Any],
                  let type = dict["type"] as? String,
                  type == "pageLoaded"
            else { return }
            
            pageLoaded = true
            if let webView = message.webView {
                injectHTMLIfPossible(in: webView)
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            pageLoaded = true
            injectHTMLIfPossible(in: webView)
        }
    }
}





