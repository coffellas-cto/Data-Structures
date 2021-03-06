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
    // Popping an empty stack should
    // raise an exception
    stack.pop()
}

func testHashTable() {
    let hashTable = HashTable()
    for i in 0...20 {
        hashTable.addObject(NSNumber(unsignedInt: arc4random_uniform(1000)), forKey: "\(i)")
    }
    println(hashTable)
    for i in 0...16 {
        print("Removing object for key: \(i) value: ")
        println(hashTable.removeObjectForKey("\(i)"))
    }
    println(hashTable)
    for i in 21...40 {
        hashTable.addObject(NSNumber(unsignedInt: arc4random_uniform(1000)), forKey: "\(i)")
    }
    println(hashTable)
    
    for i in 0...50 {
        let obj: AnyObject? = hashTable.objectForKey("\(i)")
        println("\(i): \(obj)")
    }
}

func testMaxHeap() {
    var heap = MaxHeap<Int>(size: 10)
    heap.addValue(0)
    heap.addValue(1)
    heap.addValue(2)
    heap.addValue(0)
    heap.addValue(1)
    heap.addValue(2)
    heap.addValue(3)
    heap.addValue(4)
    heap.addValue(5)
    println(heap)
    heap.removeMax()
    println(heap)
    heap.addValue(16)
    heap.addValue(3)
    heap.addValue(10)
    heap.removeMax()
    println(heap)
    heap.addValue(8)
    heap.addValue(9)
    heap.addValue(10)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
    println("removeMax: \(heap.removeMax())")
    println(heap)
}

func testMinHeap() {
    var heap = MinHeap<Int>(size: 10)
    heap.addValue(0)
    heap.addValue(1)
    heap.addValue(2)
    heap.addValue(0)
    heap.addValue(1)
    heap.addValue(2)
    heap.addValue(3)
    heap.addValue(4)
    heap.addValue(5)
    println(heap)
    heap.removeMin()
    println(heap)
    heap.addValue(16)
    heap.addValue(3)
    heap.addValue(10)
    heap.removeMin()
    println(heap)
    heap.addValue(8)
    heap.addValue(9)
    heap.addValue(10)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
    println("removeMin: \(heap.removeMin())")
    println(heap)
}

func testBinarySearchTree() {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(7)
    bst.insert(-10)
    bst.insert(2)
    bst.insert(3)
    bst.insert(100)
    bst.insert(5)
    bst.insert(0)
    bst.insert(1)
    println(bst)
    println(bst.find(2))
    println(bst.find(100))
    println(bst.find(3))
    println(bst.find(0))
    println(bst.find(4))
    println(bst.getMax())
    println(bst.getMin())
    println(bst.findSmallestGreaterThan(1))
    println(bst.findSmallestGreaterThan(0))
    println(bst.findSmallestGreaterThan(100))
    println(bst.findSmallestGreaterThan(99))
    println(bst.findSmallestGreaterThan(3))
    println(bst.findLargestLessThan(-20))
    println(bst.findLargestLessThan(-8))
    println(bst.findLargestLessThan(4))
    println(bst.findLargestLessThan(1000))
    println(bst.findLargestLessThan(0))
    
    
    println(bst)
    println("Removing 5")
    bst.remove(5)
    println(bst)
    println("Removing -10")
    bst.remove(-10)
    println(bst)
    println("Removing 3")
    bst.remove(3)
    println(bst)
    println("Removing 3")
    bst.remove(3)
    println(bst)
    println("Removing 2")
    bst.remove(2)
    println(bst)
    println("Removing 2 (assert no changes)")
    bst.remove(2)
    println(bst)
    println("Removing 0")
    bst.remove(0)
    println(bst)
    println("Removing 7")
    bst.remove(7)
    println(bst)
    println("Removing 100")
    bst.remove(100)
    println(bst)
    println("Removing 1")
    bst.remove(1)
    println(bst)
}

func main() {
    testHashTable()
}

main()

