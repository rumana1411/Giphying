
import UIKit

extension UIView {
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension CGPoint {
    func distanceToPoint(_ p:CGPoint) -> CGFloat {
        return sqrt(pow((p.x - x), 2) + pow((p.y - y), 2))
    }
}

struct SwapDescription : Hashable {
    var firstItem : Int
    var secondItem : Int
    
    var hashValue: Int {
        get {
            return (firstItem * 10) + secondItem
        }
    }
}

func ==(lhs: SwapDescription, rhs: SwapDescription) -> Bool {
    return lhs.firstItem == rhs.firstItem && lhs.secondItem == rhs.secondItem
}

func UpdateIndex(_to: Int, _from: Int){
    if _to != _from {
            let _temp = result[_from]
            result[_from] = result[_to]
            result[_to] = _temp
    }
}

class SwappingCollectionView: UICollectionView {
    
    var interactiveIndexPath : IndexPath?
    var interactiveView : UIView?
    var interactiveCell : UICollectionViewCell?
    var swapSet : Set<SwapDescription> = Set()
    var previousPoint : CGPoint?
    
    static let distanceDelta:CGFloat = 2

    override func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool {
        
        self.interactiveIndexPath = indexPath
        
        self.interactiveCell = self.cellForItem(at: indexPath)
        
        self.interactiveView = UIImageView(image: self.interactiveCell?.snapshot())
        self.interactiveView?.frame = self.interactiveCell!.frame
        
        self.addSubview(self.interactiveView!)
        self.bringSubview(toFront: self.interactiveView!)
        
        self.interactiveCell?.isHidden = true
        
        return true
    }
    
    override func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint) {
        
        if (self.shouldSwap(targetPosition)) {
        
            if let hoverIndexPath = self.indexPathForItem(at: targetPosition), let interactiveIndexPath = self.interactiveIndexPath {
                
//                print("To \(hoverIndexPath.row)")
//                print("From \(interactiveIndexPath.row)")
//                
//                 to = hoverIndexPath.row
//                 from = interactiveIndexPath.row
                
                let swapDescription = SwapDescription(firstItem: interactiveIndexPath.item, secondItem: hoverIndexPath.item)
                
                if (!self.swapSet.contains(swapDescription)) {
                
                    self.swapSet.insert(swapDescription)
                    
                    self.performBatchUpdates({
                        self.moveItem(at: interactiveIndexPath, to: hoverIndexPath)
                        self.moveItem(at: hoverIndexPath, to: interactiveIndexPath)
                        
                        //print("To \(hoverIndexPath.row)")
                        //print("From \(interactiveIndexPath.row)")
                        
                        UpdateIndex(_to: hoverIndexPath.row, _from: interactiveIndexPath.row);
                        
                        //to = hoverIndexPath.row
                        //from = interactiveIndexPath.row
                        }, completion: {(finished) in
                            self.swapSet.remove(swapDescription)
                            self.interactiveIndexPath = hoverIndexPath
                    })
                }
            }
        }
        
        self.interactiveView?.center = targetPosition
        self.previousPoint = targetPosition
    }
    
    override func endInteractiveMovement() {
//         print("Final To \(to)")
//         print("Final From \(from)")
        self.cleanup()
    }
    
    override func cancelInteractiveMovement() {
        self.cleanup()
    }

    func cleanup() {
        self.interactiveCell?.isHidden = false
        self.interactiveView?.removeFromSuperview()
        self.interactiveView = nil
        self.interactiveCell = nil
        self.interactiveIndexPath = nil
        self.previousPoint = nil
        self.swapSet.removeAll()
    }
    
    func shouldSwap(_ newPoint: CGPoint) -> Bool {
        if let previousPoint = self.previousPoint {
            let distance = previousPoint.distanceToPoint(newPoint)
            return distance < SwappingCollectionView.distanceDelta
        }
        
        return false
    }
}
