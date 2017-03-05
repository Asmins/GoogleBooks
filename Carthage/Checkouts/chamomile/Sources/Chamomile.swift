//
//  ModuleNavigator.swift
//
//  Copyright (c) 2016 Alexander Tovstonozhenko
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Perform

public struct ModuleFactory<Destination: UIViewController> {

    public let storyboard: UIStoryboard
    public let identifier: String

    public init(storyboard: UIStoryboard, identifier: String) {
        self.storyboard = storyboard
        self.identifier = identifier
    }

    public func makeDestination() -> Destination {
        return self.storyboard.instantiateViewController(withIdentifier: self.identifier) as! Destination
    }

}

public protocol ModuleOutput: class {}

public protocol ModuleInput: class {
    var moduleOutput: ModuleOutput? { get set }
}

public protocol FlowController: class {
    var moduleInput: ModuleInput? { get set }
    func openModule<Destination>(
        using factory: ModuleFactory<Destination>,
        presenting: (_ source: UIViewController, _ destination: Destination) -> Void,
        completion: ((ModuleInput?) -> ModuleOutput?)?)
    func openModule<Destination>(
        using segue: Segue<Destination>,
        completion: ((ModuleInput?) -> ModuleOutput?)?) where Destination: FlowController
    func closeModule(animated: Bool)
}

public extension FlowController where Self: UIViewController {

    public var moduleInput: ModuleInput? {
        get { return objc_getAssociatedObject(self, &moduleInputKey) as? ModuleInput }
        set { objc_setAssociatedObject(self, &moduleInputKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    public func openModule<Destination>(
        using factory: ModuleFactory<Destination>,
        presenting: (_ source: UIViewController, _ destination: Destination) -> Void,
        completion: ((ModuleInput?) -> ModuleOutput?)?)
    {
        let destination = factory.makeDestination()
        presenting(self, destination)

        let flowController = destination as? FlowController
        assert(flowController != nil)
        flowController?.moduleInput?.moduleOutput = completion?(flowController?.moduleInput)
    }

    public func openModule<Destination>(
        using segue: Segue<Destination>,
        completion: ((ModuleInput?) -> ModuleOutput?)?) where Destination: FlowController
    {
        perform(segue) { destination in
            destination.moduleInput?.moduleOutput = completion?(destination.moduleInput)
        }
    }

    public func closeModule(animated: Bool) {
        if let _ = navigationController {
            _ = navigationController?.popViewController(animated: animated)
        } else if let _ = presentingViewController {
            dismiss(animated: animated, completion: nil)
        } else if let _ = view.superview {
            removeFromParentViewController()
            view.removeFromSuperview()
        } else {
            print("Chamomile: I don't know how to close this module.")
        }
    }

}

private var moduleInputKey = 0
