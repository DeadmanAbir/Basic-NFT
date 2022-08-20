const {network}=require("hardhat");

const {developmentChains}=require("../helper-hardhat-config");

const{verify}=require("../utils/verify");

module.exports=async({getNamedAccounts, deployments})=>{
    const{deploy, log}=deployments;
    const{deployer}=await getNamedAccounts();

    log("_______________________________________!")

    const basicNft=await deploy("basicNFT",{
        from: deployer,
        args: [],
        log: true,
        waitConfirmations: 1
    })

    if(!developmentChains.includes(network.name) && process.env.ETHERSCAN_API){
        log("Verifying_________________________");
        await verify(basicNft.address, []);
    }

    console.log(`Contract Address: ${basicNft.address}`);

    log("__________________________________________");
}

module.exports.tags = ["all", "basicnft", "main"]