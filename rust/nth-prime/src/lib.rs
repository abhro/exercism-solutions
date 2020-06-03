pub fn nth(n: u32) -> u32 {
    match n {
        0 => 2,
        1 => 3,
        2 => 5,
        3 => 7,
        4 => 11,
        _ => {
            let mut i: u32 = 4;
            let mut candidate = 11;
            while i < n {
                candidate += 2;
                if is_prime(candidate) {
                    i += 1;
                }
            }

            candidate
        }
    }
}

fn is_prime(n: u32) -> bool {
    if n <= 3 {
        return n > 1;
    }
    if n % 2 == 0 || n % 3 == 0 {
        return false;
    }

    let mut i = 5;
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false;
        }
        i = i + 6;
    }

    true
}
