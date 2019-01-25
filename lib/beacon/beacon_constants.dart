

/// 64 slots
const int EPOCH_LENGTH = 1 << 6;
/// 6 seconds
const int SLOT_DURATION = 6;


/// the latest 8,192 randao mixes will be tracked.
const int LATEST_RANDAO_MIXES_LENGTH = 1 << 13;

/// one vdf output for every epoch.
const int LATEST_VDF_OUTPUTS_LENGTH = LATEST_RANDAO_MIXES_LENGTH ~/ EPOCH_LENGTH;

/// 1024 shards.
const int SHARD_COUNT = 1 << 10;

/// the latest 8,192 blocks.
const int LATEST_BLOCK_ROOTS_LENGTH = 1 << 13;

/// the latest 8,192 epochs.
const int LATEST_PENALIZED_EXIT_LENGTH = 1 << 13;

