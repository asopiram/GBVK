//
//  GradientView.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .white {// начальный цвет градиента
        didSet {
            self.updateColors()
            
        }
    }
    
    @IBInspectable var endColor: UIColor = .black {//   конечный цвет градиента
        didSet {
            self.updateColors()
            
        }
    }
    
    @IBInspectable var startLocation: CGFloat = 0 {//   начало градиента
        didSet {
            self.updateLocations()
            
        }
    }
    
    @IBInspectable var endLocation: CGFloat = 1 {//     конец градиента
        didSet {
            self.updateLocations()
            
        }
    }
    
    @IBInspectable var startPoint: CGPoint = .zero {//  точка начала градиента
        didSet {
            self.updateStartPoint()
            
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {//  точка конца градиента
        didSet {
            self.updateEndPoint()
        }
    }
    
    
    override static var layerClass: AnyClass {//меняем класс слоя
        return CAGradientLayer.self
        
    }
    
    var gradientLayer: CAGradientLayer {//создаем вычисляемую переменную для удобной работы со слоем
        return self.layer as! CAGradientLayer
        
    }
    
    //методы, которые обновляют параметры слоя с градиентом
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
        
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
        
    }
    
    func updateStartPoint() {
    self.gradientLayer.startPoint = startPoint
        
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
        
    }

}

