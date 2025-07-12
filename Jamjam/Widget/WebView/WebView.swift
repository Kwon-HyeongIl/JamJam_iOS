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

    final class Coordinator: NSObject, WKScriptMessageHandler {
        private let html: Binding<String>

        weak var webView: WKWebView?
        private var editorReady   = false
        private var lastPushed    = ""

        init(html: Binding<String>) {
            self.html = html
        }

        // JS → Swift
        func userContentController(_ uc: WKUserContentController,
                                   didReceive msg: WKScriptMessage) {

            guard let body = msg.body as? [String: Any],
                  let type = body["type"] as? String else { return }

            switch type {
            case "contentChanged":
                if let newHTML = body["data"] as? String {
                    DispatchQueue.main.async {
                        self.html.wrappedValue = newHTML
                        self.lastPushed        = newHTML
                    }
                }

            case "editorReady":
                editorReady = true
                pushIfNeeded()

            default: break
            }
        }

        // Swift → JS
        func pushIfNeeded() {
            guard editorReady, let webView else { return }

            let current = html.wrappedValue
            guard current != lastPushed else { return }
            lastPushed = current

            let esc = current
                .replacingOccurrences(of: "\\", with: "\\\\")
                .replacingOccurrences(of: "\"", with: "\\\"")
                .replacingOccurrences(of: "\n", with: "\\n")

            let js = "window.setEditorContent(\"\(esc)\");"
            webView.evaluateJavaScript(js, completionHandler: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(html: $markdown)
    }

    func makeUIView(context: Context) -> WKWebView {
        let uc = WKUserContentController()
        uc.add(context.coordinator, name: "editorHandler")

        let cfg = WKWebViewConfiguration()
        cfg.userContentController = uc

        let webView = WKWebView(frame: .zero, configuration: cfg)
        context.coordinator.webView = webView

        if let url = Bundle.main.url(forResource: "serviceContent",
                                     withExtension: "html") {
            webView.loadFileURL(url,
                                 allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
