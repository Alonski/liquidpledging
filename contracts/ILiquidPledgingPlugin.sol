pragma solidity ^0.4.11;

/// @title ILiquidPledingPlugin
/// @author ???
/// @notice This contract specifies plugins for use with the Liquid Pledging 
///  Contract. Plugins are used (much like web hooks) to initiate an action
///  upon any donation, delegation, or transfer; this is an optional feature
///  and allows for extreme customization of the contract
contract ILiquidPledgingPlugin {
    /// @dev Plugin that gets fired before a transfer
    /// @param pledgeManager Who is the pledge manager
    /// @param pledgeFrom Who is the pledger
    /// @param pledgeTo Who the pledge is going to
    /// @param amount The amount being pledged
    /// @param context The situation that is triggering the plugin:
    ///  0 -> Plugin for the owner transferring pledge to another party
    ///  1 -> Plugin for the first delegate transferring pledge to another party
    ///  2 -> Plugin for the second delegate transferring pledge to another party
    ///  ...
    ///  255 -> Plugin for the intendedProject transferring pledge to another party
    ///
    ///  256 -> Plugin for the owner receiving pledge to another party
    ///  257 -> Plugin for the first delegate receiving pledge to another party
    ///  258 -> Plugin for the second delegate receiving pledge to another party
    ///  ...
    ///  511 -> Plugin for the intendedProject receiving pledge to another party
    /// @return The max allowed pledge amount
    function beforeTransfer(
        uint64 pledgeManager, 
        uint64 pledgeFrom,
        uint64 pledgeTo,
        uint64 context,
        uint amount
        ) public returns (uint maxAllowed);

    /// @dev Plugin that gets fired after a transfer
    /// @param pledgeManager The pledge manager
    /// @param pledgeFrom The pledger
    /// @param pledgeTo The pledge receiver
    /// @param amount The amount being pledged
    /// @param context The situation that is triggering the plugin:
    ///  0 -> Plugin for the owner transferring pledge to another party
    ///  1 -> Plugin for the first delegate transferring pledge to another party
    ///  2 -> Plugin for the second delegate transferring pledge to another party
    ///  ...
    ///  255 -> Plugin for the intendedProject transferring pledge to another party
    ///
    ///  256 -> Plugin for the owner receiving pledge to another party
    ///  257 -> Plugin for the first delegate receiving pledge to another party
    ///  258 -> Plugin for the second delegate receiving pledge to another party
    ///  ...
    ///  511 -> Plugin for the intendedProject receiving pledge to another party
    /// @return The max allowed pledge amount
    function afterTransfer(
        uint64 pledgeManager,
        uint64 pledgeFrom,
        uint64 pledgeTo,
        uint64 context,
        uint amount) public;
}
