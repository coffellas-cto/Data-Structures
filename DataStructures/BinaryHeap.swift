//
//  BinaryHeap.swift
//  DataStructures
//
//  Created by Alex G on 15.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

// TODO: Not finished

import Foundation

class BinaryHeap<T: Comparable>: DebugPrintable {
    private var array: [T?]!
    private var used: Int = 0
    
    // MARK: Private Methods
    
    func grow() {
        array! += [T?](count: array.count, repeatedValue: nil)
    } // __CFBinaryHeapGrow
    
    // MARK: Public Methods
    
    func addValue(newValue: T) {
        println("Adding: \(newValue)")
        if (used == array.count) {
            grow()
        }
        
        used++
        
        var i = used - 1
        array[i] = newValue;
        
        while (i > 0) && (array[i / 2] > array[i]) {
            var tmp = array[i / 2]
            array[i / 2] = array[i]
            array[i] = tmp
            i /= 2
        }
        
    } // CFBinaryHeapAddValue
    
    func containsValue(value: T) -> Bool {
        return false
    } // CFBinaryHeapContainsValue
    
    func minimum() -> T? {
        return nil
    } // CFBinaryHeapGetMinimum
    
    func removeMinimum() {
    } // CFBinaryHeapRemoveMinimumValue
    
    func clear() {
    } // CFBinaryHeapRemoveAllValues
    
    init() {
        array = [T?](count: 1, repeatedValue: nil)
    }
    
    // MARK: DebugPrintable Protocol Methods
    var debugDescription: String {
        var retVal = "[binary_heap]"
        if used > 0 {
            retVal += "\n"
            var level = 1
            var j = level
            for i in 0..<used {
                if let object = array[i] {
                    retVal += "|\(object)|"
                }
                
                j--
                
                if j == 0 {
                    retVal += "\n"
                    level *= 2
                    j = level
                }
            }
            
            retVal += "\n"
        }
        retVal += "[/binary_heap]"
        return retVal
    }
}