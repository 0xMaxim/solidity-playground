pragma solidity ^0.4.13;

import "./DispatcherStorage.sol";

contract Dispatcher {

    function() {
        // Is there a better way of referring to the DispatcherStorage? Can't  access contract storage from
        // fallback function as this is referenced as a library so can't store it in the constructor.
        DispatcherStorage dispatcherStorage = DispatcherStorage(0x1111222233334444555566667777888899990000);
        uint32 functionReturnTypeSize = dispatcherStorage.returnTypeSizes(msg.sig);
        address libraryAddress = dispatcherStorage.libraryAddress();

        assembly {
            calldatacopy(0x0, 0x0, calldatasize)
            let a := delegatecall(sub(gas, 10000), libraryAddress, 0x0, calldatasize, 0, functionReturnTypeSize)
            return (0, functionReturnTypeSize)
        }
    }
}
