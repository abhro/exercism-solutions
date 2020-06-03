use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    // basic single codepoint based implementation:
    // return input.chars().rev().collect();

    // extended implementation
    input.graphemes(true).rev().collect()
}
