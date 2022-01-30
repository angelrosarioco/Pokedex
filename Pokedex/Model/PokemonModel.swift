//
//  Pokemon.swift
//  Pokedex
//
//  Created by Angel Rosario on 12/5/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemon = try? newJSONDecoder().decode(Pokemon.self, from: jsonData)



/*

 // MARK: - Pokemon
 struct Pokemon {
     let abilities: [Ability]?
     let baseExperience: Int?
     let forms: [Species]?
     let gameIndices: [GameIndex]?
     let height: Int?
     let heldItems: [HeldItem]?
     let id: Int?
     let isDefault: Bool?
     let locationAreaEncounters: String?
     let moves: [Move]?
     let name: String?
     let order: Int?
     let pastTypes: [Any?]?
     let species: Species?
     let sprites: Sprites?
     let stats: [Stat]?
     let types: [TypeElement]?
     let weight: Int?
 }

 // MARK: - Ability
 struct Ability {
     let ability: Species?
     let isHidden: Bool?
     let slot: Int?
 }

 // MARK: - Species
 struct Species {
     let name: String?
     let url: String?
 }

 // MARK: - GameIndex
 struct GameIndex {
     let gameIndex: Int?
     let version: Species?
 }

 // MARK: - HeldItem
 struct HeldItem {
     let item: Species?
     let versionDetails: [VersionDetail]?
 }

 // MARK: - VersionDetail
 struct VersionDetail {
     let rarity: Int?
     let version: Species?
 }

 // MARK: - Move
 struct Move {
     let move: Species?
     let versionGroupDetails: [VersionGroupDetail]?
 }

 // MARK: - VersionGroupDetail
 struct VersionGroupDetail {
     let levelLearnedAt: Int?
     let moveLearnMethod, versionGroup: Species?
 }

 // MARK: - GenerationV
 struct GenerationV {
     let blackWhite: Sprites?
 }

 // MARK: - GenerationIv
 struct GenerationIv {
     let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
 }

 // MARK: - Versions
 struct Versions {
     let generationI: GenerationI?
     let generationIi: GenerationIi?
     let generationIii: GenerationIii?
     let generationIv: GenerationIv?
     let generationV: GenerationV?
     let generationVi: [String: Home]?
     let generationVii: GenerationVii?
     let generationViii: GenerationViii?
 }

 // MARK: - Sprites
 class Sprites {
     let backDefault: String?
     let backFemale: NSNull?
     let backShiny: String?
     let backShinyFemale: NSNull?
     let frontDefault: String?
     let frontFemale: NSNull?
     let frontShiny: String?
     let frontShinyFemale: NSNull?
     let other: Other?
     let versions: Versions?
     let animated: Sprites?

     init(backDefault: String?, backFemale: NSNull?, backShiny: String?, backShinyFemale: NSNull?, frontDefault: String?, frontFemale: NSNull?, frontShiny: String?, frontShinyFemale: NSNull?, other: Other?, versions: Versions?, animated: Sprites?) {
         self.backDefault = backDefault
         self.backFemale = backFemale
         self.backShiny = backShiny
         self.backShinyFemale = backShinyFemale
         self.frontDefault = frontDefault
         self.frontFemale = frontFemale
         self.frontShiny = frontShiny
         self.frontShinyFemale = frontShinyFemale
         self.other = other
         self.versions = versions
         self.animated = animated
     }
 }

 // MARK: - GenerationI
 struct GenerationI {
     let redBlue, yellow: RedBlue?
 }

 // MARK: - RedBlue
 struct RedBlue {
     let backDefault, backGray, backTransparent, frontDefault: String?
     let frontGray, frontTransparent: String?
 }

 // MARK: - GenerationIi
 struct GenerationIi {
     let crystal: Crystal?
     let gold, silver: Gold?
 }

 // MARK: - Crystal
 struct Crystal {
     let backDefault, backShiny, backShinyTransparent, backTransparent: String?
     let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
 }

 // MARK: - Gold
 struct Gold {
     let backDefault, backShiny, frontDefault, frontShiny: String?
     let frontTransparent: String?
 }

 // MARK: - GenerationIii
 struct GenerationIii {
     let emerald: Emerald?
     let fireredLeafgreen, rubySapphire: Gold?
 }

 // MARK: - Emerald
 struct Emerald {
     let frontDefault, frontShiny: String?
 }

 // MARK: - Home
 struct Home {
     let frontDefault: String?
     let frontFemale: NSNull?
     let frontShiny: String?
     let frontShinyFemale: NSNull?
 }

 // MARK: - GenerationVii
 struct GenerationVii {
     let icons: DreamWorld?
     let ultraSunUltraMoon: Home?
 }

 // MARK: - DreamWorld
 struct DreamWorld {
     let frontDefault: String?
     let frontFemale: NSNull?
 }

 // MARK: - GenerationViii
 struct GenerationViii {
     let icons: DreamWorld?
 }

 // MARK: - Other
 struct Other {
     let dreamWorld: DreamWorld?
     let home: Home?
     let officialArtwork: OfficialArtwork?
 }

 // MARK: - OfficialArtwork
 struct OfficialArtwork {
     let frontDefault: String?
 }

 // MARK: - Stat
 struct Stat {
     let baseStat, effort: Int?
     let stat: Species?
 }

 // MARK: - TypeElement
 struct TypeElement {
     let slot: Int?
     let type: Species?
 }


 */



// MARK: - Pokemon
struct PokemonModel: Codable, Identifiable {
    let abilities: [PokemonAbility]?
    let baseExperience: Int?
    let forms: [PokemonSpecies]?
    let gameIndices: [PokemonGameIndex]?
    let height: Int?
    let heldItems: [PokemonHeldItem]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [PokemonMove]?
    let name: String?
    let order: Int?
    let species: PokemonSpecies?
    let sprites: PokemonSprites?
    let stats: [PokemonStat]?
    let types: [PokemonType]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case species, sprites, stats, types, weight
    }
}

// MARK: - Ability
struct PokemonAbility: Codable, Identifiable {
    let id = UUID()
    let ability: PokemonSpecies?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct PokemonSpecies: Codable {
    let name: String?
    let url: String?
}

// MARK: - GameIndex
struct PokemonGameIndex: Codable {
    let gameIndex: Int?
    let version: PokemonSpecies?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - HeldItem
struct PokemonHeldItem: Codable {
    let item: PokemonSpecies?
    let versionDetails: [PokemonVersionDetail]?

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct PokemonVersionDetail: Codable {
    let rarity: Int?
    let version: PokemonSpecies?
}

// MARK: - Move
struct PokemonMove: Codable {
    let move: PokemonSpecies?
    let versionGroupDetails: [PokemonVersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct PokemonVersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: PokemonSpecies?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationV
struct PokemonGenerationV: Codable {
    let blackWhite: PokemonSprites?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct PokemonGenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: PokemonSprites?

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - Versions
struct PokemonVersions: Codable {
    let generationI: PokemonGenerationI?
    let generationIi: PokemonGenerationIi?
    let generationIii: PokemonGenerationIii?
    let generationIv: PokemonGenerationIv?
    let generationV: PokemonGenerationV?
    let generationVi: [String: PokemonHome]?
    let generationVii: PokemonGenerationVii?
    let generationViii: PokemonGenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Sprites
class PokemonSprites: Codable {
    let backDefault, backFemale, backShiny, backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
    let other: PokemonOther?
    let versions: PokemonVersions?
    let animated: PokemonSprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, other: PokemonOther?, versions: PokemonVersions?, animated: PokemonSprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct PokemonGenerationI: Codable {
    let redBlue, yellow: PokemonRedBlue?

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct PokemonRedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIi
struct PokemonGenerationIi: Codable {
    let crystal: PokemonCrystal?
    let gold, silver: PokemonGold?
}

// MARK: - Crystal
struct PokemonCrystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold
struct PokemonGold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIii
struct PokemonGenerationIii: Codable {
    let emerald: PokemonEmerald?
    let fireredLeafgreen, rubySapphire: PokemonGold?

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - Emerald
struct PokemonEmerald: Codable {
    let frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Home
struct PokemonHome: Codable {
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct PokemonGenerationVii: Codable {
    let icons: PokemonDreamWorld?
    let ultraSunUltraMoon: PokemonHome?

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct PokemonDreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct PokemonGenerationViii: Codable {
    let icons: PokemonDreamWorld?
}

// MARK: - Other
struct PokemonOther: Codable {
    let dreamWorld: PokemonDreamWorld?
    let home: PokemonHome?
    let officialArtwork: PokemonOfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct PokemonOfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct PokemonStat: Codable, Identifiable {
    let id = UUID()
    let baseStat, effort: Int?
    let stat: PokemonSpecies?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - PokemonType
struct PokemonType: Codable, Identifiable {
    let id = UUID()
    let slot: Int?
    let type: PokemonSpecies?
}

