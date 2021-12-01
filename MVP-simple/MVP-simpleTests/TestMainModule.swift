//
//  TestMainModule.swift
//  MVP-simpleTests
//
//  Created by user on 30.11.2021.
//

import XCTest

class MockView: MainViewProtocol {
    func succes() {
    }
    
    func failure(error: Error) {
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var characters: [Character]?
    
    init() {}
    
    convenience init(characters: [Character]) {
        self.init()
        self.characters = characters
    }
    
    
    func getCharacters(complition: @escaping (Result<[Character], Error>) -> Void) {
        guard let characters = characters  else {
            complition(.failure(NSError()))
            return
        }
        complition(.success(characters))
    }
}

class TestMainModule: XCTestCase {
    
    var view: MainViewProtocol?
    var presenter: MainPresenter?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var characters = [Character]()

    override func setUpWithError() throws {
        let character: Character = .init(id: 0, name: "Foo", gender: .female)
        characters.append(character)
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        view = MockView()
        networkService = MockNetworkService(characters: characters)
        
        
    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    } 

    func testMainModulePresenter() throws {
        guard let view = view else { return }
        guard let networkService = networkService else { return }
        guard let router = router else { return }
        
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchCharecters: [Character]?
        
        networkService.getCharacters { result in
            switch result {
            
            case .success(let data):
                catchCharecters = data
            case .failure(_):
                break
            }
        }
        
        XCTAssertEqual(catchCharecters?.count, characters.count)
    
    }
}
