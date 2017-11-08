// ABI comes from ./build/contracts/Greeter.json

var abi = [{  "constant": false,  "inputs": [],  "name": "kill",  "outputs": [],  "payable": false,  "type": "function"},{  "constant": true,  "inputs": [],  "name": "greet",  "outputs": [    {      "name": "",      "type": "string"    }  ],  "payable": false,  "type": "function"},{  "inputs": [    {      "name": "_greeting",      "type": "string"    }  ],  "payable": false,  "type": "constructor"}]

// You need to know your contract's address to do this!
var Greeter = eth.contract(abi).at('0x5e7dd1a61889d8b28f815c756bd77fc5b8c6bc3e')

console.log(greeter.greet())
