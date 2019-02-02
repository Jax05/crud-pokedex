User.create(username: "Trainer", password: "bethebest")

@user = User.find_by_username("Trainer")

@user.pokemon.create(name: "Totodile", type_name: "Water", description: "a Pokemon with powerful jaws")
@user.pokemon.create(name: "Chikorita", type_name: "Grass", description: "a Pokemon that waves its leaf around to keep foes at bay")
@user.pokemon.create(name: "Eevee", type_name: "Normal", description: "a Pokemon with an unstable genetic makeup")
