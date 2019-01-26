# ETHSingapore hack: sharding!

Sharding (initially focused on beacon chain) built on top of my experimental project [`protolith`](https://github.com/protolambda/protolith).

Started off as an ambitious ETHSingapore Hackathon project (end 2018), but continued development early 2019.
This project aims to become an extensible Eth 2.0 full node with wide cross-platform support,
 leveraging Dart-lang (browser, Linux, Mac, Windows, Android, iOS).

This project is not commercial, quite experimental for now, and developed as a side-project (due to lack of funding).

By @protolambda - Diederik Loerakker.


## Design choices

Highlights:

- Written in Dart, a language that runs on a lot of platforms, and quite well because of the effort of Google.
- Very modular. The code-base is split up in features, which are mixed together using the `Mixin` feature of Dart.
  This enables us to keep things *very* encapsulated, and enable you to create your own experimental Beacon chain **on-top** of this project, instead of hacking it apart.
- Built on **`protolith`**, another side-project of @protolambda. Common blockchain features are shared,
  and can be used for other types of blockchain nodes. E.g. a shard-chain may just be a remixed Eth 1.0 chain.

This project is different from the other Eth 2.0 project in the following ways:

- No "state". Wtf? Well, the state is split up, and data is stored in another way:
  the beacon-state is not saved every slot/block, but instead, only the changes are saved, and tagged with the corresponding block-hash. 
  And the underlying accesses to the data are async; the storage is abstracted, and a (cached) cloud-based DB may be one of the implementations in the future.
  If a state-variable is queried, the query key supplies the block-hash, and the query goes through the ancestors of this block-hash till it finds an entry in the DB.
  There's no deletion, only overriding. And the data can be pruned easily (time based on DB index order, or only-canonical-chain based on marking all ancestors of the HEAD).
  You could compare this to the way Git works.
- Like a few others, this project uses a DAG of blocks (just hashes), to keep track of the unfinalized blocks, and apply the LMD GHOST fork-choice rule to.
  In addition to that, this project deviates from the spec in a non-breaking way: the Beacon-DAG has a voting function
  which applies voting based on the target-blocks of each active validator, and does not back-track from targeted blocks
  every single hop in the GHOST path-finding towards the head of the chain.
- Code-base is split up in features, and mixins enable quicker changes + experimentation.
  Spec-design/experimentation could become easier and changes will be nicely encapsulated.
- Focus on the Node-software first, not so much on the smartcontract / event-log processing.
  Building Protolith (generalized blockchain node library) at the same time. 
- No team/company/funding. Maybe someday. It's a hobby project for now, with whatever time I can afford to spent on it.
  Contributions are welcome! But please understand that it's in an early phase, and things may break.


## Contributing

Discussions/suggestions are always welcome, but this code is just me during the hackathon.
This repo will be made public near the end of the hackathon,
 PRs/issues will be open after judging, to grow the project :)

## Contact

Twitter/Github/Telegram: @protolambda
Site: https://protolambda.com

If anyone would like to donate to this project: [`0xE00ff7cf7b698Dde68a52D934B7726A24e54402D`](https://etherscan.io/address/0xe00ff7cf7b698dde68a52d934b7726a24e54402d)
Also open to join another Eth 2.0 team, I am looking for technical full-time Ethereum related work.

## License

MIT, see License file. 
