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
    var testLangauge:String{
     return "en"
    }
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
        forum1Text(forum1,self.testLangauge)
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
        forum3Text(forum3,self.testLangauge)
        XCTAssertEqual(forum3.valid, false)
    }

    func forum1Text(_ errors:[FieldError],_ language:String){
    let stringChecker = StringChecker.init(language)
    let field0 = Validate.required(forthViewController.vmFullName.title,language)
    let field1 = Validate.required(forthViewController.vmPasswordField.title,language)
    let field2 = Validate.required(forthViewController.vmNewPassword.title,language)
    let field3 = Validate.required(forthViewController.vmConfirmPassword.title,language)
    XCTAssertEqual(stringChecker.valueCheck(errors[0].message,field0),true)
    XCTAssertEqual(stringChecker.valueCheck(errors[1].message,field1),true)
    XCTAssertEqual(stringChecker.valueCheck(errors[2].message,field2),true)
    XCTAssertEqual(stringChecker.valueCheck(errors[3].message,field3),true)
    }
    func forum3Text(_ errors:[FieldError],_ language:String){
    let stringChecker = StringChecker.init(language)
    let field0 = AppTexts.Constant.passwordNotMatch.string(language)
    XCTAssertEqual(stringChecker.valueCheck(errors[0].message,field0),true)
    }
}

class StringChecker:NSObject{
    var language:String
    init(_ language:String) {
        self.language=language
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
