//
//  String.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/03/22.
//

import UIKit

extension String {
    var withoutHtmlTags: NSAttributedString {
        return NSAttributedString(string: replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))
    }
    
    func htmlAttributed(size: CGFloat = 17, color: String? = nil, weight: String? = nil) -> NSAttributedString? {
        let htmlFontSize = size * 0.75
        
        do {
            let htmlCSSString = "<style>" +
                                "html *" +
                                "{" +
                                "font-size: \(htmlFontSize)pt !important;" +
                                "font-family: \("-apple-system"), Helvetica !important;" +
                                "\(weight != nil ? "font-weight: \(weight!);" : "")" +
                                "\(color != nil ? "color: \(color!);" : "")" +
                                "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            let attributedString = try NSMutableAttributedString(data: data,
                                                                 options: [.documentType: NSAttributedString.DocumentType.html,
                                                                           .characterEncoding: String.Encoding.utf8.rawValue],
                                                                 documentAttributes: nil)
            return attributedString
        } catch {
            return nil
        }
    }
}
