//
//  TextFieldKitSwiftUIExampleTests.swift
//  TextFieldKitSwiftUIExampleTests
//
//  Created by SalahMohamed on 23/02/2023.
//

import XCTest
import TextFieldKitSwiftUIExample
import TextFieldKit
final class TextFieldKitSwiftUIExampleTests: XCTestCase {
    var secondContentViewModel:SecondContentViewModel=SecondContentViewModel()
    
    var fullName = FullName.init();
    var email = Email.init();
    var username = Username.init();

    var companyFields:[FieldValiadtionProrocol]{
        return [
            fullName,
            email]
    }
    var userFields:[FieldValiadtionProrocol]{
    return [fullName,
            username]
    }
    var allFields:[FieldValiadtionProrocol]{
        return [
            fullName,
            email,
            username
        ]
    }
    var fieldsManager:FieldsManager = FieldsManager();

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        testCompanyFourm();
        testUserFourm();
        swiftUIExampleFourm();

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testCompanyFourm(){
        fieldsManager.requiredFieldsHandler = {
            return self.companyFields
        }
        self.fieldsManager.fieldsHandler = {
            return self.allFields;
        }
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)
        self.email.text="asdas"
        self.fullName.text="salah"
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)
        self.email.text="salah@hotmail.com"
        self.fullName.text="salah"
        XCTAssertEqual(self.fieldsManager.checkAll().valid, true)
        self.fullName.text=""
        self.email.text="salah@hotmail.com"
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)
    }
    func testUserFourm(){
        fieldsManager.requiredFieldsHandler = {
            return self.userFields
        }
        self.fieldsManager.fieldsHandler = {
            return self.allFields;
        }
        self.username.text=""
        self.fullName.text=""
        self.email.text=""
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)
        self.username.text="salah"
        self.fullName.text=""
        self.email.text=""
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)
        self.username.text="salah"
        self.fullName.text="mohamd"
        self.email.text=""
        XCTAssertEqual(self.fieldsManager.checkAll().valid, true)
        self.username.text="salah"
        self.fullName.text="mohamd"
        self.email.text="mohamd"
        XCTAssertEqual(self.fieldsManager.checkAll().valid, false)

    }
    func swiftUIExampleFourm(){
        secondContentViewModel.userNameValidation.text=""
        secondContentViewModel.fullNameValidation.text=""
        secondContentViewModel.firstNameValidation.text=""
        secondContentViewModel.requirementsValidation.text=""
        secondContentViewModel.emailValidation.text=""
        XCTAssertEqual(secondContentViewModel.fieldsManager.checkAll().valid, false)
        secondContentViewModel.userNameValidation.text="salah"
        secondContentViewModel.fullNameValidation.text="mohamed"
        secondContentViewModel.firstNameValidation.text=""
        secondContentViewModel.requirementsValidation.text=""
        secondContentViewModel.emailValidation.text=""
        XCTAssertEqual(secondContentViewModel.fieldsManager.checkAll().valid, true)
        secondContentViewModel.userNameValidation.text="salah"
        secondContentViewModel.fullNameValidation.text="mohamed"
        secondContentViewModel.firstNameValidation.text=""
        secondContentViewModel.requirementsValidation.text=""
        secondContentViewModel.emailValidation.text="salah"
        XCTAssertEqual(secondContentViewModel.fieldsManager.checkAll().valid, false)

    }
}
