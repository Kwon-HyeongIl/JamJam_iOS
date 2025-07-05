//
//  WebView.swift
//  Jamjam
//
//  Created by 권형일 on 7/6/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var markdown: String
    
    // JS 메시지 수신
    final class Coordinator: NSObject, WKScriptMessageHandler {
        var parent: WebView
        init(_ parent: WebView) { self.parent = parent }
        
        func userContentController(_ uc: WKUserContentController,
                                   didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any],
                  body["type"] as? String == "contentChanged",
                  let data = body["data"] as? String else { return }
            
            DispatchQueue.main.async {
                self.parent.markdown = data
            }
        }
    }
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    func makeUIView(context: Context) -> WKWebView {
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "editorHandler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let webView = WKWebView(frame: .zero, configuration: config)
        
        if let url = Bundle.main
            .url(forResource: "serviceContent", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
