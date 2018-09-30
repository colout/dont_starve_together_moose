PrefabFiles = {
	"esctemplate",
	"esctemplate_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/esctemplate.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/esctemplate.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/esctemplate.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/esctemplate.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/esctemplate_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/esctemplate_silho.xml" ),

    Asset( "IMAGE", "bigportraits/esctemplate.tex" ),
    Asset( "ATLAS", "bigportraits/esctemplate.xml" ),
	
	Asset( "IMAGE", "images/map_icons/esctemplate.tex" ),
	Asset( "ATLAS", "images/map_icons/esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_esctemplate.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_esctemplate.xml" ),
	
	Asset( "IMAGE", "images/names_esctemplate.tex" ),
    Asset( "ATLAS", "images/names_esctemplate.xml" ),
	
    Asset( "IMAGE", "bigportraits/esctemplate_none.tex" ),
    Asset( "ATLAS", "bigportraits/esctemplate_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.esctemplate = "Moo The Moose"
STRINGS.CHARACTER_NAMES.esctemplate = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.esctemplate = "*Poos like a beefalo\n*Pees himself periodically\n*Has a nasty diet"
STRINGS.CHARACTER_QUOTES.esctemplate = "\"My name is moo.  I like to poo!\""

-- Custom speech strings
STRINGS.CHARACTERS.ESCTEMPLATE = require "speech_esctemplate"

-- The character's name as appears in-game 
STRINGS.NAMES.ESCTEMPLATE = "Moo"

AddMinimapAtlas("images/map_icons/esctemplate.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("esctemplate", "MALE")


-- Add MOO foodtype to allow poo eating
GLOBAL.FOODTYPE.MOO = "MOO"
GLOBAL.FOODGROUP.MOO = {
	name = "MOO",
	types = {
		GLOBAL.FOODTYPE.MEAT,
		GLOBAL.FOODTYPE.VEGGIE,
		GLOBAL.FOODTYPE.INSECT,
		GLOBAL.FOODTYPE.SEEDS,
		GLOBAL.FOODTYPE.GENERIC,
		GLOBAL.FOODTYPE.GOODIES,
		GLOBAL.FOODTYPE.MOO,
	},
}

-- Slips the code for edibility into poop prefab
AddPrefabPostInit("poop", function(inst)
	inst:AddComponent("edible")
	inst.components.edible.hungervalue = (1)
	inst.components.edible.sanityvalue = (5)
	inst.components.edible.healthvalue = (1)
	inst.components.edible.foodtype = "MOO"
end) 