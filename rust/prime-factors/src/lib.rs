pub fn factors(mut n: u64) -> Vec<u64> {
    let mut factors = Vec::new();

    while n % 2 == 0 {
        factors.push(2);
        n /= 2;
    }

    let mut factor = 3;
    while n > 1 {
        if n % factor == 0 {
            factors.push(factor);
            n /= factor;
        }
        else {
            factor += 2;
        }
    }

    factors
}
