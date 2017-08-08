# ScrollUISegmentController
Scrollable iOS segment controller swift3  

# ScreenShots

![N|Solid](https://github.com/AliAdam/ScrollUISegmentController/blob/master/appDemo.gif?raw=true)

# How to use 
- Drag and drop `ScrollUISegmentController.swift` into your project 
- you can add it manually by code like this 
```  
func addScrollUISegmentController() {
let segmentItems = ["1","2","3","4","5","6","7","8","9","10"]
let segment = ScrollUISegmentController.init(frame: CGRect(x:10 ,y:30,width:self.view.frame.width - 20,height: 50), andItems: segmentItems)
segment.segmentDelegate = self
segment.tag = 2
segment.itemWidth = 50
segment.segmentTintColor = .blue
self.view.addSubview(segment)
}
```
- implement this delegate to get notified when item clicked  `ScrollUISegmentControllerDelegate` 
```  
func selectItemAt(index: Int, onScrollUISegmentController scrollUISegmentController: ScrollUISegmentController) {
print("select Item At\(index) in scrollUISegmentController with tag  \(scrollUISegmentController.tag) ")
}
```
From Storyboard:
- add ui view to your controller change it's class to `ScrollUISegmentController`
- initialize it  like this 
```
segment.segmentDelegate = self
segment.tag = 1
segment.segmentItems = ["1","2","3","4","5","6","7","8","9","10"]
```
- implement this delegate to get notified when item clicked  `ScrollUISegmentControllerDelegate` 
```  
func selectItemAt(index: Int, onScrollUISegmentController scrollUISegmentController: ScrollUISegmentController) {
print("select Item At\(index) in scrollUISegmentController with tag  \(scrollUISegmentController.tag) ")
}
```
