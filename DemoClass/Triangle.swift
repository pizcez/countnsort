//
//  Triangle.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Triangle : Shape {
    var a, b, c: Double
    init (a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
        super.init(numberOfSides: 3, name: "Triangle")
    }
    
    override func perimeter() -> Double {
        return a + b + c
    }
    
    override func area() -> Double {
        let s = 0.5 * self.perimeter()
        return sqrt(s * (s - a) * (s - b) * (s - c))
    }    
    
}