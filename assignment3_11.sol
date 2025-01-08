pragma solidity ^0.8.0;

contract PrimeNumbers {
    // Function to return a list of prime numbers less than or equal to n
    function getPrimes(uint256 n) public pure returns (uint256[] memory) {
        uint256[] memory primes = new uint256[](n);
        uint256 count = 0;

        for (uint256 i = 2; i <= n; i++) {
            if (isPrime(i)) {
                primes[count] = i;
                count++;
            }
        }
        
        uint256[] memory result = new uint256[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = primes[i];
        }
        return result;
    }

    // Helper function to check if a number is prime
    function isPrime(uint256 number) internal pure returns (bool) {
        if (number <= 1) {
            return false;
        }
        for (uint256 i = 2; i <= number / 2; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }
}
