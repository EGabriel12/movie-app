//
//  CustomViewCodeProtocol.swift
//  MovieApp
//
//  Created by Elias Gabriel on 04/02/23.
//

import UIKit

protocol CustomViewCodeProtocol {
    func subviews()
    func layout()
}

extension CustomViewCodeProtocol {
    func commonInit() {
        subviews()
        layout()
    }
}

