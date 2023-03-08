//
//  TextFieldKitExampleTests.swift
//  TextFieldKitExampleTests
//
//  Created by SalahMohamed on 27/02/2023.
//

import XCTest
import TextFieldKit
import TextFieldKitExample
import AppTexts
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
            return self.forthViewController.userFields
        }
        self.forthViewController.fieldsManager.fieldsHandler = {
        return self.forthViewController.allFields;
        }
        forthViewController.txtFullName.text=""
        forthViewController.txtPasswordField.text=""
        forthViewController.txtNewPassword.text=""
        forthViewController.txtConfirmPassword.text=""
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        let forum1 = forthViewController.fieldsManager.checkAll()
        XCTAssertEqual(forum1.valid, false)
        forum1Text(forum1,self.testLangauge)
        forthViewController.txtFullName.text="salah"
        forthViewController.txtPasswordField.text="123456"
        forthViewController.txtNewPassword.text="123456"
        forthViewController.txtConfirmPassword.text="123456"
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        let forum2 = forthViewController.fieldsManager.checkAll()
        XCTAssertEqual(forum2.valid, true)
        forthViewController.txtFullName.text="salah"
        forthViewController.txtPasswordField.text="123456"
        forthViewController.txtNewPassword.text="123456"
        forthViewController.txtConfirmPassword.text="12345"
        forthViewController.txtConfirmPassword.txtNewPasswordField = forthViewController.txtNewPassword
        let forum3 = forthViewController.fieldsManager.checkAll()
        XCTAssertEqual(forum3.valid, false)
        forum3Text(forum3,self.testLangauge)
    }
    func forum1Text(_ errors:[FieldError]){
    let field0 = Validate.required(forthViewController.txtFullName.title)
    let field1 = Validate.required(forthViewController.txtPasswordField.title)
    let field2 = Validate.required(forthViewController.txtNewPassword.title)
    let field3 = Validate.required(forthViewController.txtConfirmPassword.title)
    XCTAssertEqual(valueCheck(errors[0].message,field0),true)
    XCTAssertEqual(valueCheck(errors[1].message,field1),true)
    XCTAssertEqual(valueCheck(errors[2].message,field2),true)
    XCTAssertEqual(valueCheck(errors[3].message,field3),true)
    }
    func forum3Text(_ errors:[FieldError]){
    let field0 = AppTexts.Constant.passwordNotMatch.string(language)
    XCTAssertEqual(valueCheck(errors[0].message,field0),true)
    }
    func valueCheck(_ value:String?,_ compared:String?)->Bool{
        if value == "-" || value == nil{
            XCTAssertEqual(false,true,"language key error")
            return false
        }
        if compared == "-" || compared == nil{
            XCTAssertEqual(false,true,"language key error")
            return false
        }
        return (value == compared)
    }
}



