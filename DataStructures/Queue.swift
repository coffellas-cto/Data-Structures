//
//  Queue.swift
//  DataStructures
//
//  Created by Alex G on 07.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

import Foundation

private class QueueItem<T> {
    var item: T!
    var next: QueueItem<T>?
    var prev: QueueItem<T>?
    
    init(_ item: T) {
        self.item = item
    }
    
    func printItem() {
        print(item)
    }
}

class Queue<T> {
    
    private var head: QueueItem<T>?
    private var tail: QueueItem<T>?
    private var _size: UInt64 = 0
    var size: UInt64 {
        get {
            return _size
        }
    }
    
    func enqueue(object: T) {
        _size++
        let newItem = QueueItem<T>(object)
        if head == nil {
            head = newItem
            tail = head
            return
        }
        
        newItem.next = head
        head?.prev = newItem
        head = newItem
    }
    
    func dequeue() -> T? {
        if tail == nil {
            return nil
        }
        
        let lastItem: QueueItem<T>! = tail
        tail = tail?.prev
        if tail == nil {
            head = nil
        } else {
            tail?.next = nil
        }
        
        lastItem.prev = nil
        _size--
        return lastItem.item
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
            println("Size: \(_size)")
        }
    }
    
    init() {
    }
}