//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Alex G on 26.11.14.
//  Copyright (c) 2014 Alexey Gordiyenko. All rights reserved.
//

import Foundation

private class BinaryTreeNode<T: Comparable> {
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
}

class BinarySearchTree<T: Comparable>: DebugPrintable {
    private var root: BinaryTreeNode<T>?
    
    private func find(value: T, node:BinaryTreeNode<T>!) -> T? {
        if node == nil {
            return nil
        }
        
        if node.item == value {
            return node.item
        } else if value > node.item {
            return find(value, node: node.right)
        }
        
        return find(value, node: node.left)
    }
    
    func find(value: T) -> T? {
        return find(value, node: self.root)
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
        retVal += postOrderTraversal(self.root)
        retVal += "\n[/binary_search_tree]"
        return retVal
    }
    
    init() {
    }
}