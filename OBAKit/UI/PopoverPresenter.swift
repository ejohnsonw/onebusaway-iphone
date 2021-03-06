//
//  PopoverPresenter.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 1/4/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import UIKit

@objc public class PopoverPresenter: NSObject {
    @objc public class func popoverMenu(with controller: UIViewController, preferredContentSize: CGSize, presentingBarButtonItem: UIBarButtonItem) -> UINavigationController {
        let nav = buildNavigationController(for: controller, preferredContentSize: preferredContentSize)
        configurePopover(for: nav, presentedFrom: presentingBarButtonItem)

        return (nav as UINavigationController)
    }

    @objc public class func popoverMenu(with controller: UIViewController, preferredContentSize: CGSize, presentingView: UIView) -> UINavigationController {
        let nav = buildNavigationController(for: controller, preferredContentSize: preferredContentSize)
        configurePopover(for: nav, presentedFrom: presentingView)

        return (nav as UINavigationController)
    }
}

// MARK: - Private Helpers
extension PopoverPresenter {
    private class func buildNavigationController(for viewController: UIViewController, preferredContentSize: CGSize) -> PopoverNavigationController {
        let nav = PopoverNavigationController.init(rootViewController: viewController)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = .popover
        nav.preferredContentSize = preferredContentSize

        return nav
    }

    private class func configurePopover(for navigationController: PopoverNavigationController, presentedFrom source: Any) {
        let popoverController = navigationController.popoverPresentationController!
        popoverController.permittedArrowDirections = .any
        popoverController.delegate = navigationController

        if source is UIView {
            popoverController.sourceView = (source as! UIView)
        }
        else {
            popoverController.barButtonItem = (source as! UIBarButtonItem)
        }
    }
}

// MARK: - Nav Controller
class PopoverNavigationController: UINavigationController, UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
