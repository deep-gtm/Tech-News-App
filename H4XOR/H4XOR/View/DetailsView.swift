//
//  DetailsView.swift
//  H4XOR
//
//  Created by Deepanshu Gautam on 13/11/22.
//

import SwiftUI
import WebKit
struct DetailsView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://wwww.google.com")
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    typealias UIViewType = WKWebView
    let urlString : String?
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                DispatchQueue.main.async {
                    uiView.load(request)
                }
            }
        }
    }
}
