public struct GCD {
    
    // MARK: - Methods
    
    static func classicGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        if let simpleGCD = GCD.simpleCasesGCD(firstNumber, secondNumber) {
            return simpleGCD
        }
        
        var firstNumber = firstNumber
        var secondNumber = secondNumber
        while firstNumber != 0, secondNumber != 0 {
            if firstNumber > secondNumber {
                firstNumber = firstNumber % secondNumber
            } else {
                secondNumber = secondNumber % firstNumber
            }
        }
        
        return firstNumber + secondNumber // One of them is 0.
    }
    
    static func improvedClassicGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        if let simpleGCD = GCD.simpleCasesGCD(firstNumber, secondNumber) {
            return simpleGCD
        }
        
        var firstNumber = firstNumber
        var secondNumber = secondNumber
        while firstNumber != 0, secondNumber != 0 {
            if firstNumber > secondNumber {
                let firstNumberClaim = firstNumber % secondNumber
                if firstNumberClaim > secondNumber / 2 {
                    firstNumber = abs(firstNumberClaim - secondNumber)
                } else {
                    firstNumber = firstNumberClaim
                }
            } else {
                let secondNumberClaim = secondNumber % firstNumber
                if secondNumberClaim > firstNumber / 2 {
                    secondNumber = abs(secondNumberClaim - firstNumber)
                } else {
                    secondNumber = secondNumberClaim
                }
            }
        }
        
        return firstNumber + secondNumber // One of them is 0.
    }
    
    static func substractionGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        if let simpleGCD = GCD.simpleCasesGCD(firstNumber, secondNumber) {
            return simpleGCD
        }
        
        var firstNumber = firstNumber
        var secondNumber = secondNumber
        while firstNumber != 0, secondNumber != 0 {
            if firstNumber > secondNumber {
                firstNumber = firstNumber - secondNumber
            } else {
                secondNumber = secondNumber - firstNumber
            }
        }
        
        return firstNumber + secondNumber // One of them is 0.
    }
    
    static func binaryGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        if let simpleGCD = GCD.simpleCasesGCD(firstNumber, secondNumber) {
            return simpleGCD
        }
        
        var firstNumber = firstNumber
        var secondNumber = secondNumber
        
        var shift = 0
        while (firstNumber | secondNumber) & 1 == 0 {
            shift += 1
            firstNumber >>= 1
            secondNumber >>= 1
        }
        while firstNumber & 1 == 0 {
            firstNumber >>= 1
        }
        repeat {
            while secondNumber & 1 == 0 {
                secondNumber >>= 1
            }
            if firstNumber > secondNumber {
                swap(&firstNumber, &secondNumber)
            }
            secondNumber -= firstNumber
        } while secondNumber != 0
        
        return firstNumber << shift
    }
    
    // MARK: Private methods
    
    private static func simpleCasesGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int? {
        if firstNumber == secondNumber {
            return firstNumber // Any.
        }
        
        if firstNumber == 0 {
            return secondNumber
        }
        if secondNumber == 0 {
            return firstNumber
        }
        
        return nil
    }
    
}
