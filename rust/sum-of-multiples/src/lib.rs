use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples = HashSet::new();

    for factor in factors {
        let mut multiple = *factor;
        if multiple == 0 {
            continue;
        }
        while multiple < limit {
            multiples.insert(multiple);
            multiple += factor;
        }
    }

    multiples.iter().sum()
}
