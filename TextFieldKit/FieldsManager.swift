//
//  FieldsManager.swift
//  TextFieldKit
//
//  Created by SalahMohamed on 23/02/2023.
//

import UIKit

public typealias Fourm = FieldsManager;
public class FieldsManager{
    public typealias FieldsHandler=()->[FieldValiadtionProrocol]
    public typealias RequiredFieldsHandler=()->[FieldValiadtionProrocol]
    public var fieldsHandler:FieldsHandler?{
        didSet{
            for var field  in self.allFields{
                (field as? FieldDataProrocol)?.fieldDidEnd = { internalFeild in
                    self.check(field: field)
                }
                (field as? FieldDataProrocol)?.fieldDidEnd = { internalFeild in
                    self.check(field: field)
                }
                (field as? FieldDataProrocol)?.onEditingChanged = { changed,internalFeild in
                    self.check(field:field)
                }
            }
        }
    }
    public var requiredFieldsHandler:RequiredFieldsHandler?
    
    var allFields:[FieldValiadtionProrocol]{
        return self.fieldsHandler?() ?? []
    }
    var requiredFields:[FieldValiadtionProrocol]{
        return self.requiredFieldsHandler?() ?? []
    }
    init(fieldsHandler:FieldsHandler?,requiredFieldsHandler:@escaping RequiredFieldsHandler) {
        self.fieldsHandler = fieldsHandler
        self.requiredFieldsHandler = requiredFieldsHandler
    }
    public init(){
        
    }
     public func checkAll()->[FieldError]{
        var messages:[FieldError] = [FieldError]();
        for field in allFields{
        messages.append(contentsOf:self.check(field:field));
        }
    return messages
    }
    @discardableResult public func check(field:FieldValiadtionProrocol)->[FieldError]{
        let contains = requiredFields.contains(where: {return $0 == field})
        var messages = field.messages
        let isNotRequired = messages.filter({$0.isRequired == false}) // validation error
        if isNotRequired.count > 0{
            messages = isNotRequired
        }
        var newMessages:[FieldError]=[FieldError]()
        newMessages = (messages.valid == true || (contains == false && isNotRequired.count == 0)) ? []:messages
        field.error = newMessages.count > 0 ? newMessages.string:nil
        return newMessages
    }
    public func clearErrors(){
        self.allFields.clearErrors()
    }
}

