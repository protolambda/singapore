# ETHSingapore hack: sharding!

Sharding (initially focused on beacon chain) built on top of my experimental project [`protolith`](https://github.com/protolambda/protolith).

ETHSingapore Hackathon project, to be built further with any available time/resources.

By @protolambda

## Overview of codebase.

```
lib
├── beacon                       -- Beacon chain implementation
│   ├── beacon_block_chain.dart         -- The chain core
│   ├── beacon_block.dart               -- Spec of a block, mixes data/ components
│   ├── beacon_block_meta.dart          -- Spec for the context of a block (Beacon State here)
│   ├── beacon_network.dart             -- Combines the chain with a "syncer"; source of external data
|   |
│   ├── attestation                               -- Classes for general attestation related work
│   │   ├── attestation_data.dart
│   │   ├── attestation_record.dart
│   │   └── pending_attestation_record.dart
│   ├── committees                                -- Classes to keep track of committee data.
│   │   ├── shard_committee.dart
│   │   └── shard_reassignment_record.dart
│   ├── crosslinks                                -- Crosslink records
│   │   └── cross_link_record.dart
│   ├── data                             -- Mixins: compose your own custom beacon block with these.
│   │   ├── attestation.dart
│   │   ├── randao.dart
│   │   ├── signature.dart
│   │   └── slot.dart
│   ├── forking                          -- Fork data (meta data in blocks in case a fork that needs a extra flags etc.)
│   │   └── fork_data.dart
│   ├── meta                             -- More mixins, but for the Block-meta (Beacon state here).
│   │   ├── finality.dart                
│   │   ├── fork.dart
│   │   ├── pow_receipt_root.dart
│   │   ├── randao.dart
│   │   ├── recent_state.dart
│   │   └── validator_registry.dart
│   ├── pow                                              -- classes for Eth-1.0 related data.
│   │   └── candidate_pow_receipt_root_record.dart
│   ├── unfinalized                                  -- Where non-finalized blocks are maintained with
│   │   ├── beacon_entry.dart                             -- wrap each block in an entry with extra functionality.
│   │   ├── beacon_fork_choice.dart                       -- implementation of scoring used in GHOST, 
|   |   |                                                 beacon chain itself does the Latest Message Driven (LMD) part.
│   │   ├── dag                         -- DAG (leveled structure) used to order and path-find this block data. 
│   │   │   ├── dag.dart
│   │   │   └── fork_choice.dart
│   │   └── ghost.dart                             -- implementation of GHOST as a fork-choice rule,
|   |                                                   used in the DAG for pathfinding. 
│   └── validators                      -- Validator related records used in the beacon chain.
│       └── validator_record.dart
├── crypto                                     TODO: BLS aggregate signatures, mocked for now, to be implemented.
│   ├── BLSPubKey.dart
│   └── BLSSignature.dart
├── eth2.dart                                  Starts a "network" instance for Eth-1, Beacon chain, and shards.
│
│                              -- TODO:
├── shard                      -- Shard chain implementation (similar to the standard-chain spec)
└── validator                  -- The beacon chain already handles blocks, but we still need an initiator to propose and attest them.
    ├── attester
    └── proposer


```

## Contributing

Discussions/suggestions are always welcome, but this code is just me during the hackathon.
This repo will be made public near the end of the hackathon,
 PRs/issues will be open after judging, to grow the project :)


## License

MIT, see License file. 
