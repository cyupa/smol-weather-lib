import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(owm_sdkTests.allTests),
    ]
}
#endif
