pub fn raindrops(n: u32) -> String {
    let mut s = String::new();

    let plings = [(3, "Pling"), (5, "Plang"), (7, "Plong")];

    for (divisor, effect) in plings.iter() {
        if n % divisor == 0 {
            s.push_str(effect);
        }
    }

    if s.is_empty() {
        s.push_str(n.to_string().as_str());
    }

    s
}
