//
//  MainController.swift
//  SlideController_Example
//
//  Created by Evgeny Dedovets on 8/10/17.
//  Copyright © 2017 Panda Systems. All rights reserved.
//

import UIKit
import SlideController

class MainController {
    fileprivate let _view = MainView()
    fileprivate let _scrollControler : ScrollController<MainTitleScrollView, MainTitleItem>!
    
    init() {
        let pagesContent = [
            PageScrollViewModel(object: PageLifeCycleObject()),
            PageScrollViewModel(className: "SlideController_Example.PageLifeCycleObject"),
            PageScrollViewModel(className: "SlideController_Example.PageLifeCycleObject")]
        _scrollControler = ScrollController(pagesContent : pagesContent, startPageIndex: 0, scrollDirection: ScrollDirection.Horizontal)
        for index in 0..<_scrollControler.content.count {
            _scrollControler.titleView.items[index].titleLabel.text = String(format: "page %d", index + 1)
        }
        _view.contentView = _scrollControler.view
    }
    
    var optionsController : Viewable? {
        didSet {
           _view.optionsView = optionsController?.view
        }
    }
}

private typealias ViewLifeCycleDependable_Implementation = MainController
extension ViewLifeCycleDependable_Implementation : ViewLifeCycleDependable {
    func viewDidAppear() {
        _scrollControler.viewDidAppear()
    }
    
    func viewDidDisappear() {
        _scrollControler.viewDidDisappear()
    }
}

private typealias Viewable_Implementation = MainController
extension Viewable_Implementation : Viewable {
    var view : UIView {
        return _view
    }
}



