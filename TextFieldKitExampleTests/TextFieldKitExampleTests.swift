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
    var enStringChecker = StringChecker.init("en")
    var arStringChecker = StringChecker.init("ar")

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
        forthViewController.vmFullName.text=""
        forthViewController.vmPasswordField.text=""
        forthViewController.vmNewPassword.text=""
        forthViewController.vmConfirmPassword.text=""
        let forum1 = forthViewController.fieldsManager.checkAll();
        forum1TextEn(forum1)
        forum1TextAr(forum1)
        XCTAssertEqual(forum1.valid, false)
        forthViewController.vmFullName.text="salah"
        forthViewController.vmPasswordField.text="123456"
        forthViewController.vmNewPassword.text="123456"
        forthViewController.vmConfirmPassword.text="123456"
        let forum2 = forthViewController.fieldsManager.checkAll()
        XCTAssertEqual(forum2.valid, true)
        forthViewController.vmFullName.text="salah"
        forthViewController.vmPasswordField.text="123456"
        forthViewController.vmNewPassword.text="123456"
        forthViewController.vmConfirmPassword.text="12345"
        let forum3 = forthViewController.fieldsManager.checkAll()
        forum3TextEn(forum3)
        forum3TextAr(forum3)
        XCTAssertEqual(forum3.valid, false)
        forthViewController.vmFullName.text="salah"
        forthViewController.vmPasswordField.text="123456"
        forthViewController.vmNewPassword.text="123456"
        forthViewController.vmConfirmPassword.text="12345"
        let forum4 = forthViewController.fieldsManager.checkAll()
        forum1TextEn(forum4)
        forum1TextAr(forum4)
        XCTAssertEqual(forum4.valid, false)
        
    }

    func forum1TextEn(_ errors:[FieldError]){
        XCTAssertEqual(errors[0].message == Validate, true)

    }

    func forum1TextAr(_ errors:[FieldError]){
    }
    func forum3TextEn(_ errors:[FieldError]){
    }
    func forum3TextAr(_ errors:[FieldError]){
    }
    func forum4TextEn(_ errors:[FieldError]){
    }
    func forum4TextAr(_ errors:[FieldError]){
    }
}
//"- Sorry, The Fullname is required\n- Sorry, The New Password is required\n- Sorry, The Confirm Password is required\n- Sorry, The Password is required"

class StringChecker:NSObject{
    var language:String
    init(_ language:String) {
        self.language=language
    }
    func value(_ key:String)->String?{
        var tempValue = key.at_localized(language)
        if tempValue == "-" || tempValue == nil{
            XCTAssertEqual(false,true,"language key error")
            return nil
        }
        return tempValue
    }
}
