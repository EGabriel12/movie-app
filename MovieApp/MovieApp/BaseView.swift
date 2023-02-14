//
//  BaseView.swift
//  MovieApp
//
//  Created by Elias Gabriel on 04/02/23.
//

import UIKit

class BaseView: UIView & CustomViewCodeProtocol {
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviews() {
        
    }
    
    func layout() {
        
    }
    
    
}
