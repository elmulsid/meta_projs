import React, { useState, useEffect } from "react";
import { ethers } from "ethers";
import counter_abi from "../artifacts/contracts/Counter.sol/Counter.json";

function CounterApp() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [counter, setCounter] = useState(0);
  const [contract, setContract] = useState(undefined);
  const [incrementValue, setIncrementValue] = useState(1);
  const [decrementValue, setDecrementValue] = useState(1);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"; // Replace with your deployed contract address
  const counterABI = counter_abi.abi;

  const getWallet = async () => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const accounts = await ethWallet.request({ method: "eth_accounts" });
      handleAccount(accounts);
    }
  };

  const handleAccount = (account) => {
    if (account) {
      console.log("Account connected:", account);
      setAccount(account);
    } else {
      console.log("No account found");
    }
  };

  const connectAccount = async () => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }

    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);

    // Once wallet is set we can get a reference to our deployed contract
    getCounterContract();
  };

  const getCounterContract = async () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const contract = new ethers.Contract(contractAddress, counterABI, signer);

    setContract(contract);
  };

  const getCounter = async () => {

      if (contract) {
        const count = await contract.count();
        setCounter(count.toNumber());
      } 
   
  };

  const increment = async () => {
    if (contract) {
      const tx = await contract.increment(incrementValue);
      await tx.wait();
      getCounter();
    }
  };

  const decrement = async () => {
    if (contract) {
      const tx = await contract.decrement(decrementValue);
      await tx.wait();
      getCounter();
    }
  };

  const resetCounter = async () => {
    if (contract) {
      const tx = await contract.reset();
      await tx.wait();
      getCounter();
    }
  };

  useEffect(() => {
    getWallet();
  }, []);

  useEffect(() => {
    if (contract) {
      getCounter();
    }
  }, [contract]);

  return (
    <div>
      {!account ? (
        <button onClick={connectAccount}>Connect Wallet</button>
      ) : (
        <>
          <h1>Counter</h1>
          <p>Count: {counter}</p>
          <input type="number" value={incrementValue} onChange={(e) => setIncrementValue(Number(e.target.value))} />
          <input type="number" value={decrementValue} onChange={(e) => setDecrementValue(Number(e.target.value))} />
          <button onClick={increment}>Increment</button>
          <button onClick={decrement}>Decrement</button>
          <button onClick={resetCounter}>Reset</button>
        </>
      )}
    </div>
  );
}

export default CounterApp;
