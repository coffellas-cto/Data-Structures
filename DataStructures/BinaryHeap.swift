//
//  BinaryHeap.swift
//  DataStructures
//
//  Created by Alex G on 13.12.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

class BinaryHeap<T: Comparable>: DebugPrintable {
    private var array: Array<T?>
    private var used: Int = 0
    private var comparison: (T, T) -> Bool
    
    // MARK: Private Methods
    private func swap(#index1: Int, index2: Int) {
        var tmp = array[index1]
        array[index1] = array[index2]
        array[index2] = tmp
    }
    
    private func parentIndex(index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func righChildIndex(index: Int) -> Int {
        return index * 2 + 2
    }
    
    private func grow() {
        array += [T?](count: array.count, repeatedValue: nil)
    }
    
    private func shrink() {
        array = Array<T?>(array[0...array.count/2])
    }
    
    private func heapifyToTop(index: Int, comparison: (T, T) -> Bool) {
        let parentIndex = self.parentIndex(index)
        
        if comparison(self.array[index]!, self.array[parentIndex]!) {
            self.swap(index1: index, index2: parentIndex)
            
            if parentIndex != 0 {
                self.heapifyToTop(parentIndex, comparison)
            }
        }
    }
    
    private func heapifyToBottom(index: Int, comparison: (T, T) -> Bool) {
        let leftChildIndex = self.leftChildIndex(index)
        let rightChildIndex = self.righChildIndex(index)
        
        var selectedChildIndex: Int? = nil
        if (leftChildIndex > used) && (rightChildIndex <= used) {
            selectedChildIndex = rightChildIndex
        } else if (rightChildIndex > used) && (leftChildIndex <= used) {
            selectedChildIndex = leftChildIndex
        } else if (rightChildIndex <= used) && (leftChildIndex <= used) {
            if comparison(self.array[leftChildIndex]!, self.array[rightChildIndex]!) {
                selectedChildIndex = leftChildIndex
            } else {
                selectedChildIndex = rightChildIndex
            }
        }
        
        if let selectedChildIndex = selectedChildIndex {
            if comparison(self.array[selectedChildIndex]!, self.array[index]!) {
                self.swap(index1: selectedChildIndex, index2: index)
                self.heapifyToBottom(selectedChildIndex, comparison)
            }
        }
    }
    
    // Internal Methods
    
    internal func removeTop() -> T? {
        if used == 0 {
            return nil
        }
        
        var retVal = self.array[0]
        self.array[0] = self.array[used - 1]
        heapifyToBottom(0, comparison)
        
        if used <= self.array.count / 4 {
            self.shrink()
        }
        
        self.used--
        return retVal
    }
    
    internal func getTop() -> T? {
        return self.array[0]
    }
    
    // Public Methods:
    func addValue(value: T) {
        if used == self.array.count {
            self.grow()
        }
        
        self.array[used] = value
        heapifyToTop(used, comparison)
        self.used++
    }
    
    // MARK: Life Cycle
    
    init(size newSize: Int, comparison newComparison: (T, T) -> Bool) {
        array = [T?](count: newSize, repeatedValue: nil)
        comparison = newComparison
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

class MaxHeap<T: Comparable>: BinaryHeap<T> {
    func getMax() -> T? {
        return self.getTop()
    }
    
    func removeMax() -> T? {
        return self.removeTop()
    }
    
    init(size newSize: Int) {
        super.init(size: newSize, {$0 > $1})
    }
}

class MinHeap<T: Comparable>: BinaryHeap<T> {
    func getMin() -> T? {
        return self.getTop()
    }
    
    func removeMin() -> T? {
        return self.removeTop()
    }
    
    init(size newSize: Int) {
        super.init(size: newSize, {$0 <= $1})
    }
}