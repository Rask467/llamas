// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {Counters} from "openzeppelin-contracts/utils/Counters.sol";

contract Llamas is Ownable, ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdTracker;

    string public _baseTokenURI =
        "ipfs://QmaDPNrXpPCBvTY3D8DEfrN1oPHWegDz5NEUsD1Kx782Mp/";

    constructor() ERC721("Llamas", "LLMA") {}

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseTokenURI(string memory uri) external onlyOwner {
        _baseTokenURI = uri;
    }

    function adminMint(address _to) external onlyOwner {
        _mint(_to, _tokenIdTracker.current());
        _tokenIdTracker.increment();
    }
}
