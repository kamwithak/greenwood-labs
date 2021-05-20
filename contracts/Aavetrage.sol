// // SPDX-License-Identifier: MIT
// pragma solidity 0.6.12;
// pragma experimental ABIEncoderV2;

// import {ILendingPool} from "@aave/protocol-v2/contracts/interfaces/ILendingPool.sol";
// import {ILendingPoolAddressesProvider} from "@aave/protocol-v2/contracts/interfaces/ILendingPoolAddressesProvider.sol";
// import {DataTypes} from "@aave/protocol-v2/contracts/protocol/libraries/types/DataTypes.sol";

// /**
//  * @dev Interface of the ERC20 standard as defined in the EIP.
//  */
// interface IERC20 {
//     /**
//      * @dev Returns the amount of tokens in existence.
//      */
//     function totalSupply() external view returns (uint256);

//     /**
//      * @dev Returns the amount of tokens owned by `account`.
//      */
//     function balanceOf(address account) external view returns (uint256);

//     /**
//      * @dev Moves `amount` tokens from the caller's account to `recipient`.
//      *
//      * Returns a boolean value indicating whether the operation succeeded.
//      *
//      * Emits a {Transfer} event.
//      */
//     function transfer(address recipient, uint256 amount) external returns (bool);

//     /**
//      * @dev Returns the remaining number of tokens that `spender` will be
//      * allowed to spend on behalf of `owner` through {transferFrom}. This is
//      * zero by default.
//      *
//      * This value changes when {approve} or {transferFrom} are called.
//      */
//     function allowance(address owner, address spender) external view returns (uint256);

//     /**
//      * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
//      *
//      * Returns a boolean value indicating whether the operation succeeded.
//      *
//      * IMPORTANT: Beware that changing an allowance with this method brings the risk
//      * that someone may use both the old and the new allowance by unfortunate
//      * transaction ordering. One possible solution to mitigate this race
//      * condition is to first reduce the spender's allowance to 0 and set the
//      * desired value afterwards:
//      * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
//      *
//      * Emits an {Approval} event.
//      */
//     function approve(address spender, uint256 amount) external returns (bool);

//     /**
//      * @dev Moves `amount` tokens from `sender` to `recipient` using the
//      * allowance mechanism. `amount` is then deducted from the caller's
//      * allowance.
//      *
//      * Returns a boolean value indicating whether the operation succeeded.
//      *
//      * Emits a {Transfer} event.
//      */
//     function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

//     /**
//      * @dev Emitted when `value` tokens are moved from one account (`from`) to
//      * another (`to`).
//      *
//      * Note that `value` may be zero.
//      */
//     event Transfer(address indexed from, address indexed to, uint256 value);

//     /**
//      * @dev Emitted when the allowance of a `spender` for an `owner` is set by
//      * a call to {approve}. `value` is the new allowance.
//      */
//     event Approval(address indexed owner, address indexed spender, uint256 value);
// }

// // library SafeMath {
// //     /**
// //      * @dev Returns the addition of two unsigned integers, reverting on
// //      * overflow.
// //      *
// //      * Counterpart to Solidity's `+` operator.
// //      *
// //      * Requirements:
// //      *
// //      * - Addition cannot overflow.
// //      */
// //     function add(uint256 a, uint256 b) internal pure returns (uint256) {
// //         uint256 c = a + b;
// //         require(c >= a, "SafeMath: addition overflow");

// //         return c;
// //     }

// //     /**
// //      * @dev Returns the subtraction of two unsigned integers, reverting on
// //      * overflow (when the result is negative).
// //      *
// //      * Counterpart to Solidity's `-` operator.
// //      *
// //      * Requirements:
// //      *
// //      * - Subtraction cannot overflow.
// //      */
// //     function sub(uint256 a, uint256 b) internal pure returns (uint256) {
// //         return sub(a, b, "SafeMath: subtraction overflow");
// //     }

// //     /**
// //      * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
// //      * overflow (when the result is negative).
// //      *
// //      * Counterpart to Solidity's `-` operator.
// //      *
// //      * Requirements:
// //      *
// //      * - Subtraction cannot overflow.
// //      */
// //     function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
// //         require(b <= a, errorMessage);
// //         uint256 c = a - b;

// //         return c;
// //     }

// //     /**
// //      * @dev Returns the multiplication of two unsigned integers, reverting on
// //      * overflow.
// //      *
// //      * Counterpart to Solidity's `*` operator.
// //      *
// //      * Requirements:
// //      *
// //      * - Multiplication cannot overflow.
// //      */
// //     function mul(uint256 a, uint256 b) internal pure returns (uint256) {
// //         // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
// //         // benefit is lost if 'b' is also tested.
// //         // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
// //         if (a == 0) {
// //             return 0;
// //         }

// //         uint256 c = a * b;
// //         require(c / a == b, "SafeMath: multiplication overflow");

// //         return c;
// //     }

// //     /**
// //      * @dev Returns the integer division of two unsigned integers. Reverts on
// //      * division by zero. The result is rounded towards zero.
// //      *
// //      * Counterpart to Solidity's `/` operator. Note: this function uses a
// //      * `revert` opcode (which leaves remaining gas untouched) while Solidity
// //      * uses an invalid opcode to revert (consuming all remaining gas).
// //      *
// //      * Requirements:
// //      *
// //      * - The divisor cannot be zero.
// //      */
// //     function div(uint256 a, uint256 b) internal pure returns (uint256) {
// //         return div(a, b, "SafeMath: division by zero");
// //     }

// //     /**
// //      * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
// //      * division by zero. The result is rounded towards zero.
// //      *
// //      * Counterpart to Solidity's `/` operator. Note: this function uses a
// //      * `revert` opcode (which leaves remaining gas untouched) while Solidity
// //      * uses an invalid opcode to revert (consuming all remaining gas).
// //      *
// //      * Requirements:
// //      *
// //      * - The divisor cannot be zero.
// //      */
// //     function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
// //         require(b > 0, errorMessage);
// //         uint256 c = a / b;
// //         // assert(a == b * c + a % b); // There is no case in which this doesn't hold

// //         return c;
// //     }

// //     /**
// //      * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
// //      * Reverts when dividing by zero.
// //      *
// //      * Counterpart to Solidity's `%` operator. This function uses a `revert`
// //      * opcode (which leaves remaining gas untouched) while Solidity uses an
// //      * invalid opcode to revert (consuming all remaining gas).
// //      *
// //      * Requirements:
// //      *
// //      * - The divisor cannot be zero.
// //      */
// //     function mod(uint256 a, uint256 b) internal pure returns (uint256) {
// //         return mod(a, b, "SafeMath: modulo by zero");
// //     }

// //     /**
// //      * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
// //      * Reverts with custom message when dividing by zero.
// //      *
// //      * Counterpart to Solidity's `%` operator. This function uses a `revert`
// //      * opcode (which leaves remaining gas untouched) while Solidity uses an
// //      * invalid opcode to revert (consuming all remaining gas).
// //      *
// //      * Requirements:
// //      *
// //      * - The divisor cannot be zero.
// //      */
// //     function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
// //         require(b != 0, errorMessage);
// //         return a % b;
// //     }
// // }

// // library Address {
// //     /**
// //      * @dev Returns true if `account` is a contract.
// //      *
// //      * [IMPORTANT]
// //      * ====
// //      * It is unsafe to assume that an address for which this function returns
// //      * false is an externally-owned account (EOA) and not a contract.
// //      *
// //      * Among others, `isContract` will return false for the following
// //      * types of addresses:
// //      *
// //      *  - an externally-owned account
// //      *  - a contract in construction
// //      *  - an address where a contract will be created
// //      *  - an address where a contract lived, but was destroyed
// //      * ====
// //      */
// //     function isContract(address account) internal view returns (bool) {
// //         // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
// //         // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
// //         // for accounts without code, i.e. `keccak256('')`
// //         bytes32 codehash;
// //         bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
// //         // solhint-disable-next-line no-inline-assembly
// //         assembly { codehash := extcodehash(account) }
// //         return (codehash != accountHash && codehash != 0x0);
// //     }

// //     /**
// //      * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
// //      * `recipient`, forwarding all available gas and reverting on errors.
// //      *
// //      * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
// //      * of certain opcodes, possibly making contracts go over the 2300 gas limit
// //      * imposed by `transfer`, making them unable to receive funds via
// //      * `transfer`. {sendValue} removes this limitation.
// //      *
// //      * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
// //      *
// //      * IMPORTANT: because control is transferred to `recipient`, care must be
// //      * taken to not create reentrancy vulnerabilities. Consider using
// //      * {ReentrancyGuard} or the
// //      * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
// //      */
// //     function sendValue(address payable recipient, uint256 amount) internal {
// //         require(address(this).balance >= amount, "Address: insufficient balance");

// //         // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
// //         (bool success, ) = recipient.call{ value: amount }("");
// //         require(success, "Address: unable to send value, recipient may have reverted");
// //     }

// //     /**
// //      * @dev Performs a Solidity function call using a low level `call`. A
// //      * plain`call` is an unsafe replacement for a function call: use this
// //      * function instead.
// //      *
// //      * If `target` reverts with a revert reason, it is bubbled up by this
// //      * function (like regular Solidity function calls).
// //      *
// //      * Requirements:
// //      *
// //      * - `target` must be a contract.
// //      * - calling `target` with `data` must not revert.
// //      */
// //     function functionCall(address target, bytes memory data) internal returns (bytes memory) {
// //       return functionCall(target, data, "Address: low-level call failed");
// //     }

// //     /**
// //      * @dev Same as {Address-functionCall-address-bytes-}, but with
// //      * `errorMessage` as a fallback revert reason when `target` reverts.
// //      */
// //     function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
// //         return _functionCallWithValue(target, data, 0, errorMessage);
// //     }

// //     /**
// //      * @dev Performs a Solidity function call using a low level `call`,
// //      * transferring `value` wei. A plain`call` is an unsafe replacement for a
// //      * function call: use this function instead.
// //      *
// //      * If `target` reverts with a revert reason, it is bubbled up by this
// //      * function (like regular Solidity function calls).
// //      *
// //      * Requirements:
// //      *
// //      * - `target` must be a contract.
// //      * - the calling contract must have an ETH balance of at least `value`.
// //      * - calling `target` with `data` must not revert.
// //      */
// //     function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
// //         return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
// //     }

// //     /**
// //      * @dev Same as {Address-functionCallWithValue-address-bytes-uint256-}, but
// //      * with `errorMessage` as a fallback revert reason when `target` reverts.
// //      */
// //     function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
// //         require(address(this).balance >= value, "Address: insufficient balance for call");
// //         return _functionCallWithValue(target, data, value, errorMessage);
// //     }

// //     function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
// //         require(isContract(target), "Address: call to non-contract");

// //         // solhint-disable-next-line avoid-low-level-calls
// //         (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
// //         if (success) {
// //             return returndata;
// //         } else {
// //             // Look for revert reason and bubble it up if present
// //             if (returndata.length > 0) {
// //                 // The easiest way to bubble the revert reason is using memory via assembly

// //                 // solhint-disable-next-line no-inline-assembly
// //                 assembly {
// //                     let returndata_size := mload(returndata)
// //                     revert(add(32, returndata), returndata_size)
// //                 }
// //             } else {
// //                 revert(errorMessage);
// //             }
// //         }
// //     }
// // }

// // library SafeERC20 {
// //     using SafeMath for uint256;
// //     using Address for address;

// //     function safeTransfer(IERC20 token, address to, uint256 value) internal {
// //         _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
// //     }

// //     function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
// //         _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
// //     }

// //     /**
// //      * @dev Deprecated. This function has issues similar to the ones found in
// //      * {IERC20-approve}, and its usage is discouraged.
// //      *
// //      * Whenever possible, use {safeIncreaseAllowance} and
// //      * {safeDecreaseAllowance} instead.
// //      */
// //     function safeApprove(IERC20 token, address spender, uint256 value) internal {
// //         // safeApprove should only be called when setting an initial allowance,
// //         // or when resetting it to zero. To increase and decrease it, use
// //         // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
// //         // solhint-disable-next-line max-line-length
// //         require((value == 0) || (token.allowance(address(this), spender) == 0),
// //             "SafeERC20: approve from non-zero to non-zero allowance"
// //         );
// //         _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
// //     }

// //     function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
// //         uint256 newAllowance = token.allowance(address(this), spender).add(value);
// //         _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
// //     }

// //     function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
// //         uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
// //         _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
// //     }

// //     /**
// //      * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
// //      * on the return value: the return value is optional (but if data is returned, it must not be false).
// //      * @param token The token targeted by the call.
// //      * @param data The call data (encoded using abi.encode or one of its variants).
// //      */
// //     function _callOptionalReturn(IERC20 token, bytes memory data) private {
// //         // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
// //         // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
// //         // the target address contains contract code and also asserts for success in the low-level call.

// //         bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
// //         if (returndata.length > 0) { // Return data is optional
// //             // solhint-disable-next-line max-line-length
// //             require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
// //         }
// //     }
// // }

// /*
//     @author Kamran Choudhry
//     @title "Aave-trage" — a smart contract that identifies and executes rate arbitrage opportunities across Aave V2 markets
// */
// contract Aavetrage {

//     // address constant lendingPoolAddressProviderAddress = address(0x88757f2f99175387aB4C6a4b3067c77A695b0349); // kovan
//     // address constant daiAddress = address(0x075A36BA8846C6B6F53644fDd3bf17E5151789DC);                        // kovan

//     address constant lendingPoolAddressProviderAddress = address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5); // mainnet
//     address constant daiAddress = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);                        // mainnet
//     address public bestBorrowToken;
//     address public bestSupplyToken;
//     uint256 public currentDAI;
//     uint256 public allowance;

//     State public state;
//     IERC20 public dai;
//     ILendingPool lendingPool;
//     ILendingPoolAddressesProvider provider;
    
//     enum State {
//         IDENTIFYING_ARBITRAGE,
//         BEGINNING_ARBITRAGE,
//         UNWINDING_ARBITRAGE,
//         COMPLETED_ARBITRAGE
//     }
  
//     constructor() public {
//         provider = ILendingPoolAddressesProvider(lendingPoolAddressProviderAddress);
//         lendingPool = ILendingPool(provider.getLendingPool());
//         dai = IERC20(daiAddress);
//     }
    
//     /*
//         @dev Identify two distinct markets, one with minimized Variable Borrow APR and the other with maximixed Desposit APY
//         @return True iff we have identified an arbitrage opportunity between two distinct markets
//     */
//     function peek() external returns(bool) {
//         require(state == State.IDENTIFYING_ARBITRAGE, "Arbitrage opportunity already discovered");
        
//         uint128 minBorrowRate = type(uint128).max;
//         uint128 maxSupplyRate = type(uint128).min;

//         address[] memory activeReserves = lendingPool.getReservesList();
        
//         for (uint i = 0; i < activeReserves.length; i++) {

//             address asset = activeReserves[i];
//             DataTypes.ReserveData memory reserveData = lendingPool.getReserveData(asset);
//             uint128 borrowRate = reserveData.currentVariableBorrowRate;
//             uint128 supplyRate = reserveData.currentLiquidityRate;
            
//             if (borrowRate > 0 && borrowRate < minBorrowRate) {
//                 minBorrowRate = borrowRate;
//                 bestBorrowToken = asset;
//             } 
            
//             if (supplyRate > maxSupplyRate) {
//                 maxSupplyRate = supplyRate;
//                 bestSupplyToken = asset;
//             }
            
//         }
        
//         bool opportunityExists = maxSupplyRate > minBorrowRate && bestBorrowToken != bestSupplyToken;
        
//         if (opportunityExists) {
//             state = State.BEGINNING_ARBITRAGE;
//         } 
        
//         return opportunityExists;
//     }
    
//     /*
//         ///
//     */
//     function guap(uint256 _daiAmount) external returns(address) {
//         require(state == State.BEGINNING_ARBITRAGE, "Failed to identify an arbitrage opportunity");
//         currentDAI = dai.balanceOf(msg.sender);
//         dai.transferFrom(msg.sender, address(this), _daiAmount)
//         dai.approve(provider.getLendingPool(), _daiAmount);
//         lendingPool.deposit(daiAddress, _daiAmount, msg.sender, 0);                                     // SafeERC20: low-level call failed'
//         // lendingPool.borrow(bestBorrowToken, 10, 2, 0, msg.sender);
//         return provider.getLendingPool();

//         IERC20(collateralAsset).safeApprove(aavetrageAddress, collateralAmount);                              // This line MUST be manually accomplished via Etherscan
//         IERC20(collateralAsset).safeApprove(provider.getLendingPool(), collateralAmount);
//         require(IERC20(collateralAsset).allowance(msg.sender, aavetrageAddress) >= collateralAmount, "Allowance criteria for Aavetrage not met...");
//         require(IERC20(collateralAsset).allowance(aavetrageAddress, provider.getLendingPool()) >= collateralAmount, "Allowance criteria for LendingPool not met...");
//         IERC20(collateralAsset).safeTransferFrom(msg.sender, aavetrageAddress, collateralAmount);
//         lendingPool.deposit(collateralAsset, collateralAmount, aavetrageAddress, 0);                          // Failing line, Standard Fail
//         return true;
//     }
    
//     /*
//         ///
//     */
//     function shut() external {
        
//     }
    
// }

































// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import {ILendingPool} from "@aave/protocol-v2/contracts/interfaces/ILendingPool.sol";
import {ILendingPoolAddressesProvider} from "@aave/protocol-v2/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import {DataTypes} from "@aave/protocol-v2/contracts/protocol/libraries/types/DataTypes.sol";

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {Address-functionCall-address-bytes-}, but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`,
     * transferring `value` wei. A plain`call` is an unsafe replacement for a
     * function call: use this function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - the calling contract must have an ETH balance of at least `value`.
     * - calling `target` with `data` must not revert.
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {Address-functionCallWithValue-address-bytes-uint256-}, but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

/*
    @author Kamran Choudhry
    @title "Aave-trage" — a smart contract that identifies and executes rate arbitrage opportunities across Aave V2 markets
*/
contract Aavetrage {
    using SafeERC20 for IERC20;

    // address constant lendingPoolAddressProviderAddress = address(0x88757f2f99175387aB4C6a4b3067c77A695b0349);
    // address constant collateralAsset = address(0x075A36BA8846C6B6F53644fDd3bf17E5151789DC);                                // Kovan UNI Token
    address constant lendingPoolAddressProviderAddress = address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5); // mainnet
    address constant collateralAsset = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);                        // mainnet
    address public bestBorrowToken;
    address public bestSupplyToken;
    address public aavetrageAddress;
    uint256 public collateralAmount = 10000000;

    State public state;
    ILendingPool lendingPool;
    ILendingPoolAddressesProvider provider;
    
    enum State {
        IDENTIFYING_ARBITRAGE,
        BEGINNING_ARBITRAGE,
        UNWINDING_ARBITRAGE,
        COMPLETED_ARBITRAGE
    }
  
    constructor() public {
        provider = ILendingPoolAddressesProvider(lendingPoolAddressProviderAddress);
        lendingPool = ILendingPool(provider.getLendingPool());
        aavetrageAddress = address(this);
    }

    event Guap(address collateralAsset, bool isSuccess);

    
    /*
        @dev Identify two distinct markets, one with minimized Variable Borrow APR and the other with maximixed Desposit APY
        @return True iff we have identified an arbitrage opportunity between two distinct markets
    */
    function peek() external returns(bool) {
        require(state == State.IDENTIFYING_ARBITRAGE, "Optimal arbitrage opportunities already identified");
        
        uint128 minBorrowRate = type(uint128).max;
        uint128 maxSupplyRate = type(uint128).min;

        address[] memory activeReserves = lendingPool.getReservesList();
        
        for (uint i = 0; i < activeReserves.length; i++) {

            address asset = activeReserves[i];
            DataTypes.ReserveData memory reserveData = lendingPool.getReserveData(asset);
            uint128 borrowRate = reserveData.currentVariableBorrowRate;
            uint128 supplyRate = reserveData.currentLiquidityRate;
            
            if (borrowRate > 0 && borrowRate < minBorrowRate) {
                minBorrowRate = borrowRate;
                bestBorrowToken = asset;
            } 
            
            if (supplyRate > maxSupplyRate) {
                maxSupplyRate = supplyRate;
                bestSupplyToken = asset;
            }
            
        }
        
        bool opportunityExists = maxSupplyRate > minBorrowRate && bestBorrowToken != bestSupplyToken;
        
        if (opportunityExists) {
            state = State.BEGINNING_ARBITRAGE;
        } 
        
        return opportunityExists;
    }

    
    /*
        ///
    */
    function guap() external {
        // require(state == State.BEGINNING_ARBITRAGE, "Please execute peek() before guap()");

        // check Aavetrage token allowance
        require(IERC20(collateralAsset).allowance(msg.sender, aavetrageAddress) >= collateralAmount, "Allowance criteria for Aavetrage not met...");

        // transfer collateral from owner to Aavetrage
        IERC20(collateralAsset).safeTransferFrom(msg.sender, aavetrageAddress, collateralAmount);
        
        // approve lending pool to access Aavetrage token balance
        IERC20(collateralAsset).safeApprove(provider.getLendingPool(), collateralAmount);

        // check lending pool token allowance
        require(IERC20(collateralAsset).allowance(aavetrageAddress, provider.getLendingPool()) >= collateralAmount, "Allowance criteria for LendingPool not met...");

        // deposit into lending pool
        lendingPool.deposit(collateralAsset, collateralAmount, aavetrageAddress, 0);

        // emit a Guap event
        emit Guap(address(collateralAsset), true);
    }
    
    
    /*
        ///
    */
    function shut() external {
        
    }
    
}