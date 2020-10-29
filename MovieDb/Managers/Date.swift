//
//  Date.swift
//  MovieDb
//
//  Created by Jonathan Ng on 28/10/2020.
//

import Foundation
extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
