//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Alex G on 26.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

private class BinaryTreeNode<T: Comparable>: DebugPrintable {
    var item: T
    init(item: T) {
        self.item = item
    }
    
    var parent: BinaryTreeNode<T>?
    var left: BinaryTreeNode<T>?
    var right: BinaryTreeNode<T>?
    
    func visit() -> String {
        return "[\(item)]"
    }
    
    var debugDescription: String {
        var retVal = "{\nitem:\(self.item)\nleft:\(self.left)\nright:\(self.right)\n}"
        return retVal
    }
}

class BinarySearchTree<T: Comparable>: DebugPrintable {
    private var root: BinaryTreeNode<T>?
    
    private func find(value: T, node:BinaryTreeNode<T>!) -> BinaryTreeNode<T>? {
        if node == nil {
            return nil
        }
        
        if node.item == value {
            return node
        } else if value > node.item {
            return find(value, node: node.right)
        }
        
        return find(value, node: node.left)
    }
    
    func find(value: T) -> T? {
        return find(value, node: self.root)?.item
    }
    
    func findSmallestGreaterThan(value: T) -> T? {
        var node: BinaryTreeNode<T>! = self.root
        var lastBigger: T? = nil
        while node != nil {
            if node.item > value {
                lastBigger = node.item
                node = node.left
            } else {
                node = node.right
            }
        }
        return lastBigger
    }
    
    func findLargestLessThan(value: T) -> T? {
        var node: BinaryTreeNode<T>! = self.root
        var lastSmaller: T? = nil
        while node != nil {
            if node.item >= value {
                node = node.left
            } else {
                lastSmaller = node.item
                node = node.right
            }
        }
        return lastSmaller
    }

    private func getMax(var node:BinaryTreeNode<T>!) -> T? {
        if node == nil {
            return nil
        }
        
        while node.right != nil {
            node = node.right
        }
        
        return node.item
    }
    
    func getMax() -> T? {
        return getMax(self.root)
    }
    
    private func getMin(var node:BinaryTreeNode<T>!) -> BinaryTreeNode<T>!? {
        if node == nil {
            return nil
        }
        
        while node.left != nil {
            node = node.left
        }
        
        return node
    }
    
    func getMin() -> T? {
        return getMin(self.root).item
    }
    
    private func removeNode(node: BinaryTreeNode<T>) {
        
        // TODO: Incomplete
        
        var hasLeft = node.left != nil
        var hasRight = node.right != nil
        if !hasLeft && !hasRight {
            if node.parent == nil {
                self.root = nil
            } else if node.parent?.left === node {
                node.parent?.left = nil
            } else {
                node.parent?.right = nil
            }
        }
        else if !hasLeft && hasRight {
            node.right?.parent = node.parent
            if node === self.root {
                self.root = node.right
            }
            
            if node.parent != nil {
                node.parent?.left = node.right
            }
            
            node.parent = nil
            node.right = nil
        }
        else if hasLeft && !hasRight {
            node.left?.parent = node.parent
            if node === self.root {
                self.root = node.left
            }
            
            if node.parent != nil {
                node.parent?.right = node.left
            }
            
            node.parent = nil
            node.left = nil
        }
        else {
            var minNode = self.getMin(node.right)
            node.item = minNode.item
            self.removeNode(minNode)
        }
    }
    
    func remove(value: T) -> T? {
        var foundNode: BinaryTreeNode<T>? = self.find(value, node: self.root)
        var retVal = foundNode?.item
        if foundNode != nil {
            self.removeNode(foundNode!)
        }
        
        return retVal
    }
    
    func insert(value: T) {
        var newNode = BinaryTreeNode<T>(item: value)
        var node: BinaryTreeNode<T>! = self.root
        if node == nil {
            self.root = newNode
            return
        }
        
        var parentNode: BinaryTreeNode<T>! = nil
        while node != nil {
            parentNode = node
            if value > node.item {
                node = node.right
            } else {
                node = node.left
            }
        }
        
        newNode.parent = parentNode
        if value > parentNode.item {
            parentNode.right = newNode
        } else {
            parentNode.left = newNode
        }
    }
    
    private func inOrderTraversal(node: BinaryTreeNode<T>!) -> String {
        if node == nil {
            return ""
        }
        
        var retVal: String = ""
        retVal += self.inOrderTraversal(node.left)
        retVal += node.visit()
        retVal += self.inOrderTraversal(node.right)
        
        return retVal
    }
    
    private func postOrderTraversal(node: BinaryTreeNode<T>!) -> String {
        if node == nil {
            return ""
        }
        
        var retVal: String = ""
        retVal += self.postOrderTraversal(node.left)
        retVal += self.postOrderTraversal(node.right)
        retVal += node.visit()
        
        return retVal
    }
    
    private func preOrderTraversal(node: BinaryTreeNode<T>!) -> String {
        if node == nil {
            return ""
        }
        
        var retVal: String = ""
        retVal += node.visit()
        retVal += self.preOrderTraversal(node.left)
        retVal += self.preOrderTraversal(node.right)
        
        return retVal
    }
    
    var debugDescription: String {
        // Print in-order traversal
        var retVal = "[binary_search_tree]\n"
        retVal += inOrderTraversal(self.root)
        retVal += "\n[/binary_search_tree]"
        return retVal
    }
    
    init() {
    }
}