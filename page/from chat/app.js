// Connect to MetaMask
let web3;
let contract;
let adoptionContractAddress = "<Your_Deployed_Contract_Address>"; // Replace with the contract address from Remix

// ABI from Remix (after compiling the contract)
const adoptionAbi = [
    {
        "constant": false,
        "inputs": [{ "name": "petId", "type": "uint256" }],
        "name": "adopt",
        "outputs": [{ "name": "", "type": "uint256" }],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "getAdopters",
        "outputs": [{ "name": "", "type": "address[16]" }],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }
];

// Initialize Web3 and Contract
window.addEventListener('load', async () => {
    if (window.ethereum) {
        web3 = new Web3(window.ethereum);
        try {
            // Request account access if needed
            await window.ethereum.request({ method: 'eth_requestAccounts' });
            const accounts = await web3.eth.getAccounts();
            console.log("Connected to MetaMask. Account:", accounts[0]);
        } catch (error) {
            console.error("User denied account access:", error);
        }
    } else {
        console.warn("MetaMask not found. Please install MetaMask.");
    }

    // Initialize contract
    contract = new web3.eth.Contract(adoptionAbi, adoptionContractAddress);
});

// Function to adopt a pet
async function adoptPet(petId) {
    const accounts = await web3.eth.getAccounts();
    try {
        await contract.methods.adopt(petId).send({ from: accounts[0] });
        alert("Successfully adopted the pet!");
    } catch (error) {
        console.error("Error adopting pet:", error);
        alert("Error adopting pet.");
    }
}
