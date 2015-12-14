# getJSONObject
Quickly drill down through the Swift Dictionary returned by NSJSONSerialzer

Work in progress, not tested on Bool values.

Installation:
Just drag JSONUtils.swift into Xcode project

Use:

let sampleData: [String: AnyObject] = [
    "numbers": ["zero": "nix", "one": "eins", "two": "zwei"],
    "colours:": ["red": "rot", "blue": "blau"],
    "myArray":[
        ["primes": [2,3,5]],
        ["orders": [1,10,100]],
        ["letters":["a","b","c"]]
    ],
    "dicts":[
        "numbers": ["10": "zehn", "eleven": "elf", "twelve": "zwölf"],
        "colours:": ["red": "rot", "blue": "blau"],
        "myArray":[
            ["primes": [2,3,5], "orders": [1,10,100]],
            ["doubles" :[1.1,2.2,3.9]],
            ["lowerCase":["a","b","c"], "upperCase":["A","B","C"]]
        ]
    ]
]

// these fail and return nil

print(getJSONObject(["grr","dicts", "myArray", 1, "doubles", 2], data: sampleData))
print(getJSONObject(["dicts", "myArray", 99, "doubles", 2, "grr"], data: sampleData))
print(getJSONObject([1 ,"dicts", "myArray", 1, "doubles", 2], data: sampleData))

// these return an optional value

print(getJSONObject(["dicts", "myArray", 1, "doubles", 2], data: sampleData))
print(getJSONObject(["dicts", "numbers", "10"], data: sampleData))
print(getJSONObject(["dicts", "myArray", 0, "primes", 0, "grr"], data: sampleData) as? Int)
