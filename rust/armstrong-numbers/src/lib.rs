pub fn is_armstrong_number(num: u32) -> bool {
    let mut n = num;
    let mut digits = Vec::new();

    while n > 0 {
        digits.push(n % 10);
        n /= 10;
    }

    let exponent = digits.len() as u32;
    let digitsum = digits.iter().map(|n| n.pow(exponent)).sum();

    num == digitsum
}
