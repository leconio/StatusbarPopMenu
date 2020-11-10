//
//  PopMenuViewController.swift
//  DragPro
//
//  Created by spawn on 2020/11/10.
//

import Cocoa

class PopMenuViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension PopMenuViewController {
    static func initController() -> PopMenuViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name( "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("PopMenuViewController")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? PopMenuViewController else {
          fatalError("Cannot find PopMenuViewController")
        }
        return viewcontroller
    }
}
