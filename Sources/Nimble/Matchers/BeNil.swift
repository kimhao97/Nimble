import Foundation

/// A Nimble matcher that succeeds when the actual value is nil.
public func beNil<T>() -> Predicate<T> {
    return Predicate { actualExpression, failureMessage in
        failureMessage.postfixMessage = "be nil"
        let actualValue = try actualExpression.evaluate()
        return actualValue == nil
    }
}

#if _runtime(_ObjC)
extension NMBObjCMatcher {
    public class func beNilMatcher() -> NMBObjCMatcher {
        return NMBObjCMatcher { actualExpression, failureMessage in
            return try! beNil().matches(actualExpression, failureMessage: failureMessage)
        }
    }
}
#endif
