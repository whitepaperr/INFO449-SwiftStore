//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
        func price() -> Int
}

class Item : SKU {
    var name: String
        var priceEach: Int

        init(name: String, priceEach: Int) {
            self.name = name
            self.priceEach = priceEach
        }

        func price() -> Int {
            return priceEach
        }
}

class Receipt {
    private var items: [SKU] = []

    func add(item: SKU) {
        items.append(item)
    }

    func itemsList() -> [SKU] {
        return items
    }

    func output() -> String {
        var receiptText = "Receipt:\n"
        var total: Int = 0
        for item in items {
            let price = Double(item.price()) / 100.0
            receiptText += "\(item.name): $\(String(format: "%.2f", price))\n"
            total += item.price()
        }
        receiptText += "------------------\nTOTAL: $\(String(format: "%.2f", Double(total) / 100.0))"
        return receiptText
    }

    func total() -> Int {
        return items.reduce(0) { $0 + $1.price() }
    }
}


class Register {
    private var currentReceipt: Receipt

    init() {
        currentReceipt = Receipt()
    }

    func scan(_ item: SKU) {
        currentReceipt.add(item: item)
    }

    func subtotal() -> Int {
        return currentReceipt.itemsList().reduce(0) { $0 + $1.price() }
    }

    func total() -> Receipt {
        let finishedReceipt = currentReceipt
        currentReceipt = Receipt() // Reset for a new receipt
        return finishedReceipt
    }
}


class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

