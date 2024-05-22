let mintedNFTs = [];

// function to mint an NFT with metadata
function mintNFT(name, price, description) {
  // Create an object for NFT metadata
  const nft = {
    name: name,
    price: price,
    description: description,
  };

  // Add the minted NFT to the array
  mintedNFTs.push(nft);
  console.log(`NFT minted: ${name}`); 
}

// function to list all minted NFTs
function listNFTs() {
  if (mintedNFTs.length === 0) {
    console.log("No NFTs minted yet!");
    return;
  }

  console.log("Your minted NFTs:");
  for (const nft of mintedNFTs) {
    console.log("Name:", nft.name);
    console.log("Price:", nft.price);
    console.log("Description:", nft.description);
    console.log("----------");
  }
}

// function to get the total number of minted NFTs
function getTotalSupply() {
  return mintedNFTs.length;
}

// Mint some NFTs
mintNFT("Solana","$180.43", "high-performance blockchain platform ");
mintNFT("Shiba Inu", "$ 0.0000260","decentralized dog-themed cryptocurrency");
mintNFT("PEPE","$ 0.0000136","a community-based meme coin");
mintNFT("Bitcoin","$ 70,088.29","digital currency with a finite supply");

// Print the collection details
listNFTs();

// Print the total supply
const totalSupply = getTotalSupply();
console.log(`Total NFTs in collection: ${totalSupply}`);
