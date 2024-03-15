//
//  MainPresenter.swift
//  MVP-simple
//
//  Created by user on 30.11.2021.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting() -> Void
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol?
    let person: Person?
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        guard
            let person = person,
            let view = view
        else { return }
        
        let greeting = person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
    
    
}
