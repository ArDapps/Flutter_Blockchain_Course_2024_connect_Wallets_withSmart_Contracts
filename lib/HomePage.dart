import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:web3modal_flutter/web3modal_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();



}

class _HomePageState extends State<HomePage> {

  //WAY OF INTRCTION OF ANY SMART CONTRACT
  var CONTRACT_ABI = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "spender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "approve",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "spender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "allowance",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "needed",
          "type": "uint256"
        }
      ],
      "name": "ERC20InsufficientAllowance",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "sender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "balance",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "needed",
          "type": "uint256"
        }
      ],
      "name": "ERC20InsufficientBalance",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "approver",
          "type": "address"
        }
      ],
      "name": "ERC20InvalidApprover",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "receiver",
          "type": "address"
        }
      ],
      "name": "ERC20InvalidReceiver",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "sender",
          "type": "address"
        }
      ],
      "name": "ERC20InvalidSender",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "spender",
          "type": "address"
        }
      ],
      "name": "ERC20InvalidSpender",
      "type": "error"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "spender",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Approval",
      "type": "event"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transfer",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "spender",
          "type": "address"
        }
      ],
      "name": "allowance",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "account",
          "type": "address"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "decimals",
      "outputs": [
        {
          "internalType": "uint8",
          "name": "",
          "type": "uint8"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "name",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "symbol",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "totalSupply",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ];
  var CONTRACT_ADDRESS = "0xe8364881dfffd9f854560d287e6f54441db7f572";
////
  late W3MService _w3mService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _intialzeWeb3Model();
  }

  //Intialize web3model object

  void _intialzeWeb3Model ()async {
    W3MChainPresets.chains.putIfAbsent("11155111", () => _sepoliaChain);
    _w3mService = W3MService(
      projectId: '6f427ccb9e72b1453b0e3c76b70a8741',
      metadata: const PairingMetadata(
        name: 'Arabic Dapp Token',
        description: 'send erc20 or peb20 to friends',
        url: 'https://www.walletconnect.com/',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'flutter_blockchain_2024://', // your own custom scheme
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService.init();
  }

  void sigMessage() async{
    await _w3mService.launchConnectedWallet();


    var hash = await _w3mService.web3App!.request(
      topic: _w3mService.session?.topic??"default_topic",
      chainId: 'eip155:$_chainId',
      request: const SessionRequestParams(
        method: 'personal_sign',
        params: ['welceom bahaa taha', '0x03Ef951976bd892330F10376fc4A2676a5D79A1a'],
      ),
    );

    debugPrint(hash);
  }

  String? getUserWalletAddress(){
    if(_w3mService.isConnected&&_w3mService.session !=null){

      print("MY LOGIN WALLET IS : ${_w3mService.session?.address}");

      return _w3mService.session?.address;
    }

    return null;
  }

  //Read Data From Smart Contract

  Future<void> erc20BalanceOF() async {
    // Create DeployedContract object using contract's ABI and address
    final deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonEncode(CONTRACT_ABI), // ABI object
        'TokenName',
      ),
      EthereumAddress.fromHex(CONTRACT_ADDRESS),
    );

    // Get balance of wallet
    return await _w3mService.requestReadContract(
      deployedContract: deployedContract,
      functionName: 'balanceOf',
      rpcUrl: 'https://rpc.sepolia.org/',
      parameters: [
        EthereumAddress.fromHex('0x03Ef951976bd892330F10376fc4A2676a5D79A1a'),
      ],
    );

    // Get token total supply
    return await _w3mService.requestReadContract(
      deployedContract: deployedContract,
      functionName: 'totalSupply',
      rpcUrl: 'https://{rpc-url}.com',
    );
  }

  Future<void> erc20Symbol() async {
    // Create DeployedContract object using contract's ABI and address
    final deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonEncode(CONTRACT_ABI), // ABI object
        'TokenName',
      ),
      EthereumAddress.fromHex(CONTRACT_ADDRESS),
    );



    // Get token total supply
    return await _w3mService.requestReadContract(
      deployedContract: deployedContract,
      functionName: 'symbol',
      rpcUrl: 'https://rpc.sepolia.org/',
    );
  }


  Future<void> erc20TotalSupply() async {
    // Create DeployedContract object using contract's ABI and address
    final deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonEncode(CONTRACT_ABI), // ABI object
        'TokenName',
      ),
      EthereumAddress.fromHex(CONTRACT_ADDRESS),
    );



    // Get token total supply
    return await _w3mService.requestReadContract(
      deployedContract: deployedContract,
      functionName: 'totalSupply',
      rpcUrl: 'https://rpc.sepolia.org/',
    );
  }

  Future<void> transferToken() async {
    // Create DeployedContract object using contract's ABI and address
    final deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonEncode(CONTRACT_ABI), // ABI object
        'TokenName',
      ),
      EthereumAddress.fromHex(CONTRACT_ADDRESS),
    );

    // Transfer 0.01 amount of Token using Smart Contract's transfer function
    return await _w3mService.requestWriteContract(
      topic: _w3mService.session?.topic??"default_topic",
      chainId: 'eip155:$_chainId',
      rpcUrl: 'https://rpc.sepolia.org/',
      deployedContract: deployedContract,
      functionName: 'transfer',
      parameters: [
        EthereumAddress.fromHex("0x9135AFACE007e45b8875B50E6bE9ec0EE501C073"),
        BigInt.from(1000),

        
      ],
      transaction: Transaction(
          from: EthereumAddress.fromHex('0x03Ef951976bd892330F10376fc4A2676a5D79A1a'),

    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SafeArea(
       child: Padding(
         padding: EdgeInsets.all(18.0),
         child: Column(
           children: [
             Text("Welcome to Decntralozed App",style: TextStyle(fontSize: 25),),
             W3MConnectWalletButton(service: _w3mService),

             Text("ٍRead Smart Contract Data",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),

             ElevatedButton(onPressed: getUserWalletAddress, child: Text("My Login address")),

             ElevatedButton(onPressed: erc20BalanceOF, child: Text("MY Token Balance")),
             ElevatedButton(onPressed: erc20Symbol, child: Text(" Token Symbol")),
             ElevatedButton(onPressed: erc20TotalSupply, child: Text(" Total Supply of token")),


             W3MNetworkSelectButton(service: _w3mService),

             W3MAccountButton(service: _w3mService),

             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Text("Write Smart Contract Data",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
             ),

             ElevatedButton(onPressed: sigMessage, child: Text("Sign Message")),

             ElevatedButton(onPressed: transferToken, child: Text(" Send 10 AR Dapp Token",style: TextStyle(color: Colors.red),)),

           ],
         ),
       ),
     ),
    );
  }
}


const _chainId = "11155111";

final _sepoliaChain = W3MChainInfo(
  chainName: 'Sepolia',
  namespace: 'eip155:$_chainId',
  chainId: _chainId,
  tokenName: 'Sepolia ETH',
  rpcUrl: 'https://rpc.sepolia.org/',
  blockExplorer: W3MBlockExplorer(
    name: 'Sepolia Explorer',
    url: 'https://sepolia.etherscan.io/',
  ),
);