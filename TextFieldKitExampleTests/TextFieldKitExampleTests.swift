//
//  TextFieldKitExampleTests.swift
//  TextFieldKitExampleTests
//
//  Created by SalahMohamed on 27/02/2023.
//

import XCTest
import TextFieldKit
import TextFieldKitExample
final class TextFieldKitExampleTests: XCTestCase {
    var forthViewController = ForthViewController.copy
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
        ForthViewControllerUserFourm();
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func ForthViewControllerUserFourm(){
        self.forthViewController.fieldsManager.requiredFieldsHandler = {
            return self.forthViewController.userFields.compactMap({$0})
        }
        self.forthViewController.fieldsManager.fieldsHandler = {
            return self.forthViewController.allFields.compactMap({$0})
        }
        forthViewController.txtFullName.text=""
        forthViewController.txtPasswordField.text=""
        forthViewController.txtNewPassword.text=""
        forthViewController.txtConfirmPassword.text=""
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        XCTAssertEqual(forthViewController.fieldsManager.checkAll().valid, false)
        forthViewController.txtFullName.text="salah"
        forthViewController.txtPasswordField.text="123456"
        forthViewController.txtNewPassword.text="123456"
        forthViewController.txtConfirmPassword.text="123456"
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        XCTAssertEqual(forthViewController.fieldsManager.checkAll().valid, true)
        forthViewController.txtFullName.text="salah"
        forthViewController.txtPasswordField.text="123456"
        forthViewController.txtNewPassword.text="123456"
        forthViewController.txtConfirmPassword.text="12345"
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        XCTAssertEqual(forthViewController.fieldsManager.checkAll().valid, false)
    }
}
