class HorizontalFragmentGenerator:
    def __init__(self, predicates, minterm_predicates):
        self.predicates = predicates
        self.minterm_predicates = minterm_predicates

    def generate_fragments(self):
        fragments = {}
        for predicate in self.predicates:
            matching_minterm = any(all(predicate[attr] == value for attr, value in minterm.items()) for minterm in self.minterm_predicates)
            if matching_minterm:
                fragment_name = ",".join(predicate.keys())
                if fragment_name in fragments:
                    fragments[fragment_name].append(predicate.copy())
                else:
                    fragments[fragment_name] = [predicate.copy()]

            return fragments