
/// Module: demo
module demo::demo;
use std::string::String;

public struct BobHouse has key, store {
    id: UID,
    value: String,
}

public fun say_hi(): String {
    b"hello world".to_string()
}


public fun mint(value: String, ctx: &mut TxContext): BobHouse {
    BobHouse {
        id: object::new(ctx),
        value,
    }
}

