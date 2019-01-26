import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/crypto/BLSSignature.dart';

/// 1,000,000,000
///
/// Note: this does not work in a browser and would need to be modified.
/// One could try the beacon chain in a browser by changing [_giga] to be a million.
const int _giga = 1000000000;

/*
      General
 */
const int

    /// 1024 shards.
    SHARD_COUNT = 1 << 10,

    /// = 128 validators
    TARGET_COMMITTEE_SIZE = 1 << 7,

    /// = 16,000,000,000 Gwei
    EJECTION_BALANCE = (1 << 3) * _giga,

    /// = 32
    MAX_BALANCE_CHURN_QUOTIENT = 1 << 5,

    ///  (= 1,024) votes
    MAX_CASPER_VOTES = 1 << 10,

    ///  (= 8,192) The latest block roots.
    LATEST_BLOCK_ROOTS_LENGTH = 1 << 13,

    ///  (= 8,192) The latest 8,192 randao mixes will be tracked.
    LATEST_RANDAO_MIXES_LENGTH = 1 << 13,

    ///  (= 8,192) The latest 8,192 epochs.
    LATEST_PENALIZED_EXIT_LENGTH = 1 << 13,

    ///  (= 4)  withdrawals
    MAX_WITHDRAWALS_PER_EPOCH = 1 << 2;

/*
      Deposit Contract
 */
const int
    DEPOSIT_CONTRACT_TREE_DEPTH = 1 << 5,
    MIN_DEPOSIT_AMOUNT = _giga,
    MAX_DEPOSIT_AMOUNT = (1 << 5) * _giga;

/*
      Initial values
 */
const int
    GENESIS_FORK_VERSION = 0,
    GENESIS_SLOT = 0,
    GENESIS_START_SHARD = 0,
    /// Max signed 64 bit integer. Spec says unsigned, but this can be safely ignored.
    /// Note: this does not work in a browser and would need to be modified. ((1 << 31) - 1, i.e. max signed 32 bit int, would work)
    FAR_FUTURE_SLOT = (1 << 63) - 1;

Hash256 ZERO_HASH = Hash256.fromTypedData(new Uint8List(32));

// TODO BLS / other signature not implemented yet.
BLSSignature EMPTY_SIGNATURE = BLSSignature();

/*
      Time parameters
 */
const int

    /// 6 seconds
    SLOT_DURATION = 6,

    /// 4 slots
    MIN_ATTESTATION_INCLUSION_DELAY = 1 << 2,

    /// 64 slots
    EPOCH_LENGTH = 1 << 6,

    ///  (= 64)  slots  6.4 minutes
    SEED_LOOKAHEAD = 1 << 6,

    /// (= 256)  slots  25.6 minutes
    ENTRY_EXIT_DELAY = 1 << 8,

    ///  (= 1,024)  slots  ~1.7 hours
    ETH1_DATA_VOTING_PERIOD = 1 << 10,

    ///  (= 16,384)  slots  ~27 hours
    MIN_VALIDATOR_WITHDRAWAL_TIME = 1 << 14;

/// one vdf output for every epoch.
const int LATEST_VDF_OUTPUTS_LENGTH =
    LATEST_RANDAO_MIXES_LENGTH ~/ EPOCH_LENGTH;




