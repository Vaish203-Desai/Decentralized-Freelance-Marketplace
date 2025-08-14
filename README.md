# **Freelance Marketplace Smart Contract**

## **Description**

The **Freelance Marketplace Smart Contract** is a decentralized escrow system built on the Aptos blockchain to facilitate secure transactions between clients and freelancers.
It ensures that payments are held in escrow until the work is completed or disputes are resolved, creating trust between both parties without the need for intermediaries.

---

## **Vision**

Our vision is to create a **transparent, secure, and automated freelance marketplace** where:

* Clients have assurance their funds are protected until they are satisfied with the work.
* Freelancers are guaranteed payment once the work is completed as agreed.
* Disputes can be flagged and handled fairly, avoiding scams and misunderstandings.

---

## **Future Scope**

Planned enhancements for future versions:

1. **Third-party arbitration** for resolving disputes fairly.
2. **Milestone-based payments** instead of lump-sum escrow.
3. **Reputation system** for clients and freelancers.
4. **Multi-token support** (not just AptosCoin).
5. **Automatic deadlines** that auto-release or refund funds after a set time.
6. **Integration with decentralized identity (DID)** for verification of parties.

---

## **Contract Details**

* **Module Name:** `MyModule::FreelanceMarketplace`
* **Functions:**

  1. `create_escrow(client, freelancer_addr, amount)` → Creates an escrow contract and locks funds.
  2. `complete_or_dispute(caller, escrow_owner, release_payment)` → Completes payment or marks the escrow as disputed.
* **Storage:**
  Escrow data is stored in the **client’s account** under the `EscrowContract` resource until released or disputed.
* **Token Used:** `AptosCoin` (native Aptos token).

---

## **Deployed Contract Address**

0xdbb13c8107cfc801cc2be1c8cdd5b16cabfac162858e53a775eb2e759b2001f2
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a5a814fe-b8f0-45c8-8833-57a9f764a1ed" />

0xb000b0ad4bd532e7c46bc9e3f208783f4cbd1098c9af6981f5bac43cfbab2a38

*(Replace with actual on-chain deployment address after publishing.)*

---

Do you want me to also **add a transaction flow diagram** showing how funds move between the client, escrow, and freelancer? That would make this README even clearer for developers and non-developers.
