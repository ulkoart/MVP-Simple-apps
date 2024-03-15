//
//  MVP_simpleTests.swift
//  MVP-simpleTests
//
//  Created by user on 30.11.2021.
//

import XCTest
@testable import MVP_simple

class MVP_simpleTests: XCTestCase {
    var assemblyBuilder: AssemblyBuilderProtocol?
    var router: RouterProtocol?

    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        assemblyBuilder = AssemblyBuilder()
        
        guard let nonOptionalAssemblyBuilder = assemblyBuilder else { return }
        
        router = Router(navigationController: navigationController, assemblyBuilder: nonOptionalAssemblyBuilder)
    }

    override func tearDownWithError() throws {
        assemblyBuilder = nil
    }

    func testAssemblyBuilderNotNil() throws {
        XCTAssertNotNil(assemblyBuilder)
    }
    
    func testAssemblyBuilderCreateMainModule() throws {
        guard let router = router else { return }
        let mainModule = assemblyBuilder?.createMainModule(router: router)
        XCTAssertNotNil(mainModule)
        XCTAssertTrue(mainModule  is MainViewProtocol)
    }
}
