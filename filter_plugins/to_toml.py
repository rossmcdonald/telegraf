import toml


class FilterModule(object):
    def filters(self):
        return {"to_toml": self.to_toml}

    def to_toml(self, input):
        return toml.dumps(input)
