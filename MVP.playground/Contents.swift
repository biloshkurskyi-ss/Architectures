//: Playground - noun: a place where people can play

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
        let greating = "Hello" + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greating)
    }
}

class GreetingViewController: UIViewController, GreetingView {
    var presenter: GreetingPresenter!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
    }
    
    func didTapBtn(sender: UIButton) {
        self.presenter.showGreating()
    }
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

let model = Person(firstName: "David", lastName: "Blaine")
let view = GreetingViewController()
let presenter = GreetingPresenter(view: view, person: model)
view.presenter = presenter
