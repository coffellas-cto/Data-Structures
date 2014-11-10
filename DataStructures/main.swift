//
//  main.swift
//  DataStructures
//
//  Created by Alex G on 07.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

func testLinkedList() {
    let list = LinkedList<Int>()
    
    list.addItem(0)
    list.addItem(1)
    list.addItem(2)
    list.addItem(3)
    list.addItem(1)
    list.addItem(4)
    list.addItem(1)
    
    list.traverse()
    
    list.removeItem(1)
    list.traverse()
    list.removeItem(3)
    list.traverse()
    list.removeItem(1)
    list.traverse()
    list.removeItem(4)
    list.traverse()
    list.removeItem(4)
    list.traverse()
    list.removeItem(4)
    list.traverse()
    list.removeItem(2)
    list.traverse()
    list.removeItem(0)
    list.traverse()
    list.removeItem(1)
    list.traverse()
    list.removeItem(1)
    list.traverse()
    list.addItem(32532)
    list.traverse()
    list.removeItem(1)
    list.traverse()
}

func testQueue() {
    let queue = Queue<Int>()
    
    queue.enqueue(1)
    queue.traverse()
    queue.enqueue(2)
    queue.enqueue(3)
    queue.traverse()
    queue.enqueue(4)
    queue.enqueue(5)
    queue.enqueue(6)
    queue.traverse()
    queue.dequeue()
    println(queue.dequeue())
    queue.enqueue(7)
    queue.traverse()
    for i in 0...10 {
        queue.dequeue()
    }
    
    queue.traverse()
    println(queue.dequeue())
}

func testStack() {
    let stack = Stack<Int>()
    stack.traverse()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.traverse()
    println(stack.peek())
    println(stack.pop())
    stack.pop()
    stack.traverse()
    stack.push(124)
    stack.traverse()
    stack.pop()
    println(stack.pop())
    stack.pop()
    stack.traverse()
    stack.pop() // Popping an empty stack should raise an exception
}

func testHashTable() {
    let hashTable = HashTable()
    for i in 0...100 {
        hashTable.addObject(i, forKey: "\(arc4random_uniform(10000))")
    }
    println(hashTable)
}

func main() {
    testHashTable()
}

main()

