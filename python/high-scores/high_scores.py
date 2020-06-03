
def latest(scores: list):
    return scores[-1]


def personal_best(scores: list):
    return max(scores)


def personal_top_three(scores: list) -> list:
    return sorted(scores, reverse=True)[:3]
