//
//  LinkedList.swift
//  DataStructures
//
//  Created by Alex G on 07.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

private class ListNode<T: Equatable> {
    var item: T!
    var next: ListNode<T>?
    
    init(_ item: T) {
        self.item = item
    }
    
    func printItem() {
        print(item)
    }
}

class LinkedList<T: Equatable> {
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    private var _size: UInt64 = 0
    var size: UInt64 {
        get {
            return _size
        }
    }
    
    init() {
    }
    
    func addItem(item: T) {
        let node = ListNode<T>(item)
        
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        
        _size++
    }
    
    func removeItem(item: T) -> Bool {
        if head == nil {
            return false
        }
        
        if head?.item == item {
            let exHead = head
            if head === tail {
                tail = head?.next
            }
            head = head?.next
            
            exHead?.next = nil
            return true
        }
        
        var node = head?.next
        var prevNode = head
        while node != nil {
            if node?.item == item {
                prevNode?.next = node?.next
                node?.next = nil
                _size--
                return true
            }
            
            prevNode = node
            node = node?.next
        }
        
        return false
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
