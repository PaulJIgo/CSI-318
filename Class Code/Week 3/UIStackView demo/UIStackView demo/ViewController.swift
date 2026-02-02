//
//  ViewController.swift
//  UIStackView demo
//
//  Created by Paul Igo on 2/2/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // Creating a StackView 
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // We still need to pin the view to our edges in SnapKit
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in 
            make.edges.equalToSuperview()    
        }
        
        createCheckerBoard()
    }
    
    func createFlag() {
        /* The Stackview defaults to these 4 parameters:
         Axis: horizontal
         Distribution: fill
         Alignment: fill
         Spacing: 0.0
         */
        
        // To make a flag we'd want to change the axis
        stackView.axis = .vertical
        // We also want to make the distribution equal for all three
        stackView.distribution = .fillEqually
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let whiteView = UIView() // We don't need to set the background color for this
        
        let redView = UIView()
        redView.backgroundColor = .red
         
        // Now we can add the views, its important to add them to the ARRANGED subviews
        stackView.addArrangedSubview(blueView)
        stackView.addArrangedSubview(whiteView)
        stackView.addArrangedSubview(redView)
    }
    
    func createCheckerBoard() {
        // For our checkboard we want three stackviews, a top middle and bottom row
        let topRow = UIStackView()
        let middleRow = UIStackView()
        let bottomRow = UIStackView()
        
        // Lets make sure our stackViews inside are equally sized
        topRow.distribution = .fillEqually
        middleRow.distribution = .fillEqually
        bottomRow.distribution = .fillEqually
        
        // To reduce code, we can even make an array of colors and loop over them
        let topAndBottomRowColors: [UIColor] = [.black, .white, .black]
        let middleRowColors: [UIColor] = [.white, .black, .white]
        
        for color in topAndBottomRowColors {
            // We can't use just one view here, we need to make a new one for each cell
            let topView = UIView()
            topView.backgroundColor = color
            topRow.addArrangedSubview(topView)
            
            let bottomView = UIView()
            bottomView.backgroundColor = color
            bottomRow.addArrangedSubview(bottomView)
        }
        
        for color in middleRowColors {
            let view = UIView()
            view.backgroundColor = color
            middleRow.addArrangedSubview(view)
        }
        
        // Lets set the parameters we want on our megastackview
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        // Lastly, we can add our newly created Stackviews into our vertical one
        stackView.addArrangedSubview(topRow)
        stackView.addArrangedSubview(middleRow)
        stackView.addArrangedSubview(bottomRow)
    }
    
    func emptyingAStackView() {
        // Our stackview stores our arrangedSubviews as an array of views
        // We can remove them by looping over our views
        for arrangedView in stackView.arrangedSubviews {
            arrangedView.removeFromSuperview()
        }
    }


}

