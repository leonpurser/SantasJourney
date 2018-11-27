import UIKit

protocol SwipeImageViewDelegate {
    func didSwipe(imageView: SwipeImageView)
}

class SwipeImageView: UIImageView {
    
    var images = [UIImage]()

    var currentImage = 0
    
    var delegate: SwipeImageViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(swipe:)))
            gesture.direction = direction
            self.addGestureRecognizer(gesture)
        }
    
        backgroundColor = .red
        isUserInteractionEnabled = true
    }
    
    
    @objc func handleSwipe(swipe: UISwipeGestureRecognizer) {
        
        if swipe.direction == .right {
            currentImage += 1
            
            if currentImage > (images.count - 1) {
                currentImage = 0
            }
        }
        
        if swipe.direction == .left {
            currentImage -= 1
            
            if currentImage < 0 {
                currentImage = images.count - 1
            }
            
        }
    
        image = images[currentImage]
        
        delegate?.didSwipe(imageView: self)
    }
    
    func setImages(names: [String]) {
        for name in names {
            let image = UIImage(named: name)!
            images.append(image)
        }
        image = images.first
    }
    
}
