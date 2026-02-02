//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    override func viewDidLoad() {
        let redView = UIView() 
        redView.backgroundColor = .red
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 0, y: 450, width: 100, height: 100)
        
        redView.frame = CGRect(x: 0, y: 550, width: 500, height: 100)
        view.addSubview(redView)
        view.addSubview(blueView)
        
        let whiteView = UIView()
        blueView.addSubview(whiteView)
        
        
        whiteView.frame = CGRect(x: 35, y: 35, width: 30, height: 30)
        whiteView.backgroundColor = .white
        
        createIreland()
        
    }
    
    
    func createIreland() {
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        
        orangeView.frame = CGRect(x: 0, y: 125, width: 125, height: 300)
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        
        greenView.frame = CGRect(x: 275, y: 125, width: 125, height: 300)
        
        view.addSubview(greenView)
        view.addSubview(orangeView)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
