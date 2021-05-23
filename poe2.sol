pragma solidity ^0.5.0;

contract ProofOfExistence2 {

  // state
  bytes32[] private proofs;

  // store a proof of existence in the contract state
  // *transactional function*
  function storeProof(bytes32 proof) public 
  {
      if (!toProof(proof)){
          
          proofs.push(proof);
      }
  }

  // calculate and store the proof for a document
  // *transactional function*
  function notarize(string calldata document) external 
  {
      bytes32 proof = proofFor(document);
      storeProof(proof);

  }

  // helper function to get a document's sha256
  // *read-only function*
  function proofFor(string memory document) pure public returns (bytes32) 
  {
      return sha256(abi.encodePacked(document));
    
  }

  // check if a document has been notarized
  // *read-only function*
  function checkDocument(string memory document) public view returns (bool) 
  {
      bytes32 proof = proofFor(document);
      return toProof(proof);
    
  }

  // returns true if proof is stored
  // *read-only function*
  function toProof(bytes32 proof) internal view returns (bool) {
   
    for(uint i=0; i<proofs.length; i++){
        
        if(proof == proofs[i]) return true;
    }
    return false;
  
  }  
   
  }

