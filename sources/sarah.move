module demo::sarah;
use sui::display;
use sui::package;


public struct SARAH has drop {}

public struct Sarah has key, store {
    id: UID
}

fun init(otw: SARAH, ctx: &mut TxContext) {
    let publisher = package::claim(otw, ctx);
    let mut display = display::new<Sarah>(&publisher, ctx);

    display.add(
        b"name".to_string(),
        b"Sarah the fairy princess".to_string()
    );

    display.add(
        b"description".to_string(),
        b"Sarah living in her palace".to_string()
    );

    display.add(
        b"image_url".to_string(),
        b"https://i.ibb.co/HLdRfdNx/Gemini-Generated-Image-hgr2izhgr2izhgr2.png".to_string()
    );

    // Update the display with the new data.
    // Must be called to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

#[allow(lint(self_transfer))]
public fun mint(ctx: &mut TxContext) {
    let sarah = Sarah {
        id: object::new(ctx)
    };

    transfer::public_transfer(sarah, ctx.sender());
}