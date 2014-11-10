//
//  HashTable.swift
//  DataStructures
//
//  Created by Alex G on 08.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

// Change the value of this constant
// to change the way hash table resizes
let kHashTableAggressiveResize = true

private class HashTableNode {
    var key: String
    var value: AnyObject
    var next: HashTableNode?
    
    init(key: String, value: AnyObject) {
        self.key = key
        self.value = value
    }
}

private class HashTableBucket {
    var firstNode: HashTableNode? = nil
    func addNode(newNode: HashTableNode) -> Bool {
        if let foundNode = self.findNodeWithKey(newNode.key) {
            foundNode.value = newNode.value
            return false
        }
        
        newNode.next = firstNode
        firstNode = newNode
        
        return true
    }
    
    func findNodeWithKey(key: String) -> HashTableNode? {
        var retVal: HashTableNode? = nil
        var node = self.firstNode
        while node != nil {
            if node!.key == key {
                retVal = node
                break
            }
            node = node?.next
        }
        return retVal
    }
    
    init() {
    }
}

class HashTable: DebugPrintable {
    private var nodeCount: Int = 0 // Number of used nodes
    private var buckets: [HashTableBucket?] // Array of buckets
    
    var collisions = 0

    // MARK: Private Methods
    
    private func hash(key: String) -> Int {
        var retVal: Int = 0
        for codeUnit in key.utf8 {
            retVal *= 127
            retVal += Int(codeUnit)
            retVal %= 16908799
        }
        
        //print("HASH: \(retVal) ")
        return retVal
    }
    
    private func compress(hash: Int, bucketsCount: Int) -> Int {
        let retVal = (13 * hash + 21) % 997 % bucketsCount
        return retVal
    }
    
    private func bucketForKey(key: String, inout inBucketArray bucketArray: [HashTableBucket?], inout collided: Bool) -> HashTableBucket {
        let hashVal = hash(key)
        let index = compress(hashVal, bucketsCount: bucketArray.count)
        if let bucket = bucketArray[index] {
            if bucket.firstNode != nil {
                //println("Collision: to index \(index) from hash \(hashVal)")
                collided = true
            }
            return bucket
        }
        
        bucketArray[index] = HashTableBucket()
        return bucketArray[index]!
    }
    
    private func newBucketCount(#grow: Bool) -> Int {
        var retVal: Int = 0
        if kHashTableAggressiveResize {
            /**
            1. This method works faster and results in less collisions.
            But it eats more memory as number of buckets doubles
            each time a hash table is supposed to grow.
            **/
            if grow {
                retVal = buckets.count * 2
            }
        }
        else {
            /**
            2. When using this method, a hash table grows slower.
            This results in more collisions and weaker performance
            than that of method #1. But it takes less space and number of
            empty buckets decreases.
            **/
            if grow {
                // Use Fibonacci series to compute
                // next size for an array of buckets
                var curNumber = 1
                var prevNumber = 1
                while curNumber <= buckets.count {
                    let tmp = curNumber
                    curNumber += prevNumber
                    prevNumber = tmp
                }
                
                retVal = curNumber
            }
        }
        
        return retVal
    }
    
    private func resizeTable() {
        var newBucketCount = buckets.count
        
        // If number of nodes exceeds 3/4 of number of buckets,
        // increase number of buckets
        if buckets.count * 4 <= nodeCount * 3 {
            newBucketCount = self.newBucketCount(grow: true)
        }
        
        if newBucketCount != buckets.count {
            println("RESIZED FROM \(buckets.count) TO \(newBucketCount)")
            // Allocate an empty array of fixed size
            var newBuckets = [HashTableBucket?](count: newBucketCount, repeatedValue: nil)
            // Recalculate hashes and assign
            // the existing nodes to new buckets
            nodeCount = 0
            collisions = 0
            for bucket in buckets {
                var node = bucket?.firstNode
                while node != nil {
                    var collided = false
                    let bucket = bucketForKey(node!.key, inBucketArray: &newBuckets, collided: &collided)
                    if collided {
                        collisions++
                    }
                    let newNode = HashTableNode(key: node!.key, value: node!.value)
                    if bucket.addNode(newNode) {
                        nodeCount++
                    }
                    node = node?.next
                }
            }
            
            buckets = newBuckets
            //println(self)
        }
    }
    
    // MARK: Public Methods
    func addObject(object: AnyObject, forKey key: String) {
        let newNode = HashTableNode(key: key, value: object)
        var collided = false
        let bucket = bucketForKey(newNode.key, inBucketArray: &buckets, collided: &collided)
        if collided {
            collisions++
        }
        
        if bucket.addNode(newNode) {
            nodeCount++
        }
        
        self.resizeTable()
    }
    
    // MARK: Life Cycle
    init() {
        buckets = [HashTableBucket?](count: 1, repeatedValue: nil)
    }
    
    // MARK: DebugPrintable Protocol Methods
    var debugDescription: String {
        var retVal = "[hash_table]"
        if nodeCount > 0 {
            for bucket in buckets {
                retVal += "\n[bucket]"
                var node = bucket?.firstNode
                while node != nil {
                    retVal += "->(\"\(node!.key)\": \(node!.value))"
                    node = node?.next
                }
            }
            
            retVal += "\n"
            if collisions > 0 {
                retVal += "Collisions: \(collisions)\n"
            }
        }
        
        retVal += "[/hash_table]"
        return retVal
    }
    
    
    
    
    
    
}