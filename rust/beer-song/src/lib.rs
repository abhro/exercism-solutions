pub fn verse(n: u32) -> String {
    if n == 0 {
        return String::from(
            "No more bottles of beer on the wall, no more bottles of beer.\n\
             Go to the store and buy some more, 99 bottles of beer on the wall.\n");
    }

    let plural = if n == 1 { "" } else { "s" };
    let plural_two = if n - 1 == 1 { "" } else { "s" };
    let beer_to_take_down = if n == 1 { "it" } else { "one" };
    let next_beer_count = if n == 1 { String::from("no more") } else { (n - 1).to_string() };

    format!(
        "{0} bottle{1} of beer on the wall, {0} bottle{1} of beer.\n\
         Take {4} down and pass it around, {2} bottle{3} of beer on the wall.\n",
         n, plural, next_beer_count, plural_two, beer_to_take_down)
}

pub fn sing(start: u32, end: u32) -> String {
    let mut s = String::new();

    for n in (end..(start+1)).rev() {
        s = format!("{}\n{}", s, verse(n));
    }

    s.remove(0);

    s
}
