module MyModule::FreelanceMarketplace {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing an escrow contract between client and freelancer.
    struct EscrowContract has store, key {
        client: address,           // Client who pays for the work
        freelancer: address,       // Freelancer who will do the work
        amount: u64,              // Payment amount held in escrow
        is_completed: bool,       // Whether work is completed
        is_disputed: bool,        // Whether there's a dispute
    }

    /// Function to create a new escrow contract and deposit payment.
    public fun create_escrow(
        client: &signer, 
        freelancer_addr: address, 
        amount: u64
    ) {
        let client_addr = signer::address_of(client);
        
        // Create escrow contract
        let escrow = EscrowContract {
            client: client_addr,
            freelancer: freelancer_addr,
            amount,
            is_completed: false,
            is_disputed: false,
        };

        // Transfer payment from client to escrow (held by client's account)
        let payment = coin::withdraw<AptosCoin>(client, amount);
        coin::deposit<AptosCoin>(client_addr, payment);
        
        move_to(client, escrow);
    }

    /// Function to release payment or handle disputes.
    public fun complete_or_dispute(
        caller: &signer, 
        escrow_owner: address, 
        release_payment: bool
    ) acquires EscrowContract {
        let caller_addr = signer::address_of(caller);
        let escrow = borrow_global_mut<EscrowContract>(escrow_owner);
        
        // Only client or freelancer can call this function
        assert!(caller_addr == escrow.client || caller_addr == escrow.freelancer, 1);
        
        if (release_payment && !escrow.is_disputed) {
            // Release payment to freelancer
            let payment = coin::withdraw<AptosCoin>(caller, escrow.amount);
            coin::deposit<AptosCoin>(escrow.freelancer, payment);
            escrow.is_completed = true;
        } else {
            // Mark as disputed for external resolution
            escrow.is_disputed = true;
        }
    }
}