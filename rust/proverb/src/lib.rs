pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 1 {
        return format!("And all for the want of a {}.", list[0]);
    }

    let mut output = String::new();
    for i in 0..list.len() {
        if i + 1 == list.len() {
            output.push_str(format!("And all for the want of a {}.", list[0]).as_str());
            break;
        }
        output.push_str(format!("For want of a {} the {} was lost.\n", list[i], list[i+1]).as_str());
    }

    output
}
