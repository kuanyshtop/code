pragma solidity ^0.8.0;

contract AccessModifiers {
    uint8 public number;

    // Public access modifier
    function setNumberPublic(uint8 _number) public {
        number = _number;
        setNumberInternal(_number);
    }

    // Internal access modifier
    function setNumberInternal(uint8 _number) internal {
        number = _number;
        setNumberPrivate(_number);
    }

    // External access modifier
    function setNumberExternal(uint8 _number) external {
        number = _number;
        setNumberPrivate(_number);
    }

    // Private access modifier
    function setNumberPrivate(uint8 _number) private {
        number = _number;
    }

    // Function to get the number
    function getNumber() public view returns (uint8) {
        return number;
    }
}
