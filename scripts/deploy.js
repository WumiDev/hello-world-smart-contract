async function main() {
    // const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const HelloWorldSmartContract = await ethers.getContractFactory("HelloWorldSmartContract");
 
    // Deploy HelloWorld Smart Contract, returning a promise that resolves to a contract object
    // const hello_world = await HelloWorld.deploy();   
    // console.log("Contract deployed to address:", hello_world.address);
    const hello_world = await HelloWorldSmartContract.deploy("Hello World! Blockgames is mind blowing!");   
    console.log("Contract deployed to address:", hello_world.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });