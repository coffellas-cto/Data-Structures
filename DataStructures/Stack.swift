//
//  Stack.swift
//  DataStructures
//
//  Created by Alex G on 08.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

private class StackNode<T> {
    var item: T
    var next: StackNode<T>?
    
    init(_ item: T) {
        self.item = item
    }
    
    func printItem() {
        print(item)
    }
}

class Stack<T> {
    private var head: StackNode<T>?
    private var _size: UInt64 = 0
    var size: UInt64 {
        get {
            return _size
        }
    }
    
    func push(item: T) {
        let node = StackNode<T>(item)
        node.next = head
        head = node
        _size++
    }
    
    func pop() -> T? {
        if head == nil {
            NSException(name: NSInternalInconsistencyException, reason: "Tried to pop on an empty stack", userInfo: nil).raise()
            return nil
        }
        
        var retVal = head?.item
        let nextNode = head?.next
        head?.next = nil
        head = nextNode
        _size--
        
        return retVal
    }
    
    func peek() -> T? {
        if head == nil {
            NSException(name: NSInternalInconsistencyException, reason: "Tried to peek on an empty stack", userInfo: nil).raise()
            return nil
        }
        
        return head?.item
    }
    
    init() {
    }
    
    func traverse(mustPrint: Bool = true) {
        if mustPrint {
            println("Traversing:")
        }
        
        if head == nil {
            println("<Empty>")
            return
        }
        
        var node = head
        while node != nil {
            if mustPrint {
                node?.printItem()
                print(" ")
            }
            node = node?.next
        }
        
        if mustPrint {
            println()
        }
    }
    
}