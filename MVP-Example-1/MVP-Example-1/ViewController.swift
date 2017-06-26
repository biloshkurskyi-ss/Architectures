//
//  ViewController.swift
//  MVP-Example-1
//
//  Created by Sergey Biloshkurskyi on 6/26/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

struct Person {
    let firstName: String
    let lastName: String
}

protocol GreetingView: class {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreating()
}

class GreetingPresenter: GreetingViewPresenter {
    unowned let view: GreetingView
    let person: Person
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreating() {
        let greating = "Hello " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greating)
    }
}

class GreetingViewController: UIViewController, GreetingView {
    var presenter: GreetingPresenter!
    
    @IBOutlet var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapBtn(sender: UIButton) {
        self.presenter.showGreating()
    }
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
