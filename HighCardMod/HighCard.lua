--- STEAMODDED HEADER
--- MOD_NAME: High Card Mod
--- MOD_ID: HighCardMod
--- MOD_AUTHOR: [Kenny Stone]
--- MOD_DESCRIPTION: Create a deck that references the HighCard Franchise!
--- BADGE_COLOUR: AF843E
--- DISPLAY_NAME: HIGH CARD
--- PRIORITY: -28

----------------------------------------------
------------MOD CODE -------------------------

-- Config: DISABLE UNWANTED MODS HERE
local xplaying_config = {
    -- Decks
    XPlayingDeck = true,
    -- Jokers
    XPlayingJoker = true,
    -- Spade Family
    XPlayingSpade2 = true,
    XPlayingSpade3 = true,
    XPlayingSpade4 = true,
    XPlayingSpade5 = true,
    XPlayingSpade6 = true,
    XPlayingSpade7 = true,
    XPlayingSpade8 = true,
    XPlayingSpade9 = true,
    XPlayingSpade10 = true,
    XPlayingSpadeJ = true,
    XPlayingSpadeQ = true,
    XPlayingSpadeK = true,
    XPlayingSpadeA = true,
    -- Heart Family
    XPlayingHeart2 = true, 
    XPlayingHeart3 = true,
    XPlayingHeart4 = true,
    XPlayingHeart5 = true,
    XPlayingHeart6 = true,
    XPlayingHeart7 = true,
    XPlayingHeart8 = true,
    XPlayingHeart9 = true, 
    XPlayingHeart10 = true,
    XPlayingHeartJ = true,
    XPlayingHeartQ = true,
    XPlayingHeartK = true,
    XPlayingHeartA = true,
    -- Diamond Family
    XPlayingDiamond2 = true,
    XPlayingDiamond3 = true,
    XPlayingDiamond4 = true,
    XPlayingDiamond5 = true,
    XPlayingDiamond6 = true,
    XPlayingDiamond7 = true,
    XPlayingDiamond8 = true,
    XPlayingDiamond9 = true,
    XPlayingDiamond10 = true,
    XPlayingDiamondJ = true,
    XPlayingDiamondQ = true,
    XPlayingDiamondK = true,
    XPlayingDiamondA = true,
    -- Club Family
    XPlayingClub2 = true,
    XPlayingClub3 = true,
    XPlayingClub4 = true,
    XPlayingClub5 = true,
    XPlayingClub6 = true,
    XPlayingClub7 = true,
    XPlayingClub8 = true,
    XPlayingClub9 = true,
    XPlayingClub10 = true,
    XPlayingClubJ = true,
    XPlayingClubQ = true,
    XPlayingClubK = true,
    XPlayingClubA = true,
}

-- Create Jokers
local xplaying_jokers = {}
local xplaying_jokers_info = {
    XPlayingJoker = {
    	loc = {
	        name = "X-Playing Joker",
	        text = {
	            "If {C:attention}first hand{} of round",
	            "is {C:attention}High Card{}, turn that",
	            "into a {C:attention}X-Playing Card{} and",
	            "activate it after scoring.",
	        }, 
	        --[[
			text = {
	            "{C:red}PLAY{} {C:attention}first hand{} of round.",
	            "(Transform into the scoring",
	            "X-Playing card or X-hand)"
	        }, 
	        ]]--
	        card_eval = "PLAY!"
	    },
        ability_name = "HCM X-Play",
        slug = "hcm_xplay",
        ability = { extra = { placeholder = 1.0 } }
    },
    XPlayingSpade2 = {
    	loc = {
	        name = "Neo New Nambu",
	        text = {
	            "Gain {C:blue}+#1#{} Hand upon hand played, ",
	            "but you must play {C:attention}#3# cards{}",
	            "{C:attention}per hand{}, {C:attention}lose all discards{}",
	            "and set hand size to {C:attention}#2#{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Neo New Nambu!"
	    },
        ability_name = "HCM Neo New Nambu",
        slug = "hcm_neo_new_nambu",
        ability = { extra = { hand_gain = 1, hand_size = 6, hand_ge = 5, 
        			done = false} }
    },
    XPlayingSpade3 = {
    	loc = {
	        name = "Staff Master",
	        text = {
	            "If you score a {C:attention}Three of a Kind{}",
	            "with cards of {C:attention}#1# different suits{},",
	            "add a card of the {C:attention}missing suit{}",
	            "to make it {C:attention}Four of a Kind{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Extend!"
	    },
        ability_name = "HCM Staff Master",
        slug = "hcm_staff_master",
        ability = { extra = { done = false, suits_required = 3} }
    },
    XPlayingSpade4 = {
    	loc = {
	        name = "Clear Lance",
	        text = {
	            "If you play {C:attention}#1#{} cards and",
	            "score {C:attention}exactly #2#{} cards,",
	            "this card gives {X:mult,C:white}X#3#{} Mult. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Clear Lance!"
	    },
        ability_name = "HCM Clear Lance",
        slug = "hcm_clear_lance",
        ability = { extra = { card_play = 5, card_score = 4, Xmult = 4, 
        			done = false} }
    },
    XPlayingSpade5 = {
    	loc = {
	        name = "Brain Buster",
	        text = {
	            "If your {C:attention}highest scoring card{}",
	            "is higher than before, ",
	            "accumulate {X:mult,C:white}X#1#{} Mult until",
	            "end of round. {C:inactive}(Now {}{X:mult,C:white}X#2#{}{C:inactive}){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Brain Buster!"
	    },
        ability_name = "HCM Brain Buster",
        slug = "hcm_brain_buster",
        ability = { extra = { current_highest = 5, Xmult = 1, Xmult_acc = 1,
        			done = false} }
    },
    XPlayingSpade6 = {
    	loc = {
	        name = "Juggling Gun",
	        text = {
	            "Automatically plays your {C:attention}lowest{}",
	            "{C:attention}card held in hand{} in addition",
	            "to your selected cards for play.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Fire!"
	    },
        ability_name = "HCM Juggling Gun",
        slug = "hcm_juggling_gun",
        ability = { extra = { done = false} }
    },
    XPlayingSpade7 = {
    	loc = {
	        name = "Interceptor",
	        text = {
	            "Randomly {C:attention}enhance{} every scoring",
	            "cards before scoring, but ",
	            "{C:attention}remove all enhancements{} from ",
	            "scoring cards afterwards.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval_on = "Interceptor On!",
	        card_eval_off = "Interceptor Off!"
	    },
        ability_name = "HCM Interceptor",
        slug = "hcm_interceptor",
        ability = { extra = { done = false} }
    },
    XPlayingSpade8 = {
    	loc = {
	        name = "All Kaboom",
	        text = {
	            "Destroy the {C:attention}first scoring card{}",
	            "and all other scoring cards ",
	            "that are {C:attention}of the same suit{}. ",
	            "each destruction gives {C:mult}+#1#{} Mult. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        }, 
	        card_eval_pc = "Place Bomb..",
	        card_eval_jk = "All Kaboom!"
	    },
        ability_name = "HCM All Kaboom",
        slug = "hcm_all_kaboom",
        ability = { extra = { kaboom_mult = 5, mult_cnt = 0, kaboom_suit = nil, 
        			done = false} }
    },
    XPlayingSpade9 = {
    	loc = {
	        name = "Bokka",
	        text = {
	            "Remove {C:attention}debuff{}",
	            "from played cards.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Bokka!"
	    },
        ability_name = "HCM Bokka",
        slug = "hcm_bokka",
        ability = { extra = { done = false} }
    },
    XPlayingSpade10 = {
    	loc = {
	        name = "Honest Straight",
	        text = {
	            "Turn all scored cards",
	            "into a {C:attention}random{} scored card",
	            "{C:attention}after the scoring stage{}. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Honest Straight!",
	        card_eval_pc = "HIT!"
	    },
        ability_name = "HCM Honest Straight",
        slug = "hcm_honest_straight",
        ability = { extra = { transfer_card = nil, done = false} }
    },
    XPlayingSpadeJ = {
    	loc = {
	        name = "Marine Hunter",
	        text = {
	            "Scoring your {C:attention}most played hand{}",
	            "will add the {C:attention}number of times{}",
	            "{C:attention}this hand is played{} to {C:mult}mult{}.",
	            "{C:inactive}(Now Looking for{} {C:attention}#1#{}{C:inactive}...){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Marine Hunter!",
	    },
        ability_name = "HCM Marine Hunter",
        slug = "hcm_marine_hunter",
        ability = { extra = { mult_gain = 0, best_hand = "High Card", done = false} }
    },
    XPlayingSpadeQ = {
    	loc = {
	        name = "Typhoid Mary",
	        text = {
	            "After you play a hand,",
	            "{C:attention}replay{} that hand with {X:mult,C:white}X#1#{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Typhoid Mary!",
	    },
        ability_name = "HCM Typhoid Mary",
        slug = "hcm_typhoid_mary",
        ability = { extra = { Xmult = 0.5, done = false, bonus_hand = false, 
        			highlighted_cards = {}, indicator = false} }
    },
    XPlayingSpadeK = {
    	loc = {
	        name = "San Galgano",
	        text = {
	            "When you score any {C:attention}X-Playing Card{} as ",
	            "{C:attention}High Card{}, {C:red}consume{} the X-Playing Card",
	            "and {C:red}disable{} its transformation from ",
	            "all its replicas. Gain {X:mult,C:white}X#1#{} per card",
	            "consumed. {C:inactive}(Currently gives{} {X:mult,C:white}X#2#{} {C:inactive}){}",
	            "{C:red}Warning: This card has a mind of its own!{}"
	        },
	        card_eval_default = "Kneel before San Galgano!",
	        card_eval_awaken = "I AM AWAKENED!",
	        card_eval_return = "I WILL RETURN!",
	        card_eval_enter = "I HAVE RETURNED!",
	        card_eval_consume = "Your Power is Mine!",
	        card_eval_disabled = "The power was consumed!",
	        card_eval_hesitate_0 = "?!",
	        card_eval_hesitate_1 = "YOU DON'T WANT TO DO THIS!",
	        card_eval_hesitate_2 = "THINK TWICE!",
	        card_eval_hesitate_3 = "PLEASE DON'T...",
	        card_eval_sealed = "NO!!!",
	        card_eval = "San Galgano!",
	        card_eval_replace = "My Turn!",
	        card_eval_regenerate = "YOU CAN'T GET RID OF ME!",
	        card_eval_takeover = "THE THRONE IS MINE!"
	    },
        ability_name = "HCM San Galgano",
        slug = "hcm_san_galgano",
        ability = { extra = { Xmult = 1, Xmult_acc = 1, card_consumed = 0, hesitation = 0,
        			shown = false, joker_sliced = false, done = false} }
    },
    XPlayingSpadeA = {
    	loc = {
	        name = "Love & Peace",
	        text = {
	            "Give {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
	            "per card scored, but",
	            "{C:attention}force a card{} for each hand.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Love & Peace!"
	    },
        ability_name = "HCM Love and Peace",
        slug = "hcm_love_and_peace",
        ability = { extra = { chips_gain = 110, mult_gain = 11, discard_cnt = 0, 
        			done = false} }
    },
    XPlayingHeart2 = {
    	loc = {
	        name = "Jelly Crawler",
	        text = {
	            "Cards can be considered",
	            "{C:attention}1 rank lower{} if that helps",
	            "forming a better poker hand. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        }
	    },
        ability_name = "HCM Jelly Crawler",
        slug = "hcm_jelly_crawler",
        ability = { extra = { done = false} }
    },
    XPlayingHeart3 = {
    	loc = {
	        name = "Rockin' Rocks",
	        text = {
	            "Turning your first scoring card ",
	            "into {C:attention}Stone Card{}. Retriggers ",
	            "played {C:attention}Stone Card{} for {C:attention}#1# times{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Rockin' Rocks!"
	    },
        ability_name = "HCM Rockin Rocks",
        slug = "hcm_rockin_rocks",
        ability = { extra = { retrigger_cnt = 2, done = false} }
    },
    XPlayingHeart4 = {
    	loc = {
	        name = "Agent S",
	        text = {
	            "Retrigger the lowest",
	            "played card used in",
	            "scoring for {C:attention}#1# times{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Agent S!"
	    },
        ability_name = "HCM Agent S",
        slug = "hcm_agent_s",
        ability = { extra = { retrigger_cnt = 4, repeated = false, 
        			done = false} }
    },
    XPlayingHeart5 = {
    	loc = {
	        name = "Calorie's High",
	        text = {
	            "Gain {C:red}+#1#{} Discard upon ",
	            "card(s) discarded, but ",
	            "you only play {C:attention}#2# hand{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Calorie's High!"
	    },
        ability_name = "HCM Calories High",
        slug = "hcm_calories_high",
        ability = { extra = { discard_gain = 1, hand_play = 1, discard_cnt = 0, 
        			done = false} }
    },
    XPlayingHeart6 = {
    	loc = {
	        name = "The Zoo",
	        text = {
	            "Transform your scoring cards",
	            "to the {C:attention}leftmost{} scoring card",
	            "if they are of the same {C:attention}rank{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "The Zoo!",
	        card_eval_pc = "HIT!"
	    },
        ability_name = "HCM The Zoo",
        slug = "hcm_the_zoo",
        ability = { extra = { transfer_card = nil, done = false} }
    },
    XPlayingHeart7 = {
    	loc = {
	        name = "Chameleon",
	        text = {
	            "Convert {C:attention}suit{} of your",
	            "played cards to suit",
	            "of {C:attention}a random played card{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Chameleon!"
	    },
        ability_name = "HCM Chameleon",
        slug = "hcm_chameleon",
        ability = { extra = { done = false} }
    },
    XPlayingHeart8 = {
    	loc = {
	        name = "Mun Pheromone Mun",
	        text = {
	            "If you scored {C:attention}High Card{} is lower",
	            "than 8, increase its {C:attention}rank{} by 1;",
	            "if it's higher, decrease it by 1. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Mun!"
	    },
        ability_name = "HCM Mun Pheromone Mun",
        slug = "hcm_mun_pheromone_mun",
        ability = { extra = { done = false} }
    },
    XPlayingHeart9 = {
    	loc = {
	        name = "Marvelous Genius",
	        text = {
	            "If you finish the round in",
	            "{C:blue}1 hand{} after this card is",
	            "added, gain {C:attention}#1#{} {C:tarot}Tarot{} cards.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Marvelous Genius!"
	    },
        ability_name = "HCM Marvelous Genius",
        slug = "hcm_marvelous_genius",
        ability = { extra = { done = false, tarot_cnt = 2, hand_cnt = 0 } }
    },
    XPlayingHeart10 = {
    	loc = {
	        name = "Common Destiny",
	        text = {
	            "If you scoring hand contains",
	            "{C:attention}exactly #1# cards{}, this hand",
	            "is regarded as {C:attention}Five of A Kind{}. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Common Destiny!"
	    },
        ability_name = "HCM Common Destiny",
        slug = "hcm_common_destiny",
        ability = { extra = { done = false, chain_cnt = 5} }
    },
    XPlayingHeartJ = {
    	loc = {
	        name = "Sky Dancer",
	        text = {
	            "Scoring your {C:attention}most played hand{}",
	            "that's not High Card will",
	            "give a corresponding {C:planet}Planet{} card.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Sky Dancer!"
	    },
        ability_name = "HCM Sky Dancer",
        slug = "hcm_sky_dancer",
        ability = { extra = { done = false} }
    },
    XPlayingHeartQ = {
    	loc = {
	        name = "Sonic Move",
	        text = {
	            "Start a {C:attention}#1# second timer{}, ",
	            "{C:red}Lose the game when time is{}",
	            "{C:red}up{}. This card gives {X:mult,C:white}X#2#{}",
	            "{C:inactive}(Time left: #3#s){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Sonic Move!"
	    },
        ability_name = "HCM Sonic Move",
        slug = "hcm_sonic_move",
        ability = { extra = { done = false, timer_value = 60, timer = 60, Xmult = 12 } }
    },
    XPlayingHeartK = {
    	loc = {
	        name = "Masculine Parfait",
	        text = {
	            "Destroy all scoring {C:attention}face cards{} and add",
	            "{C:chips}+#1#{} chips and {C:mult}+#2#{} mult per card to {C:attention}both{}",
	            "{C:attention}this joker and the X-Playing Card{}.",
	            "{C:inactive}(Now gives {}{C:chips}+#3#{} chips, {C:mult}+#4#{} mult{C:inactive}){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Masculine Parfait!"
	    },
        ability_name = "HCM Masculine Parfait",
        slug = "hcm_masculine_parfait",
        ability = { extra = { done = false, transfer_card = nil, mult_gain = 5, 
        			chips_gain = 10, mult_acc = 0, chips_acc = 0} }
    },
    XPlayingHeartA = {
    	loc = {
	        name = "Faceless",
	        text = {
	            "If you play {C:attention}#1#{} or less cards, ",
	            "this will act like a",
	            "{C:attention}playing card{} that forms",
	            "a {C:attention}higher poker hand{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Faceless!"
	    },
        ability_name = "HCM Faceless",
        slug = "hcm_faceless",
        ability = { extra = { cards_limit = 4, fake_card = nil, 
        					insert_pos = 0, delete_pos = 0, faceless_trigger = false,
        			done = false} }
    },
    XPlayingDiamond2= {
    	loc = {
	        name = "Love Connection",
	        text = {
	            "Your poker hand played",
	            "is always considered to",
	            "have contained a {C:attention}Pair{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Love Connection!"
	    },
        ability_name = "HCM Love Connection",
        slug = "hcm_love_connection",
        ability = { extra = { done = false} }
    },
    XPlayingDiamond3= {
    	loc = {
	        name = "Marble Rumble",
	        text = {
	            "Turn your {C:attention}scoring hand{}",
	            "into {C:attention}Glass Card{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Marble Rumble!"
	    },
        ability_name = "HCM Marble Rumble",
        slug = "hcm_marble_rumble",
        ability = { extra = { done = false} }
    },
    XPlayingDiamond4= {
    	loc = {
	        name = "Musical Alchemist",
	        text = {
	            "Add a {C:attention}Wildcard 4{} to play if",
	            "you played {C:attention}exactly #1# cards{}",
	            "and this helps to form {C:attention}Flush{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Musical Alchemist!"
	    },
        ability_name = "HCM Musical Alchemist",
        slug = "hcm_musical_alchemist",
        ability = { extra = { required_cnt = 4, done = false} }
    },
    XPlayingDiamond5= {
    	loc = {
	        name = "Greatest Man",
	        text = {
	            "If your {C:attention}scoring poker{} is higher",
	            "than your round best, upgrade",
	            "level of played {C:attention}poker hand{}.",
	            "{C:inactive}(Current best is {}{C:attention}#1#{}{C:inactive}){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Evolve!"
	    },
        ability_name = "HCM Greatest Man",
        slug = "hcm_greatest_man",
        ability = { extra = { done = false, best_hand = "High Card"} }
    },
    XPlayingDiamond6= {
    	loc = {
	        name = "13 Stairs",
	        text = {
	            "If you have scored {C:red}exactly{}",
	            "{C:red}#1#{} cards this round, ",
	            "{C:attention}-#2# Ante{}. {C:inactive}({}{C:red}#3#{} {C:inactive}cards scored){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "13 Stairs!"
	    },
        ability_name = "HCM 13 Stairs",
        slug = "hcm_13_stairs",
        ability = { extra = { stairs = 13, ante_mod = 1, scored_cards = 1, 
        			done = false} }
    },
    XPlayingDiamond7= {
    	loc = {
	        name = "Never No Dollars",
	        text = {
	            "Spend up to {C:attention}#1#{} dollars,",
	            "add that amount to {C:mult}Mult{}",
	            "and {X:chips,C:white}X#2#{} that amount to {C:chips}Chips{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval_on = "Never No Dollars!",
	        card_eval_off = "No Dollar :("
	    },
        ability_name = "HCM Never No Dollars",
        slug = "hcm_never_no_dollars",
        ability = { extra = { max_money = 20, chip_mult = 10, done = false} }
    },
    XPlayingDiamond8= {
    	loc = {
	        name = "Red Labyrinth",
	        text = {
	            "Selling consumeables will not earn",
	            "dollars, but will spend {C:attention}#1# dollar{}",
	            "and get a {C:attention}random consumeable of{}",
	            "{C:attention}the same type{} if you have dollars.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Red Labyrinth!"
	    },
        ability_name = "HCM Red Labyrinth",
        slug = "hcm_red_labyrinth",
        ability = { extra = {reroll_cost = 1, done = false} }
    },
    XPlayingDiamond9= {
    	loc = {
	        name = "No Mercy",
	        text = {
	            "If you play {C:attention}5 cards{} of",
	            "{C:attention}distinctive ranks{}, this card",
	            "accumulate {C:mult}+#1#{} mult; Otherwise",
	            "{C:attention}lose all mult accumulated{}",
	            "and set your {C:blue}hand{} to {C:blue}0{}. ",
	            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
	            --"Otherwise, you {C:red}lose the game instantly{}.",
	            "This X-Playing card is {C:attention}eternal{}."
	        },
	        card_eval = "No Mercy!",
	        card_eval_mercy = "Absorb.."
	    },
        ability_name = "HCM No Mercy",
        slug = "hcm_no_mercy",
        ability = { extra = {done = false, mult_gain = 9, mult_acc = 0, reset = false} }
    },
    XPlayingDiamond10= {
    	loc = {
	        name = "Unlucky Poky",
	        text = {
	            "All {C:green,E:1,S:1.1}probabilities{} become",
	            "{C:green,E:1,S:1.1}deterministic{} (always trigger)",
	            "during the scoring stage.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Unlucky Poky!"
	    },
        ability_name = "HCM Unlucky Poky",
        slug = "hcm_unlucky_poky",
        ability = { extra = {done = false} }
    },
    XPlayingDiamondJ= {
    	loc = {
	        name = "Out of Five",
	        text = {
	            "{C:attention}High Card{} poker hand will",
	            "score as your {C:attention}most played{}",
	            "{C:attention}hand{} that's not High Card.",
	            "{C:inactive}(Now it's{} {C:attention}#1#{}{C:inactive}...){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Out of Five!"
	    },
        ability_name = "HCM Out of Five",
        slug = "hcm_out_of_five",
        ability = { extra = { best_hand = "Nothing else", msg_on = false, shown = false,
        			done = false} }
    },
    XPlayingDiamondQ= {
    	loc = {
	        name = "Balor",
	        text = {
	            "Gains a {C:spectral}vision{} that shows",
	            "cards in deck {C:attention}in the order{}",
	            "{C:attention}of which they will be drawn.{}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Balor Vision",
	        card_explained = "Cards will be drawn from left to right!"
	    },
        ability_name = "HCM Balor",
        slug = "hcm_balor",
        ability = { extra = { done = false} }
    },
    XPlayingDiamondK= {
    	loc = {
	        name = "Round & Round",
	        text = {
	            "If your scoring hand contains",
	            "{C:attention}#1#{} scoring cards, {C:purple}balance{}",
	            "your {C:chips}chips{} and {C:mult}mult{} and",
	            "{C:attention}destroy{} all scoring cards.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Round & Round!"
	    },
        ability_name = "HCM Round and Round",
        slug = "hcm_round_and_round",
        ability = { extra = { required_cnt = 5, required_sat = false, done = false} }
    },
    XPlayingDiamondA= {
    	loc = {
	        name = "Dynamic Kinesis",
	        text = {
	            "If your played hand is",
	            "{C:attention}exactly #1# card{}, retrigger",
	            "this card {C:attention}#2# times{}. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Dynamic Kinesis!"
	    },
        ability_name = "HCM Dynamic Kinesis",
        slug = "hcm_dynamic_kinesis",
        ability = { extra = { retrigger_cnt = 5, required_cnt = 1, repeated = false, done = false} }
    },
    XPlayingClub2= {
    	loc = {
	        name = "Metallical Parade",
	        text = {
	            "{X:mult,C:white}X#1#{} per {C:attention}Steel Card{} or",
	            "{C:attention}Gold Card{} played when scored.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Metallical Parade!",
	        card_eval_pc = "Metal!",
	    },
        ability_name = "HCM Metallical Parade",
        slug = "hcm_metallical_parade",
        ability = { extra = { Xmult = 1.5, done = false} }
    },
    XPlayingClub3= {
    	loc = {
	        name = "Green Green",
	        text = {
	            "Your poker hand played",
	            "is always considered",
	            "{C:red}only{} as {C:attention}Straight{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Green Green!"
	    },
        ability_name = "HCM Green Green",
        slug = "hcm_green_green",
        ability = { extra = { done = false} }
    },
    XPlayingClub4= {
    	loc = {
	        name = "Wing Wind",
	        text = {
	            "Your {C:attention}Gold{}, {C:blue}Blue{} and {C:purple}Purple{} Seals",
	            "can all trigger upon {C:attention}scoring{},",
	            "{C:attention}discard{} or {C:attention}held at end of round{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Wing Wind!"
	    },
        ability_name = "HCM Wing Wind",
        slug = "hcm_wing_wind",
        ability = { extra = { done = false} }
    },
    XPlayingClub5= {
    	loc = {
	        name = "G Round",
	        text = {
	            "When {C:attention}Stone Cards{} are played,",
	            "gain {C:mult}+#1#{} Mult each for this",
	            "round and {C:attention}destroy{} them.",
	            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval_pc = "Stomp!",
	        card_eval_jk = "G Round!"
	    },
        ability_name = "HCM G Round",
        slug = "hcm_g_round",
        ability = { extra = { mult_gain = 5, mult_acc = 0, done = false} }
    },
    XPlayingClub6= {
    	loc = {
	        name = "Eye of the Storm",
	        text = {
	            "All scoring cards whose rank",
	            "is equal to the {C:attention}average{}",
	            "{C:attention}scoring rank of this hand{}",
	            "permanently gains {C:chips}+#1#{} chips.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Vortex!"
	    },
        ability_name = "HCM Eye of the Storm",
        slug = "hcm_eye_of_the_storm",
        ability = { extra = { chips_gain = 6, current_average = 0, done = false} }
    },
    XPlayingClub7= {
    	loc = {
	        name = "Lethal Scoville",
	        text = {
	            "If your scoring hand {C:attention}lit{}",
	            "{C:attention}the fire{}, gain a random",
	            "{C:spectral}Spectral{} card.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "PLAY FOR THE FIRE!"
	    },
        ability_name = "HCM Lethal Scoville",
        slug = "hcm_lethal_scoville",
        ability = { extra = { done = false} }
    },
    XPlayingClub8= {
    	loc = {
	        name = "Sinking Shadow",
	        text = {
	            "Cards that are played but",
	            "did not score add their",
	            "{C:attention}base{} {C:chips}chips{} to {C:mult}mult{} instead.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval_pc = "Shadow..",
	        card_eval_jk = "Sinking Shadow!"
	    },
        ability_name = "HCM Sinking Shadow",
        slug = "hcm_sinking_shadow",
        ability = { extra = { mult_gain = 0, done = false} }
    },
    XPlayingClub9= {
    	loc = {
	        name = "Chlorophyll Overgrown",
	        text = {
	            "Any poker hand played is",
	            "considered as played {C:attention}#1#{}",
	            "times in the {C:attention}record book{}. ",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Chlorophyll Overgrown"
	    },
        ability_name = "HCM Chlorophyll Overgrown",
        slug = "hcm_chlorophyll_overgrown",
        ability = { extra = { number_gain = 3, done = false} }
    },
    XPlayingClub10= {
    	loc = {
	        name = "Million Volt",
	        text = {
	            "{C:attention}Steel{} Card will also act",
	            "like {C:attention}Gold{} Card and {C:attention}vice versa{}.",
	            "{C:red}(Only for {}{C:attention}enhancement{} {C:red}effects){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval_pc = "Conductive!",
	        card_eval_jk = "Million Volt!"
	    },
        ability_name = "HCM Million Volt",
        slug = "hcm_million_volt",
        ability = { extra = { h_dollars = 3, h_x_mult = 1.5, done = false} }
    },
    XPlayingClubJ= {
    	loc = {
	        name = "Coming Home",
	        text = {
	            "After playing hand or discard,",
	            "you always draw cards that",
	            "form your {C:attention}most played hand{}. ",
	            "{C:inactive}(Now Looking for{} {C:attention}#1#{}{C:inactive}...){}",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Coming Home!"
	    },
        ability_name = "HCM Coming Home",
        slug = "hcm_coming_home",
        ability = { extra = { best_hand = "High Card", done = false} }
    },
    XPlayingClubQ= {
    	loc = {
	        name = "Punker Viper",
	        text = {
	            "{C:attention}Shuffle{} all cards played or ",
	            "discarded {C:attention}back to the deck{}",
	            "{C:attention}after you play a hand{}.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Punker Viper!"
	    },
        ability_name = "HCM Punker Viper",
        slug = "hcm_punker_viper",
        ability = { extra = { best_hand = "High Card", done = false} }
    },
    XPlayingClubK= {
    	loc = {
	        name = "Reaper's Hand",
	        text = {
	            "After playing a hand, destroy",
	            "all scoring cards and gain their",
	            "{C:chips}chips{}, {C:mult}mult{} and {C:attention}enhancement{}.",
	            "{C:inactive}({}{C:chips}+#1#{} chips, {C:mult}+#2#{} mult, {X:mult,C:white}X#3#{} mult",
	            "and {C:attention}+#4#{} gold at end of round{C:inactive}){}",
	            "This X-Playing card is {C:attention}eternal{}."
	        },
	        card_eval_lm = "Lucky Mult!",
	        card_eval_ld = "Lucky Dollars!",
	        card_eval_st = "Shattered!",
	        card_eval_pc = "Reap!",
	        card_eval_jk = "Reaper's Hand!"
        },
        ability_name = "HCM Reapers Hand",
        slug = "hcm_reapers_hand",
        ability = { extra = { chips_gain = 0, mult_gain = 0, xmult_gain = 1,
                            steel_cnt = 0, gold_cnt = 0, lucky_cnt = 0,
                            glass_cnt = 0, gseal = 0, rseal = 0, bseal = 0,
                    done = false} }
    },
    XPlayingClubA= {
    	loc = {
	        name = "Life Binder",
	        text = {
	            "If your scoring hand contains {C:attention}exactly{}",
	            "{C:attention}#1# cards{} and they are of the same",
	            "{C:attention}enhancement{}, add an {C:clubs}Ace of Clubs{}",
	            "with that enhancement to your hand.",
	            "When round ends, transform",
	            "back to the {C:attention}X-Playing Card{}."
	        },
	        card_eval = "Life Binder!",
	        card_eval_pc = "Create!"
	    },
        ability_name = "HCM Life Binder",
        slug = "hcm_life_binder",
        ability = { extra = { done = false, cards_required = 5} }
    },
}
local xplaying_deck_info = {name = "X-Playing Deck",
					        text = {
					            "Start run as a {C:red}Player{}",
					            "(i.e. Start with {C:attention}52{}",
					            "{C:attention}X-Playing Cards{} and",
					            "the {C:attention}X-Playing Joker{})"
					        }}

local faceless_trigger = true
local hcm_flamed = false
local hcm_has_sq = false 
local hcm_sq = nil

local x_sprite_info = {
	-- Spade Family
	XPlayingSpade2 = {name = "Neo New Nambu", pos = {x=0,y=0}, atlas = "m_hcm_neo_new_nambu"},
	XPlayingSpade3 = {name = "Staff Master", pos = {x=0,y=0}, atlas = "m_hcm_staff_master"},
	XPlayingSpade4 = {name = "Clear Lance", pos = {x=0,y=0}, atlas = "m_hcm_clear_lance"},
	XPlayingSpade5 = {name = "Brain Buster", pos = {x=0,y=0}, atlas = "m_hcm_brain_buster"},
	XPlayingSpade6 = {name = "Juggling Gun", pos = {x=0,y=0}, atlas = "m_hcm_juggling_gun"},
	XPlayingSpade7 = {name = "Interceptor", pos = {x=0,y=0}, atlas = "m_hcm_interceptor"},
	XPlayingSpade8 = {name = "All Kaboom", pos = {x=0,y=0}, atlas = "m_hcm_all_kaboom"},
	XPlayingSpade9 = {name = "Bokka", pos = {x=0,y=0}, atlas = "m_hcm_bokka"},
	XPlayingSpade10 = {name = "Honest Straight", pos = {x=0,y=0}, atlas = "m_hcm_honest_straight"},
	XPlayingSpadeJ = {name = "Marine Hunter", pos = {x=0,y=0}, atlas = "m_hcm_marine_hunter"},
	XPlayingSpadeQ = {name = "Typhoid Mary", pos = {x=0,y=0}, atlas = "m_hcm_typhoid_mary"},
	XPlayingSpadeK = {name = "San Galgano", pos = {x=0,y=0}, atlas = "m_hcm_san_galgano"},
	XPlayingSpadeA = {name = "Love & Peace", pos = {x=0,y=0}, atlas = "m_hcm_love_and_peace"},
	-- Heart Family
    XPlayingHeart2 = {name = "Jelly Crawler", pos = {x=0,y=0}, atlas = "m_hcm_jelly_crawler"}, 
    XPlayingHeart3 = {name = "Rockin' Rocks", pos = {x=0,y=0}, atlas = "m_hcm_rockin_rocks"},
    XPlayingHeart4 = {name = "Agent S", pos = {x=0,y=0}, atlas = "m_hcm_agent_s"},
    XPlayingHeart5 = {name = "Calorie's High", pos = {x=0,y=0}, atlas = "m_hcm_calories_high"},
    XPlayingHeart6 = {name = "The Zoo", pos = {x=0,y=0}, atlas = "m_hcm_the_zoo"},
    XPlayingHeart7 = {name = "Chameleon", pos = {x=0,y=0}, atlas = "m_hcm_chameleon"},
    XPlayingHeart8 = {name = "Mun Pheromone Mun", pos = {x=0,y=0}, atlas = "m_hcm_mun_pheromone_mun"},
    XPlayingHeart9 = {name = "Marvelous Genius", pos = {x=0,y=0}, atlas = "m_hcm_marvelous_genius"}, 
    XPlayingHeart10 = {name = "Common Destiny", pos = {x=0,y=0}, atlas = "m_hcm_common_destiny"},
    XPlayingHeartJ = {name = "Sky Dancer", pos = {x=0,y=0}, atlas = "m_hcm_sky_dancer"},
    XPlayingHeartQ = {name = "Sonic Move", pos = {x=0,y=0}, atlas = "m_hcm_sonic_move"},
    XPlayingHeartK = {name = "Masculine Parfait", pos = {x=0,y=0}, atlas = "m_hcm_masculine_parfait"},
    XPlayingHeartA = {name = "Faceless", pos = {x=0,y=0}, atlas = "m_hcm_faceless"},
    -- Diamond Family
    XPlayingDiamond2 = {name = "Love Connection", pos = {x=0,y=0}, atlas = "m_hcm_love_connection"},
    XPlayingDiamond3 = {name = "Marble Rumble", pos = {x=0,y=0}, atlas = "m_hcm_marble_rumble"},
    XPlayingDiamond4 = {name = "Musical Alchemist", pos = {x=0,y=0}, atlas = "m_hcm_musical_alchemist"},
    XPlayingDiamond5 = {name = "Greatest Man", pos = {x=0,y=0}, atlas = "m_hcm_greatest_man"},
    XPlayingDiamond6 = {name = "13 Stairs", pos = {x=0,y=0}, atlas = "m_hcm_13_stairs"},
    XPlayingDiamond7 = {name = "Never No Dollars", pos = {x=0,y=0}, atlas = "m_hcm_never_no_dollars"},
    XPlayingDiamond8 = {name = "Red Labyrinth", pos = {x=0,y=0}, atlas = "m_hcm_red_labyrinth"},
    XPlayingDiamond9 = {name = "No Mercy", pos = {x=0,y=0}, atlas = "m_hcm_no_mercy"},
    XPlayingDiamond10 = {name = "Unlucky Poky", pos = {x=0,y=0}, atlas = "m_hcm_unlucky_poky"},
    XPlayingDiamondJ = {name = "Out of Five", pos = {x=0,y=0}, atlas = "m_hcm_out_of_five"},
    XPlayingDiamondQ = {name = "Balor", pos = {x=0,y=0}, atlas = "m_hcm_balor"},
    XPlayingDiamondK = {name = "Round & Round", pos = {x=0,y=0}, atlas = "m_hcm_round_and_round"},
    XPlayingDiamondA = {name = "Dynamic Kinesis", pos = {x=0,y=0}, atlas = "m_hcm_dynamic_kinesis"},
    -- Club Family
    XPlayingClub2 = {name = "Metallical Parade", pos = {x=0,y=0}, atlas = "m_hcm_metallical_parade"},
    XPlayingClub3 = {name = "Green Green", pos = {x=0,y=0}, atlas = "m_hcm_green_green"},
    XPlayingClub4 = {name = "Wing Wind", pos = {x=0,y=0}, atlas = "m_hcm_wing_wind"},
    XPlayingClub5 = {name = "G Round", pos = {x=0,y=0}, atlas = "m_hcm_g_round"},
    XPlayingClub6 = {name = "Eye of the Storm", pos = {x=0,y=0}, atlas = "m_hcm_eye_of_the_storm"},
    XPlayingClub7 = {name = "Lethal Scoville", pos = {x=0,y=0}, atlas = "m_hcm_lethal_scoville"},
    XPlayingClub8 = {name = "Sinking Shadow", pos = {x=0,y=0}, atlas = "m_hcm_sinking_shadow"},
    XPlayingClub9 = {name = "Chlorophyll Overgrown", pos = {x=0,y=0}, atlas = "m_hcm_chlorophyll_overgrown"},
    XPlayingClub10 = {name = "Million Volt", pos = {x=0,y=0}, atlas = "m_hcm_million_volt"},
    XPlayingClubJ = {name = "Coming Home", pos = {x=0,y=0}, atlas = "m_hcm_coming_home"},
    XPlayingClubQ = {name = "Punker Viper", pos = {x=0,y=0}, atlas = "m_hcm_punker_viper"},
    XPlayingClubK = {name = "Reaper's Hand", pos = {x=0,y=0}, atlas = "m_hcm_reapers_hand"},
    XPlayingClubA = {name = "Life Binder", pos = {x=0,y=0}, atlas = "m_hcm_life_binder"},
}

local hcm_colour = {0.68627450980392, 0.51764705882353, 0.24313725490196, 1}

local hcm_colour_mult = {0.99607843137255, 0.37254901960784, 0.33333333333333, 1}

local hcm_colour_spade = {0.25098039215686, 0.22352941176471, 0.58431372549020, 1}
local hcm_colour_heart = {0.94117647058824, 0.20392156862745, 0.3921568627451, 1}
local hcm_colour_diamond = {0.00000000000000, 0.47058823529412, 0.73725490196078, 1}
local hcm_colour_club = {0.00000000000000, 0.36862745098039, 0.05490196078431, 1}

local x_playing_loc = {
	name = "X-Playing Card", 
	text = {
		"If your first hand",
		"of the round scores",
		"this as High Card,",
        "transform to its joker!",
    }, 
    text_coloured = {
		{{"If your ", G.C.UI.TEXT_DARK}, {"first hand", G.C.FILTER}},
		{{"of the round scores", G.C.UI.TEXT_DARK}},
		{{"this as ", G.C.UI.TEXT_DARK}, {"High Card,", G.C.FILTER}},
        {{"transform to its joker!", G.C.UI.TEXT_DARK}},
    }, 
    --[[
	text_clear = {
		"If your {C:attention}first hand{}",
		"of the round is",
		"{C:attention}High Card{} of this,",
        "{C:red}PLAY{} this X-Playing Card!",
    }, 
    ]]--
}

local hcm_misc_loc = {
	extra_mult=" extra mult",
	hcm_disabled="Power Disabled",
}

local hcm_cursed_desc = {
	text_coloured = {
		--"X-Playing Card"
		{{"The", G.C.UI.TEXT_DARK}, {" SOUL", G.C.SECONDARY_SET.Spectral}, {" of", G.C.UI.TEXT_DARK}},
		{{"San Galgano", G.C.SUITS.Spades}},
		{{"was", G.C.UI.TEXT_DARK}, {" AWAKENED", G.C.RED}, {"!", G.C.UI.TEXT_DARK}},
    }, 
}

local hcm_lowlight_loc = {
	--name = "Low Light Cigarette Pack",
	name = "Cigarette Pack...?",
	text = {
		"Choose {C:attention}1{} of up to",
      	"{C:attention}3{C:attention} X-Playing Cards{} to",
      	"add to your deck"
	},
	text_coloured = {
		{{"Choose", G.C.UI.TEXT_DARK}, {" 1", G.C.FILTER}, {" of up to", G.C.UI.TEXT_DARK}, {" 3", G.C.FILTER}}, 
		{{"X-Playing Cards", G.C.FILTER}, {" to", G.C.UI.TEXT_DARK}},
		{{"add to your deck", G.C.UI.TEXT_DARK}},
    }, 
    short = "Cigarette Pack"
}

function hcm_deep_cpy(original)
    local copy = {}
    for key, value in pairs(original) do
        -- Check if the value is a table
        if type(value) == "table" then
            -- If the value is a table, recursively call deepCopy
            copy[key] = hcm_deep_cpy(value)
        else
            -- If the value is not a table, simply copy it
            copy[key] = value
        end
    end
    return copy
end

-- Initialize deck effect
local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    Backapply_to_runRef(arg_56_0)

    -- High Card Deck
    if arg_56_0.effect.config.XPlayingDeck then
        G.E_MANAGER:add_event(Event({
            func = function()
            	-- Loop over all cards
                for i = #G.playing_cards, 1, -1 do
                    -- Convert all to xplaying cards
                    local xkey = hcm_determine_xplaying_key(G.playing_cards[i])
                    if x_sprite_info[xkey] and xplaying_config[xkey] then
                        G.playing_cards[i]:set_x_playing(xkey)
                    end
                end
                -- Add X-playing Joker
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_hcm_xplay', nil)
                card:set_edition(nil, nil, true)
                card:add_to_deck()
                G.jokers:emplace(card)
                return true
            end
        }))
    end
end

function hcm_san_galgano_dialogue(jkr, cmd)
	if cmd == nil then return false end
	local command_map = {
		awaken="card_eval_awaken",
		exit="card_eval_return",
		consume="card_eval_consume",
		disabled="card_eval_disabled",
		sealed="card_eval_sealed",
		hesitate_1="card_eval_hesitate_1",
		hesitate_2="card_eval_hesitate_2",
		hesitate_3="card_eval_hesitate_3",
		replace="card_eval_replace",
		regenerate="card_eval_regenerate",
		takeover="card_eval_takeover",
	}
	G.E_MANAGER:add_event(Event({
		func = function()
			local cmd_key = command_map[cmd]
			if cmd == "hesitate" and jkr then 
				jkr.ability.extra.hesitation = jkr.ability.extra.hesitation + 1
				cmd_key = command_map[cmd.."_"..jkr.ability.extra.hesitation]
			end
			if cmd_key == nil then cmd_key = "card_eval_default" end
			local text = G.localization.descriptions["Joker"]["j_hcm_san_galgano"][cmd_key]
	        play_sound('gong', 0.94, 0.3)
	        play_sound('gong', 0.94*1.5, 0.2)
	        play_sound('tarot1', 1.5)
    		attention_text({
                scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
            })
            return true
		end 
	}))
end

local get_badge_colour_OG = get_badge_colour

function get_badge_colour(key)
    if key == "xplaying" then return hcm_colour end
    return get_badge_colour_OG(key)
end

--[[
local generate_UIBox_ability_table_OG = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local table_ui = generate_UIBox_ability_table_OG(self)
    for k, v in pairs(table_ui) do
    	sendInfoMessage("Found: "..k)
	end
	--sendInfoMessage(table_ui.card_type)
	--if not next(table_ui.type) then sendInfoMessage("There's nothing!") end
	--sendNestedMessage(table_ui.name)
	sendInfoMessage("==================================================")
	--sendNestedMessage(table_ui.main)
    return table_ui
end
]]--


local card_h_popup_OG = G.UIDEF.card_h_popup

function G.UIDEF.card_h_popup(card)

	if card.config.center == G.P_CENTERS.m_stone then card.xability = nil end
	
	if card.ability and card.ability.set == "Booster" then 
		sendInfoMessage("Booster!") 
		for k, v in pairs(card.ability) do 
			sendInfoMessage("Ability: "..k)
		end
		sendInfoMessage(card.ability.name)

		if card.ability.name == "Low Light Cigarette Pack" then

			if card.ability_UIBox_table and 
			   card.ability_UIBox_table.name then
			   	sendInfoMessage("Changed!")
			   	card.ability_UIBox_table.name = localize{type = 'name', set = 'Other', key = "p_lowlight_normal", nodes = card.ability_UIBox_table.name}
			   	--card.ability_UIBox_table.name[1].config.object.string = hcm_lowlight_loc.name
			   	
			end
			if card.ability_UIBox_table and 
			   card.ability_UIBox_table.main then 
			   	local new_main = {}
				for k, v in ipairs(hcm_lowlight_loc.text_coloured) do
					new_main[#new_main + 1] = {}
					for i, _ in ipairs(v) do
						new_main[#new_main][i]={ 
			              	n=G.UIT.T,
			              	config={
			                	text = v[i][1],
			                	colour = v[i][2],
			                	scale = 0.32*G.LANG.font.DESCSCALE
			                },
			        	}
			        end
			        card.ability_UIBox_table.main = new_main
				end
				sendInfoMessage("main changed!")
			end
		end
	end
	
	
	if card.xability then 
		card.ability_UIBox_table.badges.xplaying = nil
		if card.ability_UIBox_table.badges and card.ability_UIBox_table.badges.xplaying == nil then
			--badge
			card.ability_UIBox_table.badges[#card.ability_UIBox_table.badges + 1] = "xplaying"
			--tooltip
			local tool_tip = {}
			for k, v in ipairs(x_playing_loc.text_coloured) do
				tool_tip[#tool_tip + 1] = {}
				for i, _ in ipairs(v) do
					tool_tip[#tool_tip][i]={ 
		              	n=G.UIT.T,
		              	config={
		                	text = v[i][1],
		                	colour = v[i][2],
		                	scale = 0.32*G.LANG.font.DESCSCALE
		                },
		        	}
		        end
			end
			tool_tip["name"] = x_playing_loc.name
			card.ability_UIBox_table.info[#card.ability_UIBox_table.info+1] = tool_tip
			--name
			card.ability_UIBox_table.name = {
				--card.ability_UIBox_table.name[1],
				card.ability_UIBox_table.name[#card.ability_UIBox_table.name]
			}
			card.ability_UIBox_table.name[#card.ability_UIBox_table.name].config.text = card.xability.name
			local xcolour = hcm_determine_xplaying_colour(card)
			if xcolour then card.ability_UIBox_table.name[#card.ability_UIBox_table.name].config.colour = xcolour end
			--sendNestedMessage(card.ability_UIBox_table.name[#card.ability_UIBox_table.name].config.colour)
			local xcard_name = hcm_determine_xplaying_key(card)
			if xcard_name == "XPlayingHeartK" then 
				sendNestedMessage(card.ability_UIBox_table.main)
				sendInfoMessage(#card.ability_UIBox_table.main)
				if card.ability and card.ability.perma_mult and not card.debuff then
					local extra_mult = hcm_deep_cpy(card.ability_UIBox_table.main[1])
					if next(extra_mult) then
						if extra_mult[1] then
							extra_mult[1].config.colour = hcm_colour_mult
							extra_mult[1].config.text = "+"..tostring(card.ability.perma_mult)
						end
						if extra_mult[2] then
							extra_mult[2].config.text = hcm_misc_loc["extra_mult"]
						end
					end
					if card.ability_UIBox_table.main[#card.ability_UIBox_table.main][2].config.text == hcm_misc_loc["extra_mult"] then
					else card.ability_UIBox_table.main[#card.ability_UIBox_table.main + 1] = extra_mult end
				end
			end
			if xcard_name == "XPlayingSpadeK" and G.GAME.hcm_san_galgano then
				local cursed_text = {}
				for k, v in ipairs(hcm_cursed_desc.text_coloured) do
					cursed_text[#cursed_text + 1] = {}
					for i, _ in ipairs(v) do
						cursed_text[#cursed_text][i]={ 
			              	n=G.UIT.T,
			              	config={
			                	text = v[i][1],
			                	colour = v[i][2],
			                	scale = 0.32*G.LANG.font.DESCSCALE
			                },
			        	}
			        end
				end
				card.ability_UIBox_table.main = cursed_text
			end
			if G.GAME.hcm_san_galgano or xcard_name == "XPlayingSpadeK" then
				if G.GAME.hcm_disabled and G.GAME.hcm_disabled[xcard_name] then
					local cursed_text = hcm_deep_cpy(card.ability_UIBox_table.main[1])
					cursed_text[1].config.colour = G.C.SUITS.Spades
					cursed_text[1].config.text = hcm_misc_loc["hcm_disabled"]
					table.remove(cursed_text, 2)
					if card.ability_UIBox_table.main[#card.ability_UIBox_table.main][1].config.text == hcm_misc_loc["hcm_disabled"] then
					else card.ability_UIBox_table.main[#card.ability_UIBox_table.main + 1] = cursed_text end
				end
			end
		end
	end
	local popup = card_h_popup_OG(card)
	return popup
end

local set_ability_OG = Card.set_ability

function Card:set_ability(center, initial, delay_sprites)
	local perma_mult = nil
	local xability = nil
	if self.ability and self.ability.perma_mult then perma_mult = self.ability.perma_mult end
	if self.xability then xability = self.xability.handname end
	set_ability_OG(self, center, initial, delay_sprites)
	if self.ability and perma_mult then self.ability.perma_mult = perma_mult end
	if xability and self.config.center ~= G.P_CENTERS.m_stone then self:set_x_playing(xability) end
end

function Card:set_x_playing(hand_name)
	-- Front:
    if self.children.front then
    	--sendInfoMessage("Hits Front")
        self.children.front.atlas = G.ASSET_ATLAS[x_sprite_info[hand_name].atlas]
        self.children.front:set_sprite_pos(x_sprite_info[hand_name].pos)
    else
    	--sendInfoMessage("Didn't hit front")
        self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[x_sprite_info[hand_name].atlas], x_sprite_info[hand_name].pos)
        self.children.front.states.hover = self.states.hover
        self.children.front.states.click = self.states.click
        self.children.front.states.drag = self.states.drag
        self.children.front.states.collide.can = false
        self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
    end

    -- Back:
    self.children.back = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["b_xplaying"], {x = 0, y = 0})
    self.children.back.states.hover = self.states.hover
    self.children.back.states.click = self.states.click
    self.children.back.states.drag = self.states.drag
    self.children.back.states.collide.can = false
    self.children.back:set_role({major = self, role_type = 'Glued', draw_major = self})

    self.name = x_sprite_info[hand_name].name
    self.xability = {
        name = x_sprite_info[hand_name].name,
        handname = hand_name,
        set = "XPlaying",
        atlas = x_sprite_info[hand_name].atlas
    }
end

local card_save_OG = Card.save
function Card:save()
    cardTable = card_save_OG(self)
    if self.config.center == G.P_CENTERS.m_stone then self.xability = nil end
    if self.xability then cardTable["xability"] = self.xability end
    return cardTable
end

local card_load_OG = Card.load
function Card:load(cardTable, other_card)
    card_load_OG(self, cardTable, other_card)
    if cardTable.xability then 
    	self.xability = cardTable.xability 
    	self:set_x_playing(hcm_determine_xplaying_key(self))
    end
end

-- X-Playing Mechanics
function xplay(hand_name, card_info)
	if not xplaying_config[hand_name] then return false end
	local num_disabled = 0
	if G.GAME.hcm_disabled then
		if G.GAME.hcm_disabled[hand_name] then 
			sendInfoMessage("X Play Disabled!")
			return true
		end 
		for k, v in pairs(G.GAME.hcm_disabled) do 
			num_disabled = num_disabled + 1
		end
	end
	if G.GAME.hcm_san_galgano and hand_name ~= "XPlayingSpadeK" and G.GAME.hcm_disabled and num_disabled >= 5 then 
		G.GAME.hcm_disabled[hand_name] = true
		local take_over = nil 
		for k, v in ipairs(G.deck.cards) do
			if v.xability and v.xability.handname == "XPlayingSpadeK" then 
				take_over = v
			end
		end
		if take_over then 
			G.E_MANAGER:add_event(Event({
		        func = function() 
		        	hcm_san_galgano_dialogue(nil, "replace")
		        	card_eval_status_text(take_over, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_xplay"]["card_eval"]})
				    take_over.getting_sliced = true
				    take_over.states.visible = true
				    G.deck:remove_card(take_over)
				    G.jokers:emplace(take_over)      
				    G.E_MANAGER:add_event(Event({
				        func = function()
				        	local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_hcm_san_galgano", nil)
				            card:set_edition(nil, nil, true)
				            card:add_to_deck()
				            G.jokers:remove_card(take_over)
				            take_over:start_dissolve({G.C.RED}, nil, 1.6)
				            G.jokers:emplace(card)
				            card:start_materialize(nil, nil, 2.4)
				            return true 
				        end 
				    }))
		            return true
		    	end
		    }))
		else
			G.E_MANAGER:add_event(Event({
		        func = function() 
		        	local temp_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS['S_K'], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
				    temp_card:set_x_playing(hcm_determine_xplaying_key(G.GAME.hcm_held))
		        	temp_card.getting_sliced = true
		        	temp_card.states.visible = true
				    G.jokers:emplace(temp_card)
				    G.E_MANAGER:add_event(Event({
				    	delay=2.4,
				        func = function()
				    		temp_card:start_materialize(nil, nil, 2.4)
				    		hcm_san_galgano_dialogue(nil, "regenerate")
				    		return true
				    	end 
				    }))
				    G.E_MANAGER:add_event(Event({
				        func = function()
				    		card_eval_status_text(temp_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_xplay"]["card_eval"]})
				    		return true
				    	end 
				    }))
				    G.E_MANAGER:add_event(Event({
				        func = function()
				        	local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_hcm_san_galgano", nil)
				            card:set_edition(nil, nil, true)
				            card:add_to_deck()
				            G.jokers:remove_card(temp_card)
				            temp_card:start_dissolve({G.C.RED}, nil, 1.6)
				            G.jokers:emplace(card)
				            card:start_materialize(nil, nil, 2.4)
				            return true 
				        end 
				    }))
		            return true
	        	end
	        }))
		end
		return true
	end
    G.E_MANAGER:add_event(Event({
        func = function() 
        	local temp_card = copy_card(card_info)
        	card_eval_status_text(temp_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_xplay"]["card_eval"]})
        	temp_card.getting_sliced = true
		    G.jokers:emplace(temp_card)
		           
		    G.E_MANAGER:add_event(Event({
		        func = function()
		        	local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_"..xplaying_jokers_info[hand_name].slug, nil)
		            card:set_edition(nil, nil, true)
		            if "j_"..xplaying_jokers_info[hand_name].slug == "j_hcm_reapers_hand" then 
		                card:set_eternal(true) 
		            end
		            if "j_"..xplaying_jokers_info[hand_name].slug == "j_hcm_no_mercy" then 
		                card:set_eternal(true) 
		            end
		            if "j_"..xplaying_jokers_info[hand_name].slug == "j_hcm_masculine_parfait" then 
		                card.ability.extra.chips_acc = card_info:get_chip_bonus()
		                card.ability.extra.mult_acc = card_info:get_chip_mult()
		                --card.ability.extra.transfer_card = card_info
		            end
		            card:add_to_deck()
		            G.jokers:remove_card(temp_card)
		            temp_card:start_dissolve({G.C.RED}, nil, 1.6)
		            G.jokers:emplace(card)
		            card:start_materialize(nil, nil, 2.4)
		            return true 
		        end 
		    }))
            return true
        end}))
end

function end_xplay(hand_name)
	local jokers_to_destroy = {}
	local potential_san_galgano = nil
	local san_idx = 1
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.name == xplaying_jokers_info[hand_name].ability_name then 
            jokers_to_destroy[G.jokers.cards[i]] = i
        end
        if G.jokers.cards[i].ability.name == "HCM San Galgano" then 
        	potential_san_galgano = G.jokers.cards[i]
        	san_idx = i
        end
    end
    if not next(jokers_to_destroy) and potential_san_galgano and not G.GAME.hcm_joker_sliced then 
    	jokers_to_destroy[potential_san_galgano] = san_idx
    end
    for joker_to_destroy, joker_idx in pairs(jokers_to_destroy) do
	    if G.GAME.hcm_held or joker_to_destroy then
	    	if G.GAME.hcm_held == nil or G.GAME.hcm_held.base == nil or (G.GAME.hcm_held.ability.name ~= "HCM San Galgano" and hand_name == "XPlayingSpadeK") then 
	    		local codexx = string.sub(hand_name, 9, 9).."_"..string.sub(hand_name, -1, -1)
	    		if string.sub(hand_name, -2, -1) == "10" then 
	    			codexx = string.sub(hand_name, 9, 9).."_T"
	    		end
	    		local xcard_name = hand_name
	    		if G.GAME.hcm_held and G.GAME.hcm_held.ability and G.GAME.hcm_held.ability.name ~= "HCM San Galgano" and hand_name == "XPlayingSpadeK" then 
	    			codexx = "S_K"
	    			xcard_name = "XPlayingSpadeK"
	    		end
	    		G.GAME.hcm_held = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[codexx], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
	    		G.GAME.hcm_held:set_x_playing(xcard_name)
	    		G.GAME.hcm_held.states.visible = false
	    		if codexx == "H_K" and joker_to_destroy then
	    			local extra_chip = joker_to_destroy.ability.extra.chips_acc - G.GAME.hcm_held.base.nominal
	    			local extra_mult = joker_to_destroy.ability.extra.mult_acc
	    			G.GAME.hcm_held.perma_bonus = (extra_chip > 0 and extra_chip) or nil
	    			G.GAME.hcm_held.perma_mult = (extra_mult > 0 and extra_mult) or nil
	    		end
	    	end
	    	if joker_idx < #G.jokers.cards then
		    	for i = joker_idx, #G.jokers.cards - 1 do
			    	G.jokers.cards[i], G.jokers.cards[i + 1] = G.jokers.cards[i + 1], G.jokers.cards[i]
			    end
			end
		    if joker_to_destroy == nil then return false end
		    joker_to_destroy.getting_sliced = true
		    G.E_MANAGER:add_event(Event({
	        	func = function() 
			    	--sendInfoMessage("found "..G.GAME.hcm_held.base.suit..G.GAME.hcm_held:get_id())
			    	if G.GAME.hcm_held then
				    	local held_card = G.GAME.hcm_held
				    	G.jokers:remove_card(joker_to_destroy)
				    	G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						held_card:add_to_deck()
						G.jokers:emplace(held_card)
				    	G.E_MANAGER:add_event(Event({
					        func = function()
					        	
								joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
								if held_card.xability and held_card.xability.handname == "XPlayingSpadeK" then 
									if G.GAME.hcm_san_galgano == nil then return true
	        						else hcm_san_galgano_dialogue(joker_to_destroy, "exit") end
								end
								held_card.states.visible = true
								held_card:start_materialize(nil, nil, 2.4)
					            return true 
					        end 
					    }))
						G.E_MANAGER:add_event(Event({
					        func = function()
					        	sendInfoMessage("thrown to deck")
					        	G.jokers:remove_card(held_card)
					        	if held_card.xability and held_card.xability.handname == "XPlayingSpadeK" then 
									if G.GAME.hcm_san_galgano == nil then return true end
								end
					            G.deck:emplace(held_card)
					            table.insert(G.playing_cards, held_card)
					            return true 
					        end 
					    }))
						G.GAME.hcm_played = nil
						G.GAME.hcm_held = nil
					end
					return true
	        end}))
		end
	end
end

function hcm_determine_xplaying_key(card)
	local suit = card.base.suit
	local rank = card:get_id()
	local xplaying_name = "XPlaying"..string.sub(suit, 1, -2)..hcm_id_to_rank(rank)
	return xplaying_name
end

function hcm_determine_xplaying_colour(card)
	local suit = card.base.suit
	local xcolour = nil 
	if suit == "Spades" then xcolour = hcm_colour_spade 
	elseif suit == "Hearts" then xcolour = hcm_colour_heart
	elseif suit == "Diamonds" then xcolour = hcm_colour_diamond
	elseif suit == "Clubs" then xcolour = hcm_colour_club
	else end 
	return xcolour
end

function hcm_id_to_rank(card_id)
	local letter = tostring(card_id)
	if card_id == 11 then letter = "J"
	elseif card_id == 12 then letter = "Q"
	elseif card_id == 13 then letter = "K"
	elseif card_id == 14 then letter = "A"
	end
	return letter
end

function hcm_hand_most_played(with_highcard)
	local wo_hc = true
	if with_highcard then wo_hc = false end
    local most_played_hand = nil
    local most_played_times = 0
    for k, v in pairs(G.GAME.hands) do
        if v.played >= most_played_times then
        	if wo_hc and k == "High Card" then
        	else
            	most_played_hand = k
            	most_played_times = v.played
            end
        end
    end
    return most_played_hand
end

function hcm_get_lowest_value(hand)
    local lowest = nil
    for k, v in ipairs(hand) do
    	if v.config.center == G.P_CENTERS.m_stone then
        elseif not lowest or v:get_id() <= lowest:get_id() then
            lowest = v
        end
    end
    if #hand > 0 then return lowest else return nil end
end

function hcm_compare_hand(reference_hand, test_hand)
	local idx_reference_hand = nil 
	local idx_test_hand = nil
	for k, v in pairs(G.handlist) do
        if reference_hand == v then 
        	idx_reference_hand = k
        end
        if test_hand == v then 
        	idx_test_hand = k
        end
    end
    if idx_reference_hand == nil or idx_test_hand == nil then 
    	return nil 
    end
	return (idx_test_hand < idx_reference_hand)
end

function SMODS.INIT.HighCardMod()

    init_localization()
    G.localization.misc["labels"]["xplaying"] = x_playing_loc.name
    --G.localization.descriptions.Other["XPlaying"] = {}

    -- Initialize the deck
    if xplaying_config["XPlayingDeck"] then
        local newDeck = SMODS.Deck:new("X-Playing Deck", 
        								"XPlayingDeck", 
        								{ XPlayingDeck = true, atlas = "b_xplaying" },
        								--G.cardback_info["xplaying"], 
        								{x = 0, y = 0},
        								xplaying_deck_info)
        SMODS.Sprite:new("b_xplaying", SMODS.findModByID("HighCardMod").path, "b_xplaying.png", 71, 95, "asset_atli"):register();
        newDeck:register()
    end

    SMODS.Sprite:new("p_lowlight_normal", SMODS.findModByID("HighCardMod").path, "p_lowlight_normal.png", 71, 95, "asset_atli"):register();
    -- Initialize the booster packs
	local lowlight_setting = {
		discovered = true, 
		name = "Low Light Cigarette Pack", 
		set = "Booster", 
		order = table_length(G.P_CENTER_POOLS['Booster']) + 1, 
		key = "p_lowlight_normal", 
		pos = {x = 0, y = 0}, 
		cost = 5, 
		config = {extra = 3, choose = 1}, 
		weight = 4, 
		kind = "Celestial", 
		atlas = "p_lowlight_normal"
	}
	G.P_CENTERS[lowlight_setting.key] = lowlight_setting
	table.insert(G.P_CENTER_POOLS['Booster'], lowlight_setting)
	G.localization.descriptions.Other["p_lowlight_normal"] = hcm_lowlight_loc
	G.localization.misc.dictionary['k_cigarette_pack'] = hcm_lowlight_loc.short

    -- Initialize joker configs
    xplaying_jokers = {}
    for key, _ in pairs(xplaying_config) do
    	if key == "XPlayingDeck" then 
    	else
	    	xplaying_jokers[key] = {
	    		loc = xplaying_jokers_info[key].loc,
		        ability_name = xplaying_jokers_info[key].ability_name,
		        slug = xplaying_jokers_info[key].slug,
		        ability = xplaying_jokers_info[key].ability,
		        rarity = 4,
		        cost = 0,
		        unlocked = true,
		        discovered = true,
		        blueprint_compat = false,
		        eternal_compat = false
		    }
		end
    end

    -- Initialize Jokers
    for key, value in pairs(xplaying_jokers) do
        if xplaying_config[key] then
            local joker = SMODS.Joker:new(value.ability_name, value.slug, value.ability, { x = 0, y = 0 }, value.loc,
                value.rarity, value.cost, value.unlocked, value.discovered, value.blueprint_compat, value.eternal_compat)
            --if value.ability_name == "HCM X-Play" then joker.eternal_compat = true end
            if value.ability_name == "HCM Reapers Hand" then joker.eternal_compat = true end
            if value.ability_name == "HCM No Mercy" then joker.eternal_compat = true end
            if value.ability_name == "HCM San Galgano" then joker.eternal_compat = true end
            joker:register()
            local sprite = SMODS.Sprite:new("j_" .. value.slug, SMODS.findModByID("HighCardMod").path,
                "j_" .. value.slug .. ".png", 71, 95, "asset_atli")
            sprite:register()
            if x_sprite_info[key] then
	            local m_sprite = SMODS.Sprite:new("m_" .. value.slug, SMODS.findModByID("HighCardMod").path,
	                "m_" .. value.slug .. ".png", 71, 95, "asset_atli")
	            m_sprite:register()
	            G.localization.descriptions.Other[key] = x_playing_loc
	        end
        end
    end

    -- Individual Jokers
    if xplaying_config.XPlayingJoker then
    	--SMODS.Jokers.j_hcm_xplay.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_xplay.loc_def(card)
            return { card.ability.extra.placeholder }
        end
        SMODS.Jokers.j_hcm_xplay.calculate = function(self, context)
            if not context.blueprint then
                if SMODS.end_calculate_context(context) then
                	if G.GAME.current_round.hands_played == 0 then
                        if context.scoring_name == "High Card" then
                        	local highcard = nil
                        	for k, v in ipairs(context.scoring_hand) do
								if v.config.center == G.P_CENTERS.m_stone then
								else highcard = v end
							end 
                        	if highcard ~= nil and highcard.xability == nil then
                        		local xcard_name = hcm_determine_xplaying_key(highcard)
                        		if xplaying_config[xcard_name] then
	                        		highcard:set_x_playing(xcard_name)
	                        	end 
                        	end
                        end
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade2 then
    	SMODS.Jokers.j_hcm_neo_new_nambu.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_neo_new_nambu.loc_def(card)
            return { card.ability.extra.hand_gain, card.ability.extra.hand_size, card.ability.extra.hand_ge }
        end
        SMODS.Jokers.j_hcm_neo_new_nambu.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade2")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    ease_hands_played(self.ability.extra.hand_gain)
                    return{
                        message = G.localization.descriptions["Joker"]["j_hcm_neo_new_nambu"]["card_eval"],
                        card = self
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade3 then
    	SMODS.Jokers.j_hcm_staff_master.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_staff_master.loc_def(card)
            return { card.ability.extra.suits_required }
        end
        SMODS.Jokers.j_hcm_staff_master.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade3")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade4 then
    	SMODS.Jokers.j_hcm_clear_lance.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_clear_lance.loc_def(card)
            return { card.ability.extra.card_play, card.ability.extra.card_score, card.ability.extra.Xmult }
        end
        SMODS.Jokers.j_hcm_clear_lance.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade4")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    if #context.full_hand == 5 and #context.scoring_hand == 4 then 
	                    return{
	                        message = G.localization.descriptions["Joker"]["j_hcm_clear_lance"]["card_eval"],
	                        card = self,
	                        Xmult_mod = self.ability.extra.Xmult
	                    }
	                end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade5 then
    	SMODS.Jokers.j_hcm_brain_buster.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_brain_buster.loc_def(card)
            return { card.ability.extra.Xmult, card.ability.extra.Xmult_acc }
        end
        SMODS.Jokers.j_hcm_brain_buster.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade5")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    local upgraded = false
                    for k, v in ipairs(context.scoring_hand) do 
                    	if v:get_id() > self.ability.extra.current_highest then 
                    		self.ability.extra.current_highest = v:get_id()
                    		upgraded = true
                    	end
                    end
                    if upgraded then 
                    	self.ability.extra.Xmult_acc = self.ability.extra.Xmult_acc + self.ability.extra.Xmult
	                    return{
	                        message = G.localization.descriptions["Joker"]["j_hcm_brain_buster"]["card_eval"],
	                        card = self,
	                        Xmult_mod = self.ability.extra.Xmult_acc
	                    }
                	end
            		return{
                        card = self,
                        Xmult_mod = self.ability.extra.Xmult_acc
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade6 then
    	SMODS.Jokers.j_hcm_juggling_gun.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_juggling_gun.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade6")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade7 then
    	SMODS.Jokers.j_hcm_interceptor.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_interceptor.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade7")
                    self.ability.extra.done = true
                end
                if context.before then 
                    local enhance_options = {G.P_CENTERS.m_bonus, G.P_CENTERS.m_mult, G.P_CENTERS.m_wild, G.P_CENTERS.m_glass, G.P_CENTERS.m_steel, G.P_CENTERS.m_gold, G.P_CENTERS.m_lucky}
                    for k, v in ipairs(context.scoring_hand) do
                        if v.config.center == G.P_CENTERS.m_stone then
                        elseif v.config.center ~= G.P_CENTERS.m_stone and not v.debuff then
                            local percent = 1.15 - (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('card1', percent);v:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    for k, v in ipairs(context.scoring_hand) do
                        if v.config.center == G.P_CENTERS.m_stone then
                        elseif v.config.center ~= G.P_CENTERS.m_stone and not v.debuff then
                            local selected_enhancement = enhance_options[pseudorandom(pseudoseed('seed'), 1, #enhance_options)]
                            v:set_ability(selected_enhancement, nil, true)
                			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,func = function() v:set_ability(selected_enhancement);return true end })) 
                            local percent = 0.85 + (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('tarot2', percent, 0.6);v:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    return{
                        message = G.localization.descriptions["Joker"]["j_hcm_interceptor"]["card_eval_on"],
                        card = self
                    }
                end
                if context.after then 
                	for k, v in ipairs(context.scoring_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone and not v.debuff and not v.vampired then 
                            local percent = 1.15 - (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('card1', percent);v:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    for k, v in ipairs(context.scoring_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone and not v.debuff and not v.vampired then 
                			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,func = function() v:set_ability(G.P_CENTERS.c_base);return true end })) 
                            local percent = 0.85 + (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('tarot2', percent, 0.6);v:juice_up(0.3, 0.3);v.vampired = nil;return true end }))
                        end
                    end
                    return{
                        message = G.localization.descriptions["Joker"]["j_hcm_interceptor"]["card_eval_off"],
                        card = self
                    }
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade8 then
    	SMODS.Jokers.j_hcm_all_kaboom.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_all_kaboom.loc_def(card)
            return { card.ability.extra.kaboom_mult }
        end
        SMODS.Jokers.j_hcm_all_kaboom.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade8")
                    self.ability.extra.done = true
                end
                if context.before then 
                    self.ability.extra.kaboom_suit = context.scoring_hand[1].base.suit
                    self.ability.extra.mult_cnt = 0
                end
                if context.destroying_card then 
                    if context.destroying_card.base.suit == self.ability.extra.kaboom_suit then 
                        self.ability.extra.mult_cnt = self.ability.extra.mult_cnt + self.ability.extra.kaboom_mult
                        return true
                    end
                    return nil
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    for k, v in ipairs(context.scoring_hand) do
                        if v.base.suit == self.ability.extra.kaboom_suit then
                            self.ability.extra.mult_cnt = self.ability.extra.mult_cnt + self.ability.extra.kaboom_mult
                            card_eval_status_text(v, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_all_kaboom"]["card_eval_pc"], Xmult_mod=1})
                        end
                    end
                    if self.ability.extra.mult_cnt ~= 0 then
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_all_kaboom"]["card_eval_jk"],
                            mult_mod = self.ability.extra.mult_cnt,
                            card = self
                        }
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade9 then
    	SMODS.Jokers.j_hcm_bokka.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_bokka.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade9")
                    self.ability.extra.done = true
                end
                if context.before then 
                    
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade10 then
    	SMODS.Jokers.j_hcm_honest_straight.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_honest_straight.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade10")
                    self.ability.extra.done = true
                end
                if context.before then 
                	local chosen_idx = pseudorandom(pseudoseed('seed'), 1, #context.scoring_hand)
                	self.ability.extra.transfer_card = context.scoring_hand[chosen_idx]
                end
                if context.after then 
                	card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_honest_straight"]["card_eval"]})
		            for i=1, #context.scoring_hand do
		            	if context.scoring_hand[i] == self.ability.extra.transfer_card then
		            	else 
		            		card_eval_status_text(context.scoring_hand[i], 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_honest_straight"]["card_eval_pc"], chip_mod=1})
		                
			                local percent = 1.15 - (i-0.999)/(#context.scoring_hand-0.998)*0.3
	        				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() context.scoring_hand[i]:flip();play_sound('card1', percent);context.scoring_hand[i]:juice_up(0.3, 0.3);return true end }))
		                end
		            end 
		            for i=1, #context.scoring_hand do
		            	if context.scoring_hand[i] == self.ability.extra.transfer_card then
		            	else 
	            			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
			                    if context.scoring_hand[i] ~= self.ability.extra.transfer_card then
			                        copy_card(self.ability.extra.transfer_card, context.scoring_hand[i])
			                    end
			                    return true end 
			                })) 
	                        local percent = 0.85 + (i-0.999)/(#context.scoring_hand-0.998)*0.3
	        				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function() context.scoring_hand[i]:flip();play_sound('tarot2', percent, 0.6);context.scoring_hand[i]:juice_up(0.3, 0.3);return true end }))
		                end
		            end 
		            card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_honest_straight"]["card_eval"]})
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeJ then
    	SMODS.Jokers.j_hcm_marine_hunter.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_marine_hunter.loc_def(card)
            return { card.ability.extra.best_hand }
        end
        SMODS.Jokers.j_hcm_marine_hunter.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpadeJ")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.best_hand = hcm_hand_most_played(true)
				    if context.scoring_name == self.ability.extra.best_hand then
					    local most_played_times = G.GAME.hands[self.ability.extra.best_hand].played
					    return{
	                        message = G.localization.descriptions["Joker"]["j_hcm_marine_hunter"]["card_eval"],
	                        card = self,
	                        mult_mod = most_played_times
	                    }
	                end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeQ then
    	SMODS.Jokers.j_hcm_typhoid_mary.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_typhoid_mary.loc_def(card)
            return { card.ability.extra.Xmult }
        end
        SMODS.Jokers.j_hcm_typhoid_mary.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpadeQ")
                    hcm_has_sq = false
                    hcm_sq = nil
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                	hcm_has_sq = true
                	hcm_sq = self
                	self.ability.extra.done = false
                	self.ability.extra.highlighted_cards = {}
					for k, v in ipairs(context.full_hand) do
						table.insert(self.ability.extra.highlighted_cards, v)
					end
					sendInfoMessage(#self.ability.extra.highlighted_cards)
                	if self.ability.extra.bonus_hand then 
                		self.ability.extra.bonus_hand = false 
                		return{
	                        message = G.localization.descriptions["Joker"]["j_hcm_typhoid_mary"]["card_eval"],
	                        card = self,
	                        Xmult_mod = self.ability.extra.Xmult
	                    }
                	else
                		self.ability.extra.bonus_hand = true 
                		self.ability.extra.indicator = true
                	end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeK then
    	SMODS.Jokers.j_hcm_san_galgano.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_san_galgano.loc_def(card)
            return { card.ability.extra.Xmult, card.ability.extra.Xmult_acc }
        end
        SMODS.Jokers.j_hcm_san_galgano.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                	if G.GAME.hcm_joker_sliced then
                    else end_xplay("XPlayingSpadeK") end
                    self.ability.extra.done = true
                end
                if context.destroying_card then 
                	local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
                	if text == "High Card" then
                		local highcard = nil
                    	for k, v in ipairs(scoring_hand) do
							if v.config.center == G.P_CENTERS.m_stone then
							else highcard = v end
						end
						if G.GAME.hcm_disabled == nil then G.GAME.hcm_disabled = {} end
						if highcard.xability and xplaying_config[highcard.xability.handname] then 
							if highcard == context.destroying_card then 
								return true
							end
						end
					end
					return nil
                end

                if SMODS.end_calculate_context(context) then
                	self.ability.extra.done = false
                	if G.GAME.hcm_disabled then
                		local num_disabled = 0
                		for k, v in pairs(G.GAME.hcm_disabled) do 
							num_disabled = num_disabled + 1
						end
						if num_disabled >= 50 then 
							for _, jkr in pairs(G.jokers.cards) do
								if jkr.ability.name == 'HCM X-Play' then
									jkr.getting_sliced = true
									G.GAME.hcm_joker_sliced = true
								    G.E_MANAGER:add_event(Event({
							        	func = function() 
									    	G.E_MANAGER:add_event(Event({
										        func = function()
										        	G.jokers:remove_card(jkr)
													jkr:start_dissolve({G.C.RED}, nil, 1.6)
													hcm_san_galgano_dialogue(self, "takeover")
													self:set_eternal(true)
										            return true 
										        end 
										    }))
											return true
							        	end
							        }))
								end
							end
						end
                	end
                	if context.scoring_name == "High Card" then
                		local highcard = nil
                    	for k, v in ipairs(context.scoring_hand) do
							if v.config.center == G.P_CENTERS.m_stone then
							else highcard = v end
						end 
						if G.GAME.hcm_disabled == nil then G.GAME.hcm_disabled = {} end
						if highcard.xability and xplaying_config[highcard.xability.handname] and G.GAME.hcm_disabled[highcard.xability.handname] == nil then 
							if highcard.xability.handname == "XPlayingSpadeK" then 
								G.GAME.hcm_disabled = {}
								G.GAME.hcm_disabled[highcard.xability.handname] = true
								hcm_san_galgano_dialogue(self, "sealed")
								G.GAME.hcm_san_galgano = nil
								end_xplay("XPlayingSpadeK")
								return{
			                        card = self,
			                    }
							else
								G.GAME.hcm_disabled[highcard.xability.handname] = true
								card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_san_galgano"]["card_eval"]})
								hcm_san_galgano_dialogue(self, "consume")
							end
						end
                	end
                	--[[
					if context.scoring_hand[1]:get_id() == 13 and context.scoring_hand[1].base.suit == "Spades" then
                    	sendInfoMessage("Trying to set ability")
                    	G.E_MANAGER:add_event(Event({
				            func = function()
				                context.scoring_hand[1]:set_x_playing("XPlayingSpadeK")
				                return true
				            end
				        })) 
                    	sendInfoMessage("Ability set")
                    end
                	]]--
                	local consumed = 0
				    for k, v in pairs(G.GAME.hcm_disabled) do
				        consumed = consumed + 1
				    end
                    self.ability.extra.card_consumed = consumed
					self.ability.extra.Xmult_acc = self.ability.extra.Xmult * self.ability.extra.card_consumed + (G.GAME.hcm_joker_sliced and 100 or 1)
                	return{
                        message = G.localization.descriptions["Joker"]["j_hcm_san_galgano"]["card_eval"],
                        card = self,
                        Xmult_mod = self.ability.extra.Xmult_acc
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeA then
    	SMODS.Jokers.j_hcm_love_and_peace.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_love_and_peace.loc_def(card)
            return { card.ability.extra.chips_gain, card.ability.extra.mult_gain }
        end
        SMODS.Jokers.j_hcm_love_and_peace.calculate = function(self, context)
            if not context.blueprint then
                if context.after then 
                    local any_forced = nil
                    for k, v in ipairs(G.hand.cards) do
                        if v.ability.forced_selection then
                            any_forced = true
                        end
                    end
                    if not any_forced then 
                        G.hand:unhighlight_all()
                        local forced_card = nil
                        if G.hand.cards then 
                        	forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                        	if forced_card then
                        		forced_card.ability.forced_selection = true
                        		G.hand:add_to_highlighted(forced_card)
                        	end
						end
                    end
                end
                if context.discard then 
                	self.ability.extra.discard_cnt = self.ability.extra.discard_cnt + 1
                	if self.ability.extra.discard_cnt == #G.hand.highlighted then
                        local unhighlighted_cards = {}
                        for k, v in ipairs(G.hand.cards) do
	                        if not v.highlighted then
	                            table.insert(unhighlighted_cards, v)
	                        end
	                    end
	                    if #unhighlighted_cards ~= 0 then
	                    	local forced_card = pseudorandom_element(unhighlighted_cards, pseudoseed('cerulean_bell'))
	                        forced_card.ability.forced_selection = true
	                        G.hand:add_to_highlighted(forced_card)
	                    end
	                    self.ability.extra.discard_cnt = 0
                    end
                end
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpadeA")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.discard_cnt = 0
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_love_and_peace"]["card_eval"],
                        chip_mod = self.ability.extra.chips_gain * #context.scoring_hand,
                        mult_mod = self.ability.extra.mult_gain * #context.scoring_hand,
                        card = self
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart2 then
    	SMODS.Jokers.j_hcm_jelly_crawler.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_jelly_crawler.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart2")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart3 then
    	SMODS.Jokers.j_hcm_rockin_rocks.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_rockin_rocks.loc_def(card)
            return { card.ability.extra.retrigger_cnt }
        end
        SMODS.Jokers.j_hcm_rockin_rocks.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart3")
                    self.ability.extra.done = true
                end
                if context.before then
					local percent = 1.15 - (1-0.999)/(#context.scoring_hand-0.998)*0.3
	        		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() context.scoring_hand[1]:flip();play_sound('card1', percent);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
                	context.scoring_hand[1]:set_ability(G.P_CENTERS.m_stone, nil, true)
                	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,func = function() context.scoring_hand[1]:set_ability(G.P_CENTERS.m_stone);return true end })) 
                    percent = 0.85 + (1-0.999)/(#context.scoring_hand-0.998)*0.3
            		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function() context.scoring_hand[1]:flip();play_sound('tarot2', percent, 0.6);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_rockin_rocks"]["card_eval"],
                        card = self
                    }
                end
                if context.repetition then
                    if context.cardarea == G.play and context.other_card.config.center == G.P_CENTERS.m_stone then
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_rockin_rocks"]["card_eval"],
                            repetitions = self.ability.extra.retrigger_cnt,
                            card = self
                        }
                    end
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart4 then
    	SMODS.Jokers.j_hcm_agent_s.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_agent_s.loc_def(card)
            return { card.ability.extra.retrigger_cnt }
        end
        SMODS.Jokers.j_hcm_agent_s.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart4")
                    self.ability.extra.done = true
                end
                if context.repetition then
                    if context.cardarea == G.play and context.other_card == hcm_get_lowest_value(context.scoring_hand) and not self.ability.extra.repeated then
                        sendDebugMessage("Agent S triggered!")
                        self.ability.extra.repeated = true
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_agent_s"]["card_eval"],
                            repetitions = self.ability.extra.retrigger_cnt,
                            card = self
                        }
                    end
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.repeated = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart5 then
    	SMODS.Jokers.j_hcm_calories_high.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_calories_high.loc_def(card)
            return { card.ability.extra.discard_gain, card.ability.extra.hand_play }
        end
        SMODS.Jokers.j_hcm_calories_high.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart5")
                    self.ability.extra.done = true
                end
                if context.discard then
                    self.ability.extra.discard_cnt = self.ability.extra.discard_cnt + 1
                    if self.ability.extra.discard_cnt == #G.hand.highlighted then
                        ease_discard(self.ability.extra.discard_gain, nil, true)
                        self.ability.extra.discard_cnt = 0
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_calories_high"]["card_eval"],
                            card = self
                        }
                    end
                end
                if context.after then 
                	ease_hands_played(-G.GAME.current_round.hands_left)
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.discard_cnt = 0
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart6 then
    	SMODS.Jokers.j_hcm_the_zoo.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_the_zoo.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart6")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart7 then
    	SMODS.Jokers.j_hcm_chameleon.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_chameleon.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart7")
                    self.ability.extra.done = true
                end
                if context.before then 
                    local all_played_suits = {}
                    local existing_suit = false
                    for k, v in ipairs(context.full_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone then 
                            existing_suit = false
                            for _, v2 in ipairs(all_played_suits) do
                                if v2 == v.base.suit then existing_suit = true end
                            end
                            if not existing_suit then table.insert(all_played_suits, v.base.suit) end
                        end
                    end
                    if next(all_played_suits) then
                        local chosen_suit = all_played_suits[pseudorandom(pseudoseed('seed'), 1, #all_played_suits)]
                        context.scoring_hand = {}
                        for k, v in ipairs(context.full_hand) do
                        	if v:is_suit(chosen_suit) then
                        	else
                        		local percent = 1.15 - (k-0.999)/(#context.full_hand-0.998)*0.3
            					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('card1', percent);v:juice_up(0.3, 0.3);return true end }))
                            end
                        end
                        for k, v in ipairs(context.full_hand) do
                        	if v:is_suit(chosen_suit) then
                        	else
                				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,func = function() v:change_suit(chosen_suit);return true end })) 
                            	local percent = 0.85 + (k-0.999)/(#context.full_hand-0.998)*0.3
            					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('tarot2', percent, 0.6);v:juice_up(0.3, 0.3);return true end }))
                            end
                            --v:change_suit(chosen_suit)
                            table.insert(context.scoring_hand, v)
                        end
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_chameleon"]["card_eval"],
                            card = self
                        }
                    end
                    
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart8 then
    	SMODS.Jokers.j_hcm_mun_pheromone_mun.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_mun_pheromone_mun.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart8")
                    self.ability.extra.done = true
                end
                if context.after then 
                	if context.scoring_name == "High Card" then
                    	if context.scoring_hand[1].config.center == G.P_CENTERS.m_stone then return false end
                    	local card_rank = context.scoring_hand[1]:get_id()
                    	if card_rank > 8 then 
                    		local percent = 1.15 - (1-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() context.scoring_hand[1]:flip();play_sound('card1', percent);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
                    		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1,func = function()
			                    local card = context.scoring_hand[1]
			                    local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
			                    local rank_suffix = card.base.id == 1 and 13 or math.max(card.base.id - 1, 2)
			                    if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
			                    elseif rank_suffix == 10 then rank_suffix = 'T'
			                    elseif rank_suffix == 11 then rank_suffix = 'J'
			                    elseif rank_suffix == 12 then rank_suffix = 'Q'
			                    elseif rank_suffix == 13 then rank_suffix = 'K'
			                    elseif rank_suffix == 14 then rank_suffix = 'A'
			                    end
			                    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
			                    --card:juice_up()
			                return true end }))
			                percent = 0.85 + (1-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() context.scoring_hand[1]:flip();play_sound('tarot2', percent, 0.6);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
			                card_eval_status_text(context.scoring_hand[1], 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_mun_pheromone_mun"]["card_eval"], Xmult_mod=1})
                    	elseif card_rank < 8 then 
                    		local percent = 1.15 - (1-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() context.scoring_hand[1]:flip();play_sound('card1', percent);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
                    		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1,func = function()
			                    local card = context.scoring_hand[1]
			                    local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
			                    local rank_suffix = card.base.id == 14 and 2 or math.min(card.base.id + 1, 14)
			                    if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
			                    elseif rank_suffix == 10 then rank_suffix = 'T'
			                    elseif rank_suffix == 11 then rank_suffix = 'J'
			                    elseif rank_suffix == 12 then rank_suffix = 'Q'
			                    elseif rank_suffix == 13 then rank_suffix = 'K'
			                    elseif rank_suffix == 14 then rank_suffix = 'A'
			                    end
			                    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
			                    --card:juice_up()
			                return true end }))
			                percent = 0.85 + (1-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() context.scoring_hand[1]:flip();play_sound('tarot2', percent, 0.6);context.scoring_hand[1]:juice_up(0.3, 0.3);return true end }))
			                card_eval_status_text(context.scoring_hand[1], 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_mun_pheromone_mun"]["card_eval"], Xmult_mod=1})
                    	end
                    end 
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart9 then
    	SMODS.Jokers.j_hcm_marvelous_genius.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_marvelous_genius.loc_def(card)
            return { card.ability.extra.tarot_cnt }
        end
        SMODS.Jokers.j_hcm_marvelous_genius.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                	if self.ability.extra.hand_cnt == 1 then
	                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
		                G.E_MANAGER:add_event(Event({
		                    func = (function()
		                        G.E_MANAGER:add_event(Event({
		                            func = function() 
		                                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
		                                card:add_to_deck()
		                                G.consumeables:emplace(card)
		                                G.GAME.consumeable_buffer = 0
		                                return true
		                            end}))   
		                            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
		                        return true
		                    end)}))
		                G.E_MANAGER:add_event(Event({
		                    func = (function()
		                        G.E_MANAGER:add_event(Event({
		                            func = function() 
		                                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
		                                card:add_to_deck()
		                                G.consumeables:emplace(card)
		                                G.GAME.consumeable_buffer = 0
		                                return true
		                            end}))   
		                            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
		                        return true
		                    end)}))
		                card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_marvelous_genius"]["card_eval"]})
		            end
                    end_xplay("XPlayingHeart9")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.hand_cnt = self.ability.extra.hand_cnt + 1
                end
            end
        end
    end
    if xplaying_config.XPlayingHeart10 then
    	SMODS.Jokers.j_hcm_common_destiny.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_common_destiny.loc_def(card)
            return { card.ability.extra.chain_cnt }
        end
        SMODS.Jokers.j_hcm_common_destiny.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart10")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingHeartJ then
    	SMODS.Jokers.j_hcm_sky_dancer.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_sky_dancer.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeartJ")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    local most_played_planet, most_played_hand = nil, nil
                    most_played_hand = hcm_hand_most_played(false)
                    if most_played_hand and most_played_hand ~= "High Card" and context.scoring_name == most_played_hand then
	                    if most_played_hand then
	                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
	                            if v.config.hand_type == most_played_hand then
	                                most_played_planet = v.key
	                            end
	                        end
	                    end
	                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
		                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
		                    G.E_MANAGER:add_event(Event({
		                        trigger = 'before',
		                        delay = 0.0,
		                        func = (function()
		                                local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, most_played_planet)
		                                card:add_to_deck()
		                                G.consumeables:emplace(card)
		                                G.GAME.consumeable_buffer = 0
		                            return true
		                        end)}))
		                    return {
		                        message = G.localization.descriptions["Joker"]["j_hcm_sky_dancer"]["card_eval"],
		                        colour = G.C.SECONDARY_SET.Planet,
		                        card = self
		                    }
		                end
	                end
                end
            end
        end
    end
    if xplaying_config.XPlayingHeartQ then
    	SMODS.Jokers.j_hcm_sonic_move.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_sonic_move.loc_def(card)
            return { card.ability.extra.timer_value, card.ability.extra.Xmult, card.ability.extra.timer }
        end
        SMODS.Jokers.j_hcm_sonic_move.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeartQ")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    return{
                        message = G.localization.descriptions["Joker"]["j_hcm_sonic_move"]["card_eval"],
                        card = self,
                        Xmult_mod = self.ability.extra.Xmult
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingHeartK then
    	SMODS.Jokers.j_hcm_masculine_parfait.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_masculine_parfait.loc_def(card)
            return { card.ability.extra.chips_gain, card.ability.extra.mult_gain, card.ability.extra.chips_acc, card.ability.extra.mult_acc }
        end
        SMODS.Jokers.j_hcm_masculine_parfait.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeartK")
                    self.ability.extra.done = true
                end
                if context.destroying_card then 
                    if context.destroying_card:is_face() then
                    	if G.GAME.hcm_held == nil or G.GAME.hcm_held.ability == nil then 
				    		local codexx = "H_K"
				    		G.GAME.hcm_held = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[codexx], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
				    		G.GAME.hcm_held:set_x_playing(hcm_determine_xplaying_key(G.GAME.hcm_held))
				    		G.GAME.hcm_held.states.visible = false
				    		if self.ability.extra.chips_acc then G.GAME.hcm_held.ability.perma_bonus = self.ability.extra.chips_acc - 10 end
				    		if self.ability.extra.mult_acc then G.GAME.hcm_held.ability.perma_mult = self.ability.extra.mult_acc end
				    	end
                    	if self.ability.extra.transfer_card then sendInfoMessage("card exist") end
                    	G.GAME.hcm_held.ability.perma_bonus = (G.GAME.hcm_held.ability.perma_bonus or 0) + self.ability.extra.chips_gain
                    	G.GAME.hcm_held.ability.perma_mult = (G.GAME.hcm_held.ability.perma_mult or 0) + self.ability.extra.mult_gain
                    	self.ability.extra.chips_acc = G.GAME.hcm_held:get_chip_bonus()
                    	self.ability.extra.mult_acc = G.GAME.hcm_held:get_chip_mult()
                    	card_eval_status_text(context.destroying_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_masculine_parfait"]["card_eval"], Xmult_mod=1})
                    	return true
                    end
                    return nil
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_masculine_parfait"]["card_eval"],
                        chip_mod = self.ability.extra.chips_acc,
                        mult_mod = self.ability.extra.mult_acc,
                        card = self
                    }
                end
            end
        end
    end
	if xplaying_config.XPlayingHeartA then
		SMODS.Jokers.j_hcm_faceless.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_faceless.loc_def(card)
            return { card.ability.extra.cards_limit }
        end
        SMODS.Jokers.j_hcm_faceless.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeartA")
                    self.ability.extra.done = true
                end
                if context.before then 
                    self.ability.extra.insert_pos = 0
                    self.ability.extra.delete_pos = #context.scoring_hand
                end
                if context.destroying_card then 
                    if not self.ability.extra.faceless_trigger then return nil end
                    sendInfoMessage("Destroying card!")
                    self.ability.extra.insert_pos = self.ability.extra.insert_pos + 1
                    if self.ability.extra.insert_pos == self.ability.extra.delete_pos then 
                        self.ability.extra.faceless_trigger = false
                        return true
                    end
                    return nil
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond2 then
    	SMODS.Jokers.j_hcm_love_connection.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_love_connection.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond2")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond3 then
    	SMODS.Jokers.j_hcm_marble_rumble.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_marble_rumble.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond3")
                    self.ability.extra.done = true
                end
                if context.before then 
                	for k, v in ipairs(context.scoring_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone then
                            --v:set_ability(G.P_CENTERS.m_glass, nil, true)
                            local percent = 1.15 - (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('card1', percent);v:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    for k, v in ipairs(context.scoring_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone then
                            v:set_ability(G.P_CENTERS.m_glass, nil, true)
                            local percent = 1.15 - (k-0.999)/(#context.scoring_hand-0.998)*0.3
                			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,func = function() v:set_ability(G.P_CENTERS.m_glass);return true end })) 
                            percent = 0.85 + (k-0.999)/(#context.scoring_hand-0.998)*0.3
            				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() v:flip();play_sound('tarot2', percent, 0.6);v:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_marble_rumble"]["card_eval"],
                        card = self
                    }
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond4 then
    	SMODS.Jokers.j_hcm_musical_alchemist.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_musical_alchemist.loc_def(card)
            return { card.ability.extra.required_cnt }
        end
        SMODS.Jokers.j_hcm_musical_alchemist.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond4")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond5 then
    	SMODS.Jokers.j_hcm_greatest_man.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_greatest_man.loc_def(card)
            return { card.ability.extra.best_hand }
        end
        SMODS.Jokers.j_hcm_greatest_man.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond5")
                    self.ability.extra.done = true
                end
                if context.before then 
                	local is_higher = hcm_compare_hand(self.ability.extra.best_hand, context.scoring_name)
                	if is_higher then 
                		self.ability.extra.best_hand = context.scoring_name
                		--card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_greatest_man"]["card_eval"]})		
                		return {
	                        level_up = true,
	                        message = G.localization.descriptions["Joker"]["j_hcm_greatest_man"]["card_eval"],
	                        --message = localize('k_level_up_ex'),
	                        card = self
	                    }
                	end
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond6 then
    	SMODS.Jokers.j_hcm_13_stairs.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_13_stairs.loc_def(card)
            return { card.ability.extra.stairs, card.ability.extra.ante_mod, card.ability.extra.scored_cards }
        end
        SMODS.Jokers.j_hcm_13_stairs.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    local downstairs = false
                    if self.ability.extra.scored_cards == self.ability.extra.stairs then
                        ease_ante(-self.ability.extra.ante_mod)
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-self.ability.extra.ante_mod
                        downstairs = true
                    end
                    end_xplay("XPlayingDiamond6")
                    self.ability.extra.done = true
                    if downstairs then return {
                        message = G.localization.descriptions["Joker"]["j_hcm_13_stairs"]["card_eval"],
                        card = self
                    }end
                end
                if context.after then 
                    self.ability.extra.scored_cards = self.ability.extra.scored_cards + #context.scoring_hand
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond7 then
    	SMODS.Jokers.j_hcm_never_no_dollars.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_never_no_dollars.loc_def(card)
            return { card.ability.extra.max_money, card.ability.extra.chip_mult }
        end
        SMODS.Jokers.j_hcm_never_no_dollars.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond7")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    local wallet = math.min(self.ability.extra.max_money, G.GAME.dollars)
                    if wallet > 0 then
                        ease_dollars(-wallet)
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_never_no_dollars"]["card_eval_on"],
                            chip_mod = self.ability.extra.chip_mult * wallet,
                            mult_mod = wallet,
                            card = self
                        }
                    else
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_never_no_dollars"]["card_eval_off"],
                            card = self
                        }
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond8 then
    	SMODS.Jokers.j_hcm_red_labyrinth.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_red_labyrinth.loc_def(card)
            return { card.ability.extra.reroll_cost }
        end
        SMODS.Jokers.j_hcm_red_labyrinth.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond8")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond9 then
    	SMODS.Jokers.j_hcm_no_mercy.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_no_mercy.loc_def(card)
            return { card.ability.extra.mult_gain, card.ability.extra.mult_acc }
        end
        SMODS.Jokers.j_hcm_no_mercy.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    --end_xplay("XPlayingDiamond9")
                    self.ability.extra.done = true
                end

                if context.after then 
                	if self.ability.extra.reset then 
                		self.ability.extra.mult_acc = 0
                		self.ability.extra.reset = false 
                	end
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    local card_played = {}
                    local card_cnt = 0
                    for k, v in ipairs(context.full_hand) do
                    	local card_rank = nil
                        if v.config.center == G.P_CENTERS.m_stone then
                        	card_rank = "stone"
                        else
                        	card_rank = v:get_id()
                        end
                        if card_played[card_rank] then break end
                        card_played[card_rank] = true
                        card_cnt = card_cnt + 1
                    end
                    if card_cnt > 4 then
                    	self.ability.extra.reset = false
                    	self.ability.extra.mult_acc = self.ability.extra.mult_acc + self.ability.extra.mult_gain
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_no_mercy"]["card_eval_mercy"],
                            mult_mod = self.ability.extra.mult_acc,
                            card = self
                        }
                    else
                    	self.ability.extra.reset = true
                    	ease_hands_played(-G.GAME.current_round.hands_left)
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_no_mercy"]["card_eval"],
                            mult_mod = self.ability.extra.mult_acc,
                            card = self
                        }
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamond10 then
    	SMODS.Jokers.j_hcm_unlucky_poky.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_unlucky_poky.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond10")
                    self.ability.extra.done = true
                end
                if context.before then 
                    for k, v in pairs(G.GAME.probabilities) do 
                        sendDebugMessage(G.GAME.probabilities[k])
                        G.GAME.probabilities[k] = v * 1000
                    end
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_unlucky_poky"]["card_eval"],
                        card = self
                    }
                end
                if context.after then 
                    for k, v in pairs(G.GAME.probabilities) do 
                        sendDebugMessage(G.GAME.probabilities[k])
                        G.GAME.probabilities[k] = v / 1000
                    end
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamondJ then
    	SMODS.Jokers.j_hcm_out_of_five.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_out_of_five.loc_def(card)
            return { card.ability.extra.best_hand }
        end
        SMODS.Jokers.j_hcm_out_of_five.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamondJ")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.best_hand = hcm_hand_most_played(false)
                    if self.ability.extra.best_hand == nil then 
                    	self.ability.extra.best_hand = "Nothing else" 
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamondQ then
    	SMODS.Jokers.j_hcm_balor.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_balor.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamondQ")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamondK then
    	SMODS.Jokers.j_hcm_round_and_round.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_round_and_round.loc_def(card)
            return { card.ability.extra.required_cnt }
        end
        SMODS.Jokers.j_hcm_round_and_round.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamondK")
                    self.ability.extra.done = true
                end
                if context.before then 
                	if #context.scoring_hand == self.ability.extra.required_cnt then 
                		self.ability.extra.required_sat = true 
                	else
                		self.ability.extra.required_sat = false
                	end
                end
                if context.after then 
                	self.ability.extra.required_sat = false
                end
                if context.destroying_card then 
                	if self.ability.extra.required_sat then 
                		return true 
                	end
                	return nil
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingDiamondA then
    	SMODS.Jokers.j_hcm_dynamic_kinesis.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_dynamic_kinesis.loc_def(card)
            return { card.ability.extra.required_cnt, card.ability.extra.retrigger_cnt }
        end
        SMODS.Jokers.j_hcm_dynamic_kinesis.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamondA")
                    self.ability.extra.done = true
                end
                if context.repetition then
                    if context.cardarea == G.play and #context.full_hand == self.ability.extra.required_cnt and not self.ability.extra.repeated then
                        sendInfoMessage("Dynamic Kinesis triggered!")
                        self.ability.extra.repeated = true
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_dynamic_kinesis"]["card_eval"]})
                        return {
                        	message = localize('k_again_ex'),
                            --message = G.localization.descriptions["Joker"]["j_hcm_dynamic_kinesis"]["card_eval"],
                            repetitions = self.ability.extra.retrigger_cnt,
                            card = context.other_card
                        }
                    end
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.repeated = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClub2 then
    	SMODS.Jokers.j_hcm_metallical_parade.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_metallical_parade.loc_def(card)
            return { card.ability.extra.Xmult }
        end
        SMODS.Jokers.j_hcm_metallical_parade.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub2")
                    self.ability.extra.done = true
                end
                if context.individual then 
                    if context.cardarea == G.play then
                        if context.other_card.config.center == G.P_CENTERS.m_steel or context.other_card.config.center == G.P_CENTERS.m_gold then
                            card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_metallical_parade"]["card_eval_pc"]})
                            return {
                                x_mult = self.ability.extra.Xmult,
                                card = self
                            }
                        end
                    end
                end
                if context.after then 
                	return {
                        message = G.localization.descriptions["Joker"]["j_hcm_metallical_parade"]["card_eval"],
                        card = self
                    }
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClub3 then
    	SMODS.Jokers.j_hcm_green_green.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_green_green.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub3")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClub4 then
    	SMODS.Jokers.j_hcm_wing_wind.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_wing_wind.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub4")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    for k, v in ipairs(context.scoring_hand) do
                    	local hcm_triggered = hcm_wing_wind_bundle(v, 'Gold', self)
                    	--if hcm_triggered then card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingClub5 then
    	SMODS.Jokers.j_hcm_g_round.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_g_round.loc_def(card)
            return { card.ability.extra.mult_gain, card.ability.extra.mult_acc }
        end
        SMODS.Jokers.j_hcm_g_round.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub5")
                    self.ability.extra.done = true
                end
                if context.destroying_card then 
                    if context.destroying_card.config.center == G.P_CENTERS.m_stone then 
                        return true
                    end
                    return nil
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    for k, v in ipairs(context.full_hand) do
                        if v.config.center == G.P_CENTERS.m_stone then
                            self.ability.extra.mult_acc = self.ability.extra.mult_acc + self.ability.extra.mult_gain
                            card_eval_status_text(v, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_g_round"]["card_eval_pc"], Xmult_mod=1})
                        end
                    end
                    if self.ability.extra.mult_acc ~= 0 then
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_g_round"]["card_eval_jk"],
                            mult_mod = self.ability.extra.mult_acc,
                            card = self
                        }
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingClub6 then
    	SMODS.Jokers.j_hcm_eye_of_the_storm.yes_pool_flag = 'X-Playing Card'
    	function SMODS.Jokers.j_hcm_eye_of_the_storm.loc_def(card)
            return { card.ability.extra.chips_gain }
        end
        SMODS.Jokers.j_hcm_eye_of_the_storm.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub6")
                    self.ability.extra.done = true
                end

                if context.before then 
                	local current_average = 0
                	local rank_cnt = 0
                	for k, v in ipairs(context.scoring_hand) do
                		local current_rank = v:get_id()
                		if current_rank == 14 then current_rank = 1 end
                		if v.config.center == G.P_CENTERS.m_stone then 
                		else 
                			current_average = current_average + current_rank 
                			rank_cnt = rank_cnt + 1
                		end
                	end
                	current_average = current_average / rank_cnt
             		self.ability.extra.current_average = current_average
             		sendInfoMessage("average is "..current_average)
                end

                if context.individual then
		            if context.cardarea == G.play then
		            	local rank_now = context.other_card:get_id()
		            	if rank_now == 14 then rank_now = 1 end
		            	if context.other_card.config.center == G.P_CENTERS.m_stone then rank_now = 0 end
		                if self.ability.extra.current_average == rank_now then
	                        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
	                        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + self.ability.extra.chips_gain
	                        return {
	                            extra = {message = G.localization.descriptions["Joker"]["j_hcm_eye_of_the_storm"]["card_eval"], colour = G.C.CHIPS},
	                            colour = G.C.CHIPS,
	                            card = self
	                        }
		                end
		            end
		        end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClub7 then
    	SMODS.Jokers.j_hcm_lethal_scoville.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_lethal_scoville.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub7")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    hcm_flamed = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClub8 then
    	SMODS.Jokers.j_hcm_sinking_shadow.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_sinking_shadow.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub8")
                    self.ability.extra.done = true
                end

                if context.before then 
                    self.ability.extra.mult_gain = 0
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    for k, v in ipairs(context.full_hand) do
                        if v.config.center == G.P_CENTERS.m_stone then
                        else
                            local unscored = true
                            for k2, v2 in ipairs(context.scoring_hand) do
                                if v == v2 then unscored = false end
                            end
                            if unscored then 
                                self.ability.extra.mult_gain = self.ability.extra.mult_gain + v.base.nominal
                                card_eval_status_text(v, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_sinking_shadow"]["card_eval_pc"], Xmult_mod=1})
                            end
                        end
                    end
                    if self.ability.extra.mult_acc ~= 0 then
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_sinking_shadow"]["card_eval_jk"],
                            mult_mod = self.ability.extra.mult_gain,
                            card = self
                        }
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingClub9 then
    	SMODS.Jokers.j_hcm_chlorophyll_overgrown.yes_pool_flag = 'X-Playing Card'
    	function SMODS.Jokers.j_hcm_chlorophyll_overgrown.loc_def(card)
            return { card.ability.extra.number_gain }
        end
        SMODS.Jokers.j_hcm_chlorophyll_overgrown.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub9")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    G.GAME.hands[context.scoring_name].played = G.GAME.hands[context.scoring_name].played + self.ability.extra.number_gain - 1
    				G.GAME.hands[context.scoring_name].played_this_round = G.GAME.hands[context.scoring_name].played_this_round + self.ability.extra.number_gain - 1
                	return {
                        message = G.localization.descriptions["Joker"]["j_hcm_chlorophyll_overgrown"]["card_eval"],
                        card = self
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingClub10 then
    	SMODS.Jokers.j_hcm_million_volt.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_million_volt.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then 
                    for k, v in ipairs(G.hand.cards) do 
                		local percent = (k-0.999)/(#G.hand.cards-0.998)
                		if v.config.center == G.P_CENTERS.m_steel then 
                			ease_dollars(self.ability.extra.h_dollars)
                			card_eval_status_text(G.hand.cards[k], 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_million_volt"]["card_eval_pc"]})
                            card_eval_status_text(G.hand.cards[k], 'dollars', self.ability.extra.h_dollars, percent)
                		end
                	end
                    end_xplay("XPlayingClub10")
                    self.ability.extra.done = true
                end
                if context.individual then 
                	if context.other_card.config.center == G.P_CENTERS.m_gold then 
                		card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_million_volt"]["card_eval_pc"]})
                        return {
                            x_mult = self.ability.extra.h_x_mult,
                            card = self
                        }
                    end
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClubJ then
    	SMODS.Jokers.j_hcm_coming_home.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_coming_home.loc_def(card)
            return { card.ability.extra.best_hand }
        end
        SMODS.Jokers.j_hcm_coming_home.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClubJ")
                    self.ability.extra.done = true
                end
                if context.pre_discard then
                	self.ability.extra.best_hand = hcm_hand_most_played(true)
                    local draw_result = coming_home_draws(self)
                    self.ability.extra.discard_cnt = 0
                end
                if context.after then
                	self.ability.extra.best_hand = hcm_hand_most_played(true)
                    local draw_result = coming_home_draws(self)
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.best_hand = hcm_hand_most_played(true)
                end
            end
        end
    end
    if xplaying_config.XPlayingClubQ then
    	SMODS.Jokers.j_hcm_punker_viper.yes_pool_flag = 'X-Playing Card'
        SMODS.Jokers.j_hcm_punker_viper.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClubQ")
                    self.ability.extra.done = true
                end
                --if context.after then 
                --	card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_punker_viper"]["card_eval"]})
                --	G.FUNCS.draw_from_discard_to_deck()
                --end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingClubK then
    	SMODS.Jokers.j_hcm_reapers_hand.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_reapers_hand.loc_def(card)
            return { card.ability.extra.chips_gain, card.ability.extra.mult_gain, card.ability.extra.xmult_gain, 
                     card.ability.extra.gold_cnt * 3}
        end
        SMODS.Jokers.j_hcm_reapers_hand.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    --end_xplay("XPlayingClubK")
                    self.ability.extra.done = true
                    if self.ability.extra.gold_cnt > 0 then 
                        for i = 1, self.ability.extra.gold_cnt do
                            ease_dollars(3)
                            delay(0.3)
                        end
                    end
                end

                if context.destroying_card then 
                    local trigger_cnt = 1
                    if context.destroying_card.seal and context.destroying_card.seal == 'Red' then trigger_cnt = 2 end
                    --local trigger_cnt = self.ability.extra.rseal + 1
                    for i = 1, trigger_cnt do
                        self.ability.extra.chips_gain = self.ability.extra.chips_gain + context.destroying_card.base.nominal

                        -- Check enhancement
                        if context.destroying_card.config.center == G.P_CENTERS.m_stone then 
                            self.ability.extra.chips_gain = self.ability.extra.chips_gain + 50
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_bonus then
                            self.ability.extra.chips_gain = self.ability.extra.chips_gain + 30
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_mult then
                            self.ability.extra.mult_gain = self.ability.extra.mult_gain + 4
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_glass then
                            self.ability.extra.glass_cnt = self.ability.extra.glass_cnt + 1
                            self.ability.extra.xmult_gain = self.ability.extra.xmult_gain + 2
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_steel then
                            self.ability.extra.xmult_gain = self.ability.extra.xmult_gain + 1.5
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_gold then
                            self.ability.extra.gold_cnt = self.ability.extra.gold_cnt + 1 
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_lucky then
                            self.ability.extra.lucky_cnt = self.ability.extra.lucky_cnt + 1 
                        end
                        -- Check editions
                        if context.destroying_card.edition then
                            if context.destroying_card.edition.holo then 
                                self.ability.extra.mult_gain = self.ability.extra.mult_gain + 10
                            elseif context.destroying_card.edition.foil then 
                                self.ability.extra.chips_gain = self.ability.extra.chips_gain + 50
                            elseif context.destroying_card.edition.polychrome then
                                self.ability.extra.xmult_gain = self.ability.extra.xmult_gain * 1.5
                            end
                        end
                        -- Check seal
                        if context.destroying_card.seal then 
                            if context.destroying_card.seal == 'Gold' then 
                                self.ability.extra.gseal = self.ability.extra.gseal + 1
                            elseif context.destroying_card.seal == 'Red' then 
                                self.ability.extra.rseal = self.ability.extra.rseal + 1
                            elseif context.destroying_card.seal == 'Blue' then
                                self.ability.extra.bseal = self.ability.extra.bseal + 1
                            end
                        end
                    end
                    return true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    for k, v in ipairs(context.scoring_hand) do
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_reapers_hand"]["card_eval_pc"], Xmult_mod=1})
                    end
                    local lucky_multi = 0
                    if self.ability.extra.lucky_cnt > 0 then
                        for i = 1, self.ability.extra.lucky_cnt do
                            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal / 5 then
                                card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_reapers_hand"]["card_eval_lm"], Xmult_mod=1})
                                lucky_multi = lucky_multi + 1
                            end
                            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / 15 then
                                card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_reapers_hand"]["card_eval_ld"], Xmult_mod=1})
                                ease_dollars(20)
                                delay(0.3)
                            end
                        end
                    end
                    G.E_MANAGER:add_event(Event({
                        delay = 0.0,
                        func = (function()
                                if self.ability.extra.glass_cnt > 0 then
                                    local glass_shattered = 0
                                    for i = 1, self.ability.extra.glass_cnt do
                                        if pseudorandom('glass') < G.GAME.probabilities.normal / 4 then
                                            card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_reapers_hand"]["card_eval_st"]})
                                            glass_shattered = glass_shattered + 1
                                        end
                                    end
                                    while glass_shattered > 0 do
                                        self.ability.extra.xmult_gain = self.ability.extra.xmult_gain - 2
                                        self.ability.extra.glass_cnt = self.ability.extra.glass_cnt - 1
                                        glass_shattered = glass_shattered - 1
                                    end
                                end
                            return true
                        end)}))
                    return {
                        message = G.localization.descriptions["Joker"]["j_hcm_reapers_hand"]["card_eval_jk"],
                        chip_mod = self.ability.extra.chips_gain,
                        mult_mod = self.ability.extra.mult_gain + lucky_multi * 20,
                        Xmult_mod = self.ability.extra.xmult_gain,
                        card = self
                    }
                end
            end
        end
    end
    if xplaying_config.XPlayingClubA then
    	SMODS.Jokers.j_hcm_life_binder.yes_pool_flag = 'X-Playing Card'
        function SMODS.Jokers.j_hcm_life_binder.loc_def(card)
            return { card.ability.extra.cards_required }
        end
        SMODS.Jokers.j_hcm_life_binder.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClubA")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    if #context.scoring_hand == self.ability.extra.cards_required then 
                    	local satisfied = true 
                    	local enhancement = nil 
                    	for k, v in ipairs(context.scoring_hand) do 
                    		if v.config.center == G.P_CENTERS.c_base then
                    			satisfied = false 
                    			break 
                    		else
                    			if enhancement == nil then 
                    				enhancement = v.config.center
                    			elseif enhancement ~= v.config.center then 
                    				satisfied = false 
                    				break 
                    			end
                    		end
                    	end
                  		if enhancement == nil then satisfied = false end
                    	if satisfied then 
                    		card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_life_binder"]["card_eval"]})
							sendInfoMessage("Life Binder Generation Process!")
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						    
						    local fake_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS['H_A'], G.P_CENTERS['c_base'], {playing_card = G.playing_card})
						    local card_encode = 'C_A'

						    fake_card:set_base(G.P_CARDS[card_encode])
						    fake_card:set_ability(enhancement)
						    fake_card:add_to_deck()
						    G.deck.config.card_limit = G.deck.config.card_limit + 1
						    table.insert(G.playing_cards, fake_card)
						    G.hand:emplace(fake_card)
						    fake_card.states.visible = nil

						    G.E_MANAGER:add_event(Event({
						        func = function()
						            fake_card:start_materialize()
						            return true
						        end
						    })) 
						    card_eval_status_text(fake_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_life_binder"]["card_eval_pc"]})
                    	end
                    end
                end
            end
        end
    end
end

local add_to_deck_OG = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck then
        
        if self.ability.name == 'HCM Neo New Nambu' then
            entrance_neo_new_nambu(self)
        end
        if self.ability.name == 'HCM Marine Hunter' then 
            self.ability.extra.best_hand = hcm_hand_most_played(false)
        end
        if self.ability.name == 'HCM Love and Peace' then 
            local any_forced = nil
            for k, v in ipairs(G.hand.cards) do
                if v.ability.forced_selection then
                    any_forced = true
                end
            end
            if not any_forced then 
                G.hand:unhighlight_all()
                local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                forced_card.ability.forced_selection = true
                G.hand:add_to_highlighted(forced_card)
            end
        end
        if self.ability.name == 'HCM Calories High' then
            ease_hands_played(self.ability.extra.hand_play - G.GAME.current_round.hands_left)
        end
        if self.ability.name == 'HCM 13 Stairs' then 
        	self.ability.extra.scored_cards = 1
        end
        if self.ability.name == 'HCM Out of Five' then
            self.ability.extra.best_hand = hcm_hand_most_played(false)
            if self.ability.extra.best_hand == nil then 
            	self.ability.extra.best_hand = "Nothing else" 
            end
        end
        if self.ability.name == 'HCM Coming Home' then 
            self.ability.extra.best_hand = hcm_hand_most_played(true)
        end
		if self.ability.name == 'HCM Reapers Hand' then 
            self:set_eternal(true) 
        end
        if self.ability.name == 'HCM No Mercy' then 
            self:set_eternal(true) 
        end
        if self.ability.name == 'HCM Red Labyrinth' then 
        	--card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_red_labyrinth"]["card_eval"]})
            ease_background_colour{new_colour = G.C.RED, contrast = 3}
        end
        if self.ability.name == 'HCM Balor' then 
        	G.GAME.hcm_balor = true
        end
        if self.ability.name == 'HCM San Galgano' then 
        	if G.GAME.hcm_san_galgano == nil then 
        		hcm_san_galgano_dialogue(self, "awaken")
        	end
        	G.GAME.hcm_san_galgano = true
        	if G.GAME.hcm_disabled == nil then
        		G.GAME.hcm_disabled = {}
        		--[[
				for k, v in pairs(xplaying_jokers_info) do
	        		G.GAME.hcm_disabled[k] = false
	        	end
        		]]--
	        end
	        local consumed = 0
		    for k, v in pairs(G.GAME.hcm_disabled) do
		        consumed = consumed + 1
		    end
            self.ability.extra.card_consumed = consumed
			self.ability.extra.Xmult_acc = self.ability.extra.Xmult * self.ability.extra.card_consumed + 1
        end
    end
    add_to_deck_OG(self, from_debuff)
end

local remove_from_deck_OG = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck then
        if self.ability.name == 'HCM Neo New Nambu' then
            G.GAME.blind.debuff["h_size_ge"] = 1
            G.GAME.blind.loc_debuff_text = ''
        end
        if self.ability.name == 'HCM Balor' then
            G.GAME.hcm_balor = false
        end
        if self.ability.name == 'HCM San Galgano' then 
        	--if G.GAME.hcm_san_galgano == nil then
        	--else hcm_san_galgano_dialogue(self, "exit") end
        end
    end
    remove_from_deck_OG(self, from_debuff)
end

local get_end_of_round_effect_OG = Card.get_end_of_round_effect
function Card:get_end_of_round_effect(context)
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM Wing Wind' then
			--card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]})
			local hcm_triggered = hcm_wing_wind_bundle(self, 'Blue', jkr)
			--if hcm_triggered then card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
		end
	end
	return get_end_of_round_effect_OG(self, context)
end

local calculate_seal_OG = Card.calculate_seal
function Card:calculate_seal(context)
	if context.discard then
		for _, jkr in pairs(G.jokers.cards) do
			if jkr.ability.name == 'HCM Wing Wind' then
				--sendInfoMessage("Discard WW")
				local hcm_triggered = hcm_wing_wind_bundle(self, 'Purple', jkr)
				--if hcm_triggered then card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
			end
		end
	end
	calculate_seal_OG(self, context)
end

function entrance_neo_new_nambu(xcard)
	ease_discard(-G.GAME.current_round.discards_left, nil, true)
    local handsize_change = xcard.ability.extra.hand_size - G.hand.config.card_limit
    G.hand:change_size(handsize_change)
    G.GAME.round_resets.temp_handsize = handsize_change
    
    G.GAME.blind.debuff["h_size_ge"] = xcard.ability.extra.hand_ge
    if G.GAME.blind.boss then 
        if G.GAME.blind.name ~= 'The Psychic' then 
            if G.GAME.blind.loc_debuff_text and G.GAME.blind.loc_debuff_text ~= '' then
                local loc_target = localize{type = 'raw_descriptions', key = "bl_psychic", set = 'Blind', vars = loc_vars or G.GAME.blind.vars}
                if loc_target then 
                    for k, v in ipairs(loc_target) do
                        G.GAME.blind.loc_debuff_text = G.GAME.blind.loc_debuff_text.."and "..v..(k <= #loc_target and ' ' or '')
                    end
                end
            end
        end
    else
        local loc_target = localize{type = 'raw_descriptions', key = "bl_psychic", set = 'Blind', vars = loc_vars or G.GAME.blind.vars}
        if loc_target then 
            G.GAME.blind.loc_debuff_text = ''
            for k, v in ipairs(loc_target) do
                G.GAME.blind.loc_debuff_text = G.GAME.blind.loc_debuff_text..v..(k <= #loc_target and ' ' or '')
            end
        end
    end
end

function generate_jelly_combos(numbers, combo, index, result)
    local unpack = table.unpack or unpack
    if index > #numbers then
    -- Insert a copy of the current combination
        table.insert(result, {unpack(combo)})  
        return
    end
    -- Include the current number as is
    combo[index] = numbers[index]
    generate_jelly_combos(numbers, combo, index + 1, result)
    -- Include the current number minus one
    combo[index] = numbers[index] - 1
    generate_jelly_combos(numbers, combo, index + 1, result)
end

function jelly_combos(numbers)
    local result = {}
    generate_jelly_combos(numbers, {}, 1, result)
    return result
end

local evaluate_poker_hand_OG = evaluate_poker_hand
function evaluate_poker_hand(hand)
	local unpack = table.unpack or unpack
	local result = evaluate_poker_hand_OG(hand)
	local new_results = result
	if new_results.top == nil then 
		for _, jkr in pairs(G.jokers.cards) do
			if jkr.ability.name == 'HCM Out of Five' then
				jkr.ability.extra.shown = false
			end
			if jkr.ability.name == 'HCM San Galgano' then
				jkr.ability.extra.shown = false
			end
		end
		return result 
	end
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM San Galgano' then 
			if result.top == result["High Card"] and result.top and next(result.top) then 
				for k, v in ipairs(result.top[1]) do
					if v.xability and v.xability.handname == "XPlayingSpadeK" and not jkr.ability.extra.shown then
						card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_san_galgano"]["card_eval_hesitate_0"]})
						jkr.ability.extra.shown = true
					end
				end
			else
				jkr.ability.extra.shown = false
			end
		end
		if jkr.ability.name == 'HCM Green Green' then
            new_results = {
		        ["Flush Five"] = {},
		        ["Flush House"] = {},
		        ["Five of a Kind"] = {},
		        ["Straight Flush"] = {},
		        ["Four of a Kind"] = {},
		        ["Full House"] = {},
		        ["Flush"] = {},
		        ["Straight"] = result.top,
		        ["Three of a Kind"] = {},
		        ["Two Pair"] = {},
		        ["Pair"] = {},
		        ["High Card"] = {},
		        top = result.top
		      }
            --sendInfoMessage("Straight Effect Dominates! ")
            return new_results
        elseif jkr.ability.name == 'HCM Jelly Crawler' then 
        	local suits = {}
		    local OG_ranks = {}
		    for k, v in ipairs(hand) do
		    	if v.config.center == G.P_CENTERS.m_stone then
		    	else
			    	table.insert(suits, v.base.suit)
			    	table.insert(OG_ranks, v:get_id())
			    end
		    end
		    local variational_ranks = jelly_combos(OG_ranks)
		    local hand_priority = {}
			for k, v in ipairs(G.handlist) do
				hand_priority[v] = k
				-- The smaller the better!
			end
			local current_hand = nil
			local best_hand = 'High Card'
			local best_ranks = nil
			for _, ranks in ipairs(variational_ranks) do
				current_hand = hcm_best_hand(suits, ranks)
			    if hand_priority[current_hand] < hand_priority[best_hand] then 
			    	best_hand = current_hand
			    	best_ranks = {unpack(ranks)}
			    end
			end
			local scoring_situation = {}
			if best_ranks then 
				local rank_counts = {}
				local suit_counts = {}
			    for k, v in ipairs(best_ranks) do
			        rank_counts[v] = (rank_counts[v] or 0) + 1
			        suit_counts[suits[k]] = (suit_counts[suits[k]] or 0) + 1
			    end
			    local best_suit_cnt = 0
			    local best_suit = nil 
			    for k, v in pairs(suit_counts) do
			    	if v > best_suit_cnt then
			    		best_suit = k 
			    		best_suit_cnt = v 
			    	end
			    end
			    for k, v in ipairs(best_ranks) do
			    	local include_flag = false
			    	if #best_ranks == 5 and (best_hand == "Flush Five" or 
			    		best_hand == "Flush House" or best_hand == "Straight Flush" or 
			    		best_hand == "Five of a Kind" or best_hand == "Full House") then
			    		include_flag = true 
			    	elseif best_hand == "Four of a Kind" and rank_counts[v] == 4 then 
			    		include_flag = true 
			    	elseif best_hand == "Flush" and suits[k] == best_suit then
			    		include_flag = true 
			    	elseif best_hand == "Straight" then -- BUGGY!! Four Fingers?
			    		include_flag = true 
			    	elseif best_hand == "Three of a Kind" and rank_counts[v] == 3 then 
			    		include_flag = true 
			    	elseif (best_hand == "Two Pair" or best_hand == "Pair") and rank_counts[v] == 2 then 
			    		include_flag = true 
			    	elseif best_hand == "High Card" and result.top[1]:get_id() == v then 
			    		include_flag = true
			    	end
			        table.insert(scoring_situation, include_flag)
			    end
			    best_hand_result = {}
			    for k, v in ipairs(hand) do
			    	if scoring_situation[k] then table.insert(best_hand_result, v) end
			    end
			    new_results[best_hand] = {best_hand_result}
			    new_results.top = {best_hand_result}
			end
			return new_results

        elseif jkr.ability.name == 'HCM Chameleon' then
		    if next(result["Five of a Kind"]) then new_results["Flush Five"] = result["Five of a Kind"]
		    elseif next(result["Full House"]) then new_results["Flush House"] = result["Full House"]
		    elseif next(result["Straight"]) then new_results["Straight Flush"] = result["Straight"] end
		    if #hand >= 5 then 
		        local placeholder_tab = {}
		        local has_stone = 0
		        for _,v in ipairs(hand) do
		            if v.config.center == G.P_CENTERS.m_stone then has_stone = has_stone + 1 end
		            table.insert(placeholder_tab, v)
		        end
		        if #hand - has_stone >= 5 then new_results["Flush"] = {placeholder_tab} end
		    end
		    return new_results
		elseif jkr.ability.name == 'HCM Common Destiny' then
			--if result and result.top and next(result.top) then sendInfoMessage(#result.top) end
		    if result and result.top and next(result.top) and #result.top[1] == 5 then 
		    	new_results["Five of a Kind"] = result.top
		    	card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_common_destiny"]["card_eval"]})
		    end
		    return new_results
        elseif jkr.ability.name == 'HCM Love Connection' then 
		    if not next(new_results["Pair"]) then 
		    	new_results["Pair"] = result.top 
		    end
		    --sendInfoMessage("Pair Effect Dominates! ")
		    return new_results
		elseif jkr.ability.name == 'HCM Out of Five' then 
		    local replacement = hcm_hand_most_played(false)
		    if replacement == nil then return result end
		    if next(result["Flush Five"]) then if replacement~="Flush Five" then jkr.ability.extra.shown = false end
		    elseif next(result["Flush House"]) then if replacement~="Flush House" then jkr.ability.extra.shown = false end
		    elseif next(result["Five of a Kind"]) then if replacement~="Five of a Kind" then jkr.ability.extra.shown = false end
		    elseif next(result["Straight Flush"]) then if replacement~="Straight Flush" then jkr.ability.extra.shown = false end
		    elseif next(result["Four of a Kind"]) then if replacement~="Four of a Kind" then jkr.ability.extra.shown = false end  
		    elseif next(result["Full House"]) then if replacement~="Full House" then jkr.ability.extra.shown = false end 
		    elseif next(result["Flush"]) then if replacement~="Flush" then jkr.ability.extra.shown = false end  
		    elseif next(result["Straight"]) then if replacement~="Straight" then jkr.ability.extra.shown = false end
		    elseif next(result["Three of a Kind"]) then if replacement~="Three of a Kind" then jkr.ability.extra.shown = false end 
		    elseif next(result["Two Pair"]) then if replacement~="Two Pair" then jkr.ability.extra.shown = false end 
		    elseif next(result["Pair"]) then if replacement~="Pair" then jkr.ability.extra.shown = false end
		    elseif next(result["High Card"]) then 
		        new_results[replacement] = result["High Card"]
		        if not jkr.ability.extra.shown then
		        	card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_out_of_five"]["card_eval"]})
		        	jkr.ability.extra.shown = true
		        end
		    end   
		    return new_results
		end
		--[[
		if jkr.ability.name == 'HCM The Zoo' then 
			for _,v in ipairs(hand) do
	            sendInfoMessage("Poker Info: "..v.base.suit..v:get_id())
	        end 
        end
        ]]--
	end
	return new_results
end

local get_chip_mult_OG = Card.get_chip_mult

function Card:get_chip_mult()
    local mult_value = get_chip_mult_OG(self)
    return mult_value + (self.ability.perma_mult or 0)
end

local sell_card_OG = Card.sell_card
function Card:sell_card()
	local alternative = false
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM Red Labyrinth' then
			alternative = true
			local area = self.area
		    local aof = area == G.jokers and 'jokers' or 'consumeables'
		    if aof == "consumeables" and G.GAME.dollars - jkr.ability.extra.reroll_cost >= 0 then
		    	card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_red_labyrinth"]["card_eval"]})
		    	ease_background_colour{new_colour = G.C.RED, contrast = 3}
		    	local consume_type = self.ability.set
		    	local key_append_extra = nil
		    	--if consume_type == 'Tarot' then key_append_extra = 'emp'
		    	--elseif consume_type == 'Planet' then key_append_extra = 'pri'
		    	--else end
				G.CONTROLLER.locks.selling_card = true
			    stop_use()
			    G.CONTROLLER:save_cardarea_focus(aof)

			    if self.children.use_button then self.children.use_button:remove(); self.children.use_button = nil end
			    if self.children.sell_button then self.children.sell_button:remove(); self.children.sell_button = nil end
			    
			    self:calculate_joker{selling_self = true}

			    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
			        play_sound('gong', 0.94, 0.3)
			        self:juice_up(0.3, 0.4)
			        return true
			    end}))
			    delay(0.2)
			    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
			        ease_dollars(-jkr.ability.extra.reroll_cost)
			        self:start_dissolve({G.C.GOLD})
			        delay(0.15)		 

			        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		                if G.consumeables.config.card_limit > #G.consumeables.cards then
		                    play_sound('timpani')
		                    local card = create_card(consume_type, G.consumeables, nil, nil, nil, nil, nil, key_append_extra)
		                    card:add_to_deck()
		                    G.consumeables:emplace(card)
		                end
		                return true end }))
			        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3, blocking = false,
			        func = function()
			            G.E_MANAGER:add_event(Event({trigger = 'immediate',
			            func = function()
			                G.E_MANAGER:add_event(Event({trigger = 'immediate',
			                func = function()
			                    G.CONTROLLER.locks.selling_card = nil
			                    G.CONTROLLER:recall_cardarea_focus(area == G.jokers and 'jokers' or 'consumeables')
			                return true
			                end}))
			            return true
			            end}))
			        return true
			        end}))
			        return true
			    end}))
			else
				alternative = false 
			end
		end
	end
	if alternative then 
	else 
		sell_card_OG(self)
	end
end

local card_update_OG = Card.update
function Card:update(dt)
    if G.STAGE == G.STAGES.RUN then
    	if self.xability and self.children.front then
    		if self.config.center == G.P_CENTERS.m_stone then self.xability = nil
    		elseif self.children.front.atlas ~= G.ASSET_ATLAS[self.xability.atlas] then 
    			self:set_x_playing(hcm_determine_xplaying_key(self))
    		end
    	end
        if self.config.center.key == "j_hcm_sonic_move" and not self.debuff then
            self.ability.extra.timer = self.ability.extra.timer - (dt / G.SETTINGS.GAMESPEED)
            if self.ability.extra.timer <= 0 and G.STATE ~= G.STATES.GAME_OVER then
                G.STATE = G.STATES.GAME_OVER
                if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then 
                    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
                end
                G:save_settings()
                G.FILE_HANDLER.force = true
                G.STATE_COMPLETE = false
            end
        end
    end
    card_update_OG(self, dt)
end

local copy_card_OG = copy_card

function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local new_card = copy_card_OG(other, new_card, card_scale, playing_card, strip_edition)
    if other.xability then new_card:set_x_playing(hcm_determine_xplaying_key(other)) end
    return new_card
end

local draw_card_OG = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
	draw_card_OG(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
end

function coming_home_draws(xcard)
    local most_played_hand = hcm_hand_most_played(true)
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local current_hand = G.hand.cards
    local current_deck = G.deck.cards
    sendInfoMessage("Looking to draw: "..most_played_hand)
    local draw_outcome = false
    local cards_to_draw = nil
    if most_played_hand == "Flush Five" then
    	draw_outcome, cards_to_draw = hcm_draw_Flush_X_of_A_Kind(current_deck, current_hand, hand_space, 5)
    elseif most_played_hand == "Flush House" then
        draw_outcome, cards_to_draw = hcm_draw_Flush_House(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Five of a Kind" then
        draw_outcome, cards_to_draw = hcm_draw_X_of_A_Kind(current_deck, current_hand, hand_space, 5)
    elseif most_played_hand == "Straight Flush" then
        draw_outcome, cards_to_draw = hcm_draw_Straight_Flush(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Four of a Kind" then
        draw_outcome, cards_to_draw = hcm_draw_X_of_A_Kind(current_deck, current_hand, hand_space, 4)
    elseif most_played_hand == "Full House" then
        draw_outcome, cards_to_draw = hcm_draw_Full_House(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Flush" then
        draw_outcome, cards_to_draw = hcm_draw_Flush(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Straight" then
        draw_outcome, cards_to_draw = hcm_draw_Straight(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Three of a Kind" then
        draw_outcome, cards_to_draw = hcm_draw_X_of_A_Kind(current_deck, current_hand, hand_space, 3)
    elseif most_played_hand == "Two Pair" then
        draw_outcome, cards_to_draw = hcm_draw_Two_Pairs(current_deck, current_hand, hand_space)
    elseif most_played_hand == "Pair" then 
        draw_outcome, cards_to_draw = hcm_draw_X_of_A_Kind(current_deck, current_hand, hand_space, 2)
    elseif most_played_hand == "High Card" then
    else end

    if cards_to_draw and next(cards_to_draw) then 
    	card_eval_status_text(xcard, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_coming_home"]["card_eval"]})
    	for k, v in ipairs(cards_to_draw) do
    		sendInfoMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
    		draw_card(G.deck, G.hand, k*100/hand_space,'up', true, v)
    	end
    end

    return draw_outcome
end

function hcm_draw_X_of_A_Kind(card_deck, card_hand, hand_space, X)
    -- Count occurrences of each rank in the hand
    local hand_counts = {}
    for _, v in ipairs(card_hand) do
    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
    	else
        	hand_counts[v:get_id()] = (hand_counts[v:get_id()] or 0) + 1
        end
    end

    -- Count occurrences of each rank in the deck
    local deck_counts = {}
    for _, v in ipairs(card_deck) do
    	if v.config.center == G.P_CENTERS.m_stone then
    	else
        	deck_counts[v:get_id()] = (deck_counts[v:get_id()] or 0) + 1
        end
    end

    -- Check if "X of a kind" can be formed for each rank in the hand
    for k, v in pairs(hand_counts) do
    	-- Determine how many more cards of this rank are needed
        local needed = X - v  

        if needed <= 0 then
        	-- Already have "X of a kind" in hand
            return true, {}  
        elseif needed <= (deck_counts[k] or 0) and needed <= hand_space then
            -- Find the specific cards needed from the deck
            local draws = {}
            for _, card in ipairs(card_deck) do
            	if card.highlighted or card.config.center == G.P_CENTERS.m_stone then
                elseif card:get_id() == k and #draws < needed then
                    table.insert(draws, card)
                end
            end
            return true, draws
        end
    end

    -- Check if "X of a kind" can be formed from pure drawings
    if hand_space >= X then 
	    for k, v in pairs(deck_counts) do
	    	-- Determine how many more cards of this rank are needed
	        local needed = X

			if needed <= (deck_counts[k] or 0) and needed <= hand_space then
	            -- Find the specific cards needed from the deck
	            local draws = {}
	            for _, card in ipairs(card_deck) do
	            	if card.highlighted or card.config.center == G.P_CENTERS.m_stone then
	                elseif card:get_id() == k and #draws < needed then
	                    table.insert(draws, card)
	                end
	            end
	            return true, draws
	        end
	    end
	end

    -- If no "X of a kind" can be formed
    return false, nil
end

function hcm_draw_Flush_X_of_A_Kind(card_deck, card_hand, hand_space, X)
    -- Initialize a table to count occurrences of each rank within each suit
    local deck_counts = {Hearts = {}, Diamonds = {}, Clubs = {}, Spades = {}}
    local hand_counts = {Hearts = {}, Diamonds = {}, Clubs = {}, Spades = {}}

    -- Helper function to count cards
    local function count_cards(cards, counts)
        for _, v in ipairs(cards) do
        	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
            elseif not counts[v.base.suit][v:get_id()] then
                counts[v.base.suit][v:get_id()] = 1
            else
                counts[v.base.suit][v:get_id()] = counts[v.base.suit][v:get_id()] + 1
            end
        end
    end

    -- Count cards in hand and deck
    count_cards(card_hand, hand_counts)
    count_cards(card_deck, deck_counts)

    -- Check each suit for "Flush X of a Kind"
    for s, ranks in pairs(hand_counts) do
        for k, v in pairs(ranks) do
            local needed = X - v
            if needed <= 0 then
                -- Already have "Flush X of a Kind" in hand
                return true, {}
            elseif needed <= (deck_counts[s][k] or 0) and needed <= hand_space then
                -- Find the specific cards needed from the deck
                local draws = {}
                for _, card in ipairs(card_deck) do
                	if card.highlighted or card.config.center == G.P_CENTERS.m_stone then
                    elseif card:get_id() == k and card.base.suit == s and #draws < needed then
                        table.insert(draws, card)
                    end
                end
                return true, draws
            end
        end
    end
    if hand_space >= X then 
	    for s, ranks in pairs(deck_counts) do
	        for k, v in pairs(ranks) do
	            local needed = X
	            if needed <= (deck_counts[s][k] or 0) and needed <= hand_space then
	                -- Find the specific cards needed from the deck
	                local draws = {}
	                for _, card in ipairs(card_deck) do
	                	if card.highlighted or card.config.center == G.P_CENTERS.m_stone then
	                    elseif card:get_id() == k and card.base.suit == s and #draws < needed then
	                        table.insert(draws, card)
	                    end
	                end
	                return true, draws
	            end
	        end
	    end
	end
    -- If no "Flush X of a Kind" can be formed
    return false, nil
end

function hcm_draw_Full_House(card_deck, card_hand, hand_space)
    -- Helper function to count occurrences of each rank
    local function count_ranks(cards)
        local ranks = {}
        for _, v in ipairs(cards) do
        	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        	else
            	ranks[v:get_id()] = (ranks[v:get_id()] or 0) + 1
            end
        end
        return ranks
    end

    -- Check if hand already forms a full house or part of it
    local function check_hand(hand_ranks, only_pair, only_single)
        local overall = false
        local three_cnt, pair_cnt, single_cnt = 0, 0, 0
        local only_pair_cnt, only_single_cnt = 0, 0
        for k, count in pairs(hand_ranks) do
            if count >= 3 then three_cnt = three_cnt + 1 end
            if count >= 2 then pair_cnt = pair_cnt + 1 end
            if count == 2 and only_pair[k] then only_pair_cnt = only_pair_cnt + 1 end
            if count == 1 then single_cnt = single_cnt + 1 end
            if count == 1 and only_single[k] then only_single_cnt = only_single_cnt + 1 end
        end
        -- Scenario: 2 threes, 1 three 1 pair
        if three_cnt > 1 or (pair_cnt - three_cnt > 0 and three_cnt > 0) then 
        	overall = true 
        end

        return overall, three_cnt, pair_cnt, single_cnt, only_pair_cnt, only_single_cnt
    end

    -- Main logic
    local hand_ranks = count_ranks(card_hand)
	local deck_ranks = count_ranks(card_deck)
	local only_pair = {}
    local only_single = {}
    local drawn = {}
    for k, v in ipairs(card_hand) do
    	if (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 1 then 
    		only_single[v:get_id()] = true
    	elseif (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 2 then 
    		only_pair[v:get_id()] = true 
    	end
    end
    for k, v in ipairs(card_deck) do
    	table.insert(drawn, false)
    	if (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 1 then 
    		only_single[v:get_id()] = true
    	elseif (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 2 then 
    		only_pair[v:get_id()] = true 
    	end
    end


    local satisfied, three, pair, single, onlypair, onlysingle = check_hand(hand_ranks, only_pair, only_single)

    -- If already a full house, no draws needed
    if satisfied then return true, {} end

    local draws = {}

    for i = 1, hand_space do
	    for k, v in ipairs(card_deck) do
	    	--sendInfoMessage("checking: "..v.base.suit..v:get_id())
	    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
	    	elseif only_single[v:get_id()] or drawn[k] then 
	        -- If we need a three of a kind and this card helps, 
	        -- or if we need a pair and this card helps
	        elseif ((three < 1) and ((hand_ranks[v:get_id()] or 0) == 2)) or
	           ((pair - onlypair <= 1) and (((hand_ranks[v:get_id()] or 0) == 1) and (deck_ranks[v:get_id()] or 0) + (hand_ranks[v:get_id()] or 0) >= 2) or 
	           ((pair < 2) and (((hand_ranks[v:get_id()] or 0) == 1) and (deck_ranks[v:get_id()] or 0) + (hand_ranks[v:get_id()] or 0) > 2)) or 
	           (single + pair - onlypair - onlysingle < 1 and (deck_ranks[v:get_id()] or 0) + (hand_ranks[v:get_id()] or 0) > 2)) or 
	           ((single - onlysingle <= 1) and hand_space >= 4 and #draws < 2 and (deck_ranks[v:get_id()] or 0) + (hand_ranks[v:get_id()] or 0) > 2) then
	            table.insert(draws, v)
	            drawn[k] = true
	            hand_ranks[v:get_id()] = (hand_ranks[v:get_id()] or 0) + 1
	            deck_ranks[v:get_id()] = (deck_ranks[v:get_id()] or 0) - 1
	            if deck_ranks[v:get_id()] <= 0 then deck_ranks[v:get_id()] = nil end
	            --sendInfoMessage("want to draw: "..v.base.suit..v:get_id())
	            satisfied, three, pair, single, onlypair, onlysingle = check_hand(hand_ranks, only_pair, only_single)
	            if satisfied or #draws == hand_space then
	                break
	            end
	        end
	    end
	    if satisfied or #draws == hand_space then
            break
        end
	end

    if satisfied then
        return true, draws
    else
        return false, nil
    end
end

function hcm_draw_Flush_House(card_deck, card_hand, hand_space)
    -- Helper function to count occurrences of each rank
    local function count_ranks(cards)
        local ranks = {Hearts = {}, Diamonds = {}, Clubs = {}, Spades = {}}
        for _, v in ipairs(cards) do
        	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        	else
            	ranks[v.base.suit][v:get_id()] = (ranks[v.base.suit][v:get_id()] or 0) + 1
            end
        end
        return ranks
    end

    -- Check if hand already forms a full house or part of it
    local function check_hand(hand_ranks, only_pair, only_single)
        local overall = false
        local three_cnt, pair_cnt, single_cnt = 0, 0, 0
        local only_pair_cnt, only_single_cnt = 0, 0
        for k, count in pairs(hand_ranks) do
            if count >= 3 then three_cnt = three_cnt + 1 end
            if count >= 2 then pair_cnt = pair_cnt + 1 end
            if count == 2 and only_pair[k] then only_pair_cnt = only_pair_cnt + 1 end
            if count == 1 then single_cnt = single_cnt + 1 end
            if count == 1 and only_single[k] then only_single_cnt = only_single_cnt + 1 end
        end
        -- Scenario: 2 threes, 1 three 1 pair
        if three_cnt > 1 or (pair_cnt - three_cnt > 0 and three_cnt > 0) then 
        	overall = true 
        end

        return overall, three_cnt, pair_cnt, single_cnt, only_pair_cnt, only_single_cnt
    end

    -- Main logic
    local hand_ranks = count_ranks(card_hand)
	local deck_ranks = count_ranks(card_deck)
	local only_pair = {Hearts = {}, Diamonds = {}, Clubs = {}, Spades = {}}
    local only_single = {Hearts = {}, Diamonds = {}, Clubs = {}, Spades = {}}
    local drawn = {}
    for k, v in ipairs(card_hand) do
    	if (hand_ranks[v.base.suit][v:get_id()] or 0) + (deck_ranks[v.base.suit][v:get_id()] or 0) == 1 then 
    		only_single[v.base.suit][v:get_id()] = true
    	elseif (hand_ranks[v.base.suit][v:get_id()] or 0) + (deck_ranks[v.base.suit][v:get_id()] or 0) == 2 then 
    		only_pair[v.base.suit][v:get_id()] = true 
    	end
    end
    for k, v in ipairs(card_deck) do
    	table.insert(drawn, false)
    	if (hand_ranks[v.base.suit][v:get_id()] or 0) + (deck_ranks[v.base.suit][v:get_id()] or 0) == 1 then 
    		only_single[v.base.suit][v:get_id()] = true
    	elseif (hand_ranks[v.base.suit][v:get_id()] or 0) + (deck_ranks[v.base.suit][v:get_id()] or 0) == 2 then 
    		only_pair[v.base.suit][v:get_id()] = true 
    	end
    end

    for current_suit, temp_table in pairs(hand_ranks) do

	    local satisfied, three, pair, single, onlypair, onlysingle = check_hand(hand_ranks[current_suit], only_pair[current_suit], only_single[current_suit])

	    -- If already a full house, no draws needed
	    if satisfied then return true, {} end

	    local draws = {}

	    for i = 1, hand_space do
		    for k, v in ipairs(card_deck) do
		    	--sendInfoMessage("checking: "..v.base.suit..v:get_id())
		    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
		    	elseif v.base.suit ~= current_suit then
		    	elseif only_single[v.base.suit][v:get_id()] or drawn[k] then 
		        -- If we need a three of a kind and this card helps, 
		        -- or if we need a pair and this card helps
		        elseif ((three < 1) and ((hand_ranks[v.base.suit][v:get_id()] or 0) == 2)) or
		           ((pair - onlypair <= 1) and (((hand_ranks[v.base.suit][v:get_id()] or 0) == 1) and (deck_ranks[v.base.suit][v:get_id()] or 0) + (hand_ranks[v.base.suit][v:get_id()] or 0) >= 2) or 
		           ((pair < 2) and (((hand_ranks[v.base.suit][v:get_id()] or 0) == 1) and (deck_ranks[v.base.suit][v:get_id()] or 0) + (hand_ranks[v.base.suit][v:get_id()] or 0) > 2)) or 
		           (single + pair - onlypair - onlysingle < 1 and (deck_ranks[v.base.suit][v:get_id()] or 0) + (hand_ranks[v.base.suit][v:get_id()] or 0) > 2)) or 
		           ((single - onlysingle <= 1) and hand_space >= 4 and #draws < 2 and (deck_ranks[v.base.suit][v:get_id()] or 0) + (hand_ranks[v.base.suit][v:get_id()] or 0) > 2) then
		            table.insert(draws, v)
		            drawn[k] = true
		            hand_ranks[v.base.suit][v:get_id()] = (hand_ranks[v.base.suit][v:get_id()] or 0) + 1
		            deck_ranks[v.base.suit][v:get_id()] = (deck_ranks[v.base.suit][v:get_id()] or 0) - 1
		            if deck_ranks[v.base.suit][v:get_id()] <= 0 then deck_ranks[v.base.suit][v:get_id()] = nil end
		            --sendInfoMessage("want to draw: "..v.base.suit..v:get_id())
		            satisfied, three, pair, single, onlypair, onlysingle = check_hand(hand_ranks[v.base.suit], only_pair[v.base.suit], only_single[v.base.suit])
		            if satisfied or #draws == hand_space then
		                break
		            end
		        end
		    end
		    if satisfied or #draws == hand_space then
	            break
	        end
		end

	    if satisfied then
	        return true, draws
	    end
	end
	return false, nil
end

function hcm_draw_Two_Pairs(card_deck, card_hand, hand_space)
    -- Helper function to count occurrences of each rank
    local function count_ranks(cards)
        local ranks = {}
        for _, v in ipairs(cards) do
            if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
            else
                ranks[v:get_id()] = (ranks[v:get_id()] or 0) + 1
            end
        end
        return ranks
    end

    -- Check if hand already forms two pairs or part of it
    local function check_hand(hand_ranks, only_single)
        local pair_cnt, single_cnt, only_single_cnt = 0, 0, 0
        for k, count in pairs(hand_ranks) do
            if count >= 2 then pair_cnt = pair_cnt + 1 end
            if count == 1 then single_cnt = single_cnt + 1 end
            if count == 1 and only_single[k] then only_single_cnt = only_single_cnt + 1 end
        end
        -- Scenario: at least 2 pairs
        local satisfied = pair_cnt >= 2
        return satisfied, pair_cnt, single_cnt, only_single_cnt
    end

    -- Main logic
    local hand_ranks = count_ranks(card_hand)
    local deck_ranks = count_ranks(card_deck)

    local only_single = {}
    local drawn = {}
    for k, v in ipairs(card_hand) do
    	if (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 1 then 
    		only_single[v:get_id()] = true
    	end
    end
    for k, v in ipairs(card_deck) do
    	table.insert(drawn, false)
    	if (hand_ranks[v:get_id()] or 0) + (deck_ranks[v:get_id()] or 0) == 1 then 
    		only_single[v:get_id()] = true
    	end
    end

    local satisfied, pair, single, onlysingle = check_hand(hand_ranks, only_single)

    -- If already two pairs, no draws needed
    if satisfied then return true, {} end

    local draws = {}

    for i = 1, hand_space do
        for k, v in ipairs(card_deck) do
            -- If this card helps in forming a pair
            if v.highlighted and v.config.center ~= G.P_CENTERS.m_stone then
            elseif only_single[v:get_id()] or drawn[k] then 
            elseif ((hand_ranks[v:get_id()] or 0) == 1) or 
            	(pair < 2 and single - onlysingle <= 0) then
                table.insert(draws, v)
                drawn[k] = true
                hand_ranks[v:get_id()] = (hand_ranks[v:get_id()] or 0) + 1
                satisfied, pair, single, onlysingle = check_hand(hand_ranks, only_single)
                -- Break early if we have formed two pairs or reached the hand space limit
                if satisfied or #draws == hand_space then
                    break
                end
            end
        end
        if satisfied or #draws == hand_space then
            break
        end
    end

    if satisfied then
        return true, draws
    else
        return false, nil
    end
end

function hcm_draw_Flush(card_deck, card_hand, hand_space)

    local four_fingers = next(find_joker('Four Fingers'))
    local xtimes = 5 - (four_fingers and 1 or 0)

    -- Count occurrences of each suit in the hand
    local suit_counts = {Hearts = 0, Diamonds = 0, Clubs = 0, Spades = 0}
    for _, v in ipairs(card_hand) do
    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
    	else
        	suit_counts[v.base.suit] = suit_counts[v.base.suit] + 1
        end
    end

    local suit_counts_deck = {Hearts = 0, Diamonds = 0, Clubs = 0, Spades = 0}
    for _, v in ipairs(card_deck) do
        if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        else
        	suit_counts_deck[v.base.suit] = suit_counts_deck[v.base.suit] + 1
        end
    end

    -- Find the suit with the most cards and how many more are needed for a flush
    local max_suit, max_count = nil, 0
    for k, v in pairs(suit_counts) do
    	if v + suit_counts_deck[k] < xtimes then 
        elseif v > max_count then
            max_suit, max_count = k, v
        end
    end

    if max_suit == nil then 
    	for k, v in pairs(suit_counts) do
	    	if v + suit_counts_deck[k] < xtimes then 
	        elseif suit_counts_deck[k] >= hand_space then
	            max_suit, max_count = k, v
	        end
	    end
    end

    if max_suit == nil then return false, nil end

    local needed_for_flush = xtimes - max_count

    -- If we already have a flush or don't need to draw, return true
    if needed_for_flush <= 0 then return true, {} end

    -- If we need more cards than K, we can't form a flush
    if needed_for_flush > hand_space then return false, nil end

    -- Count how many cards of the needed suit are in the deck
    local available_in_deck = 0
    local draws = {}
    for _, v in ipairs(card_deck) do
    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        elseif v.base.suit == max_suit then
            available_in_deck = available_in_deck + 1
            table.insert(draws, v)
            if #draws == needed_for_flush then break end  -- Stop if we have enough draws
        end
    end

    -- Check if we have enough cards of the needed suit in the deck
    if available_in_deck >= needed_for_flush then
        return true, draws
    else
        return false, nil
    end
end

function hcm_draw_Straight(card_deck, card_hand, hand_space)
	local four_fingers = next(find_joker('Four Fingers'))
    local shortcut = next(find_joker('Shortcut'))

    -- Generate a table of all ranks, treating Ace as both 1 and 14
    local function generate_all_ranks()
        local ranks = {}
        for i = 1, 14 do
            ranks[i] = false
        end
        return ranks
    end

    -- Populate the ranks from hand and part of deck that can be used (up to K cards)
    local function populate_ranks_from_cards(cards, ranks, in_hand, hand_cond)
        for _, v in ipairs(cards) do
        	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        	else
	            local current_rank = v:get_id()
	            ranks[current_rank] = true
	            if in_hand then 
	            	hand_cond[current_rank] = true 
	            	if current_rank == 14 then hand_cond[1] = true end
	            end
	            -- Treat Ace as both 1 and 14
	            if current_rank == 14 then ranks[1] = true end
	        end
        end
    end

    -- Find the starting rank of the straight sequence if possible
    local function find_straight_start(ranks, hand_cond)
    	-- 10 is the highest start for a 5-card straight
    	local upper_bound = four_fingers and 11 or 10
    	local chain_req = four_fingers and 4 or 5
        for start_rank = 1, upper_bound do  
        	local chain_exist = true
        	local draw_needed = 0
        	local gapped = false
        	local current_rank = start_rank
        	local chain_checked = 0
        	local draws = {}
        	--sendInfoMessage("Checking "..start_rank)
            while chain_checked < chain_req and current_rank < 15 do
            	--sendInfoMessage("Then checking "..current_rank)
                if not ranks[current_rank] then
                    if shortcut and not gapped and current_rank ~= start_rank then
                        gapped = true 
                        current_rank = current_rank + 1
                        --sendInfoMessage("Gapped!")
                    else
                    	sendInfoMessage("Nope!")
                        chain_exist = false
                        break
                    end
                else 
                	--sendInfoMessage("needed! ")
                	if not hand_cond[current_rank] then 
                		--sendInfoMessage("We don't have it yet! draw! ")
                		draw_needed = draw_needed + 1 
                		table.insert(draws, (current_rank == 1 and 14 or current_rank))
                	end
                	current_rank = current_rank + 1
                	gapped = false
                	chain_checked = chain_checked + 1
                end
                if chain_checked >= chain_req then break end
            end
            if chain_checked < chain_req or not chain_exist then 
            elseif draw_needed <= hand_space then
            	--sendInfoMessage("FOUND!")
            	--for k, v in ipairs(draws) do sendInfoMessage("draw "..v) end
                return true, draws
            end
        end
        return false, nil  -- No straight start found
    end

    local all_ranks = generate_all_ranks()
    local hand_condition = generate_all_ranks()
    populate_ranks_from_cards(card_hand, all_ranks, true, hand_condition)
    populate_ranks_from_cards(card_deck, all_ranks, false, hand_condition)

    local straight_possible, required_draws = find_straight_start(all_ranks, hand_condition)
    local checklist = {}
    if straight_possible then
    	for _, card_needed in ipairs(required_draws) do
			checklist[card_needed] = true
		end
    	local draws = {}
    	for k, v in ipairs(card_deck) do
	    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
	        else
	        	if checklist[v:get_id()] then 
	        		table.insert(draws, v)
	        		checklist[v:get_id()] = false 
	        	end
	        end
	    end
        return true, draws
    else
        return false, {}  -- Cannot form a straight
    end
end

function hcm_draw_Straight_Flush(card_deck, card_hand, hand_space)
	local four_fingers = next(find_joker('Four Fingers'))
    local shortcut = next(find_joker('Shortcut'))

    -- Generate a table of all ranks, treating Ace as both 1 and 14
    local function generate_all_ranks()
        local ranks = {}
        for i = 1, 14 do
            ranks[i] = false
        end
        return ranks
    end

    -- Populate the ranks from hand and part of deck that can be used (up to K cards)
    local function populate_ranks_from_cards(cards, ranks, in_hand, hand_cond, current_suit)
        for _, v in ipairs(cards) do
        	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
        	elseif v.base.suit ~= current_suit then 
        	else
	            local current_rank = v:get_id()
	            ranks[current_rank] = true
	            if in_hand then 
	            	hand_cond[current_rank] = true 
	            	if current_rank == 14 then hand_cond[1] = true end
	            end
	            -- Treat Ace as both 1 and 14
	            if current_rank == 14 then ranks[1] = true end
	        end
        end
    end

    -- Find the starting rank of the straight sequence if possible
    local function find_straight_start(ranks, hand_cond)
    	-- 10 is the highest start for a 5-card straight
    	local upper_bound = four_fingers and 11 or 10
    	local chain_req = four_fingers and 4 or 5
        for start_rank = 1, upper_bound do  
        	local chain_exist = true
        	local draw_needed = 0
        	local gapped = false
        	local current_rank = start_rank
        	local chain_checked = 0
        	local draws = {}
        	--sendInfoMessage("Checking "..start_rank)
            while chain_checked < chain_req and current_rank < 15 do
            	--sendInfoMessage("Then checking "..current_rank)
                if not ranks[current_rank] then
                    if shortcut and not gapped and current_rank ~= start_rank then
                        gapped = true 
                        current_rank = current_rank + 1
                        --sendInfoMessage("Gapped!")
                    else
                    	--sendInfoMessage("Nope!")
                        chain_exist = false
                        break
                    end
                else 
                	--sendInfoMessage("needed! ")
                	if not hand_cond[current_rank] then 
                		--sendInfoMessage("We don't have it yet! draw! ")
                		draw_needed = draw_needed + 1 
                		table.insert(draws, (current_rank == 1 and 14 or current_rank))
                	end
                	current_rank = current_rank + 1
                	gapped = false
                	chain_checked = chain_checked + 1
                end
                if chain_checked >= chain_req then break end
            end
            if chain_checked < chain_req or not chain_exist then 
            elseif draw_needed <= hand_space then
            	--sendInfoMessage("FOUND!")
            	--for k, v in ipairs(draws) do sendInfoMessage("draw "..v) end
                return true, draws
            end
        end
        return false, nil  -- No straight start found
    end
    local supported_suit = {Hearts = 0, Diamonds = 0, Clubs = 0, Spades = 0}
    for current_suit, _ in pairs(supported_suit) do 
	    local all_ranks = generate_all_ranks()
	    local hand_condition = generate_all_ranks()
	    populate_ranks_from_cards(card_hand, all_ranks, true, hand_condition, current_suit)
	    populate_ranks_from_cards(card_deck, all_ranks, false, hand_condition, current_suit)

	    local straight_possible, required_draws = find_straight_start(all_ranks, hand_condition)
	    local checklist = {}
	    if straight_possible then
	    	for _, card_needed in ipairs(required_draws) do
				checklist[card_needed] = true
			end
	    	local draws = {}
	    	for k, v in ipairs(card_deck) do
		    	if v.highlighted or v.config.center == G.P_CENTERS.m_stone then
		    	elseif v.base.suit ~= current_suit then
		        else
		        	if checklist[v:get_id()] then 
		        		table.insert(draws, v)
		        		checklist[v:get_id()] = false 
		        	end
		        end
		    end
	        return true, draws
	    else
	        return false, {}  -- Cannot form a straight
	    end
	end
end

local evaluate_play_OG = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(self, e)
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM The Zoo' then
			--sendInfoMessage("eval play zoo!")
			--sendInfoMessage(#G.play.cards)
			local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
            jkr.ability.extra.transfer_card = scoring_hand[1]
        	if #scoring_hand > 1 then
        		card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_the_zoo"]["card_eval"]})
            end
            for i=1, #scoring_hand do
            	if i == 1 then
            	elseif scoring_hand[i]:get_id() == jkr.ability.extra.transfer_card:get_id() then
            		card_eval_status_text(scoring_hand[i], 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_the_zoo"]["card_eval_pc"], chip_mod=1})
            		for idx, val in ipairs(G.play.cards) do
        				if scoring_hand[i] == G.play.cards[idx] then
        					local percent = 1.15 - (idx-0.999)/(#G.play.cards-0.998)*0.3
        					G.play.cards[idx]:flip()
        					play_sound('card1', percent)
        					G.play.cards[idx]:juice_up(0.3, 0.3)
                    		G.play.cards[idx] = copy_card(jkr.ability.extra.transfer_card, G.play.cards[idx])
                    		percent = 0.85 + (idx-0.999)/(#G.play.cards-0.998)*0.3
    						G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.1,func = function() G.play.cards[idx]:flip();play_sound('tarot2', percent, 0.6);G.play.cards[idx]:juice_up(0.3, 0.3);return true end }))
                    		--G.play.cards[idx]:juice_up()
                    	end
                    end
                end
            end 
		end 
		if jkr.ability.name == 'HCM Bokka' then
			local protected = false
            for k, v in ipairs(G.play.cards) do
                if v.debuff then
                    protected = true
                end
            end
            if protected then
             	card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_bokka"]["card_eval"]})
                for idx, val in ipairs(G.play.cards) do
    				if val.debuff then
    					local percent = 1.15 - (idx-0.999)/(#G.play.cards-0.998)*0.3
    					G.play.cards[idx]:flip()
    					play_sound('card1', percent)
    					G.play.cards[idx]:juice_up(0.3, 0.3)
                		G.play.cards[idx]:set_debuff(false)
                		percent = 0.85 + (idx-0.999)/(#G.play.cards-0.998)*0.3
						G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.1,func = function() G.play.cards[idx]:flip();play_sound('tarot2', percent, 0.6);G.play.cards[idx]:juice_up(0.3, 0.3);return true end }))
                		--G.play.cards[idx]:juice_up()
                	end
                end
            end
		end 
	end
	sendInfoMessage("Actual Eval Play")
	result = evaluate_play_OG(self, e)
	sendInfoMessage("Done!")
	for _, card in pairs(G.play.cards) do
		local is_debuffed = false 
		if card.debuff then is_debuffed = true end
		if card.xability and card.xability.handname == "XPlayingSpade9" then is_debuffed = false end
		if card.xability and G.GAME.current_round.hands_played == 0 and not is_debuffed then 
			if G.GAME.hcm_played == nil then
				local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
				--card = G.GAME.hcm_held
				local highcard = nil
            	for k, v in ipairs(scoring_hand) do
					if v.config.center == G.P_CENTERS.m_stone then
					else highcard = v end
				end 
				if text == "High Card" and highcard == card then
		        	if card.config.center == G.P_CENTERS.m_stone then return result end
		        	local xcard_name = hcm_determine_xplaying_key(card)
		        	sendInfoMessage(xcard_name)
		        	if G.GAME.hcm_disabled and G.GAME.hcm_disabled[card.xability.handname] then 
						sendInfoMessage("disabled!")
						hcm_san_galgano_dialogue(nil, "disabled")
					elseif xplaying_config[xcard_name] then
		        		xplay(xcard_name, card)
		        		G.GAME.hcm_held = copy_card(card)
		        		--sendInfoMessage("Copied "..G.GAME.hcm_held.base.suit..G.GAME.hcm_held:get_id())
		        		G.GAME.hcm_held:remove_from_area()
		        		G.GAME.hcm_held.states.visible = false
		        		--sendInfoMessage("Copied "..G.GAME.hcm_held.base.suit..G.GAME.hcm_held:get_id())
		        		card.destroyed = true
		        		G.E_MANAGER:add_event(Event({
			        		func = function()
					            card:start_dissolve({G.C.RED}, nil, 0)
					            return true 
					        end 
					    }))
		        		G.GAME.hcm_played = true
		        	end
		        	--G.GAME.hcm_played = true
		        end 
			end
		end
	end
	return result
end

local play_cards_from_highlighted_OG = G.FUNCS.play_cards_from_highlighted

G.FUNCS.play_cards_from_highlighted = function(e)
	sendInfoMessage("Play cards from highlighted!")
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM San Galgano' then
			local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
			if text == "High Card" then
				for k, v in ipairs(G.hand.highlighted) do
			    	if v.xability and v.xability.handname == "XPlayingSpadeK" then
			    		if jkr.ability.extra.hesitation >= 3 then
			    		else 
			    			hcm_san_galgano_dialogue(jkr, "hesitate")
			    			G.hand:unhighlight_all()
			    			G.E_MANAGER:add_event(Event({
						        trigger = 'immediate',
						        func = function()
						            G.STATE = G.STATES.HAND_PLAYED
						            G.STATE_COMPLETE = true
						            return true
						        end
						    })) 
						    G.E_MANAGER:add_event(Event({
			                    trigger = 'immediate',
			                    func = function()
			                        G.STATE_COMPLETE = false
			                        return true
			                    end
			                }))
			    			return
			    		end
				    end
			    end
			end
		end
		if jkr.ability.name == 'HCM Staff Master' then
			sendInfoMessage("Staff Master Generation Process!")
			if #G.hand.highlighted <= 2 then return play_cards_from_highlighted_OG() end
			local suits = {
				Hearts=0, 
				Diamonds=0, 
				Clubs=0, 
				Spades=0
			}
		    local ranks = {}
		    local temp_hand_suits = {}
		    local temp_hand_ranks = {}
		    for k, v in ipairs(G.hand.highlighted) do
		    	if v.config.center == G.P_CENTERS.m_stone then
		    	else
			    	table.insert(temp_hand_suits, v.base.suit)
			    	table.insert(temp_hand_ranks, v:get_id())
			    	if ranks[v:get_id()] then ranks[v:get_id()] = ranks[v:get_id()] + 1
			    	else ranks[v:get_id()] = 1 end
			    end
		    end
		    if #temp_hand_suits == 0 then return play_cards_from_highlighted_OG() end
		    local current_hand = hcm_best_hand(temp_hand_suits, temp_hand_ranks)
		    
		    if current_hand == "Three of a Kind" then 
		    	local target_rank = nil
		    	for k, v in pairs(ranks) do
		    		if v == 3 then target_rank = k end
		    	end
		    	for k, v in ipairs(temp_hand_suits) do 
			    	if temp_hand_ranks[k] == target_rank then 
			    		if suits[v] then suits[v] = suits[v] + 1 end
			    	end
			    end
			    local target_suit = nil
			    for k, v in pairs(suits) do 
			    	if v == 0 and target_suit == nil then target_suit = k
			    	elseif v == 1 then
			    	else 
			    		target_suit = nil 
			    		break 
			    	end
			    end
			    if target_rank == nil or target_suit == nil then return play_cards_from_highlighted_OG() end
			    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
		    
			    local fake_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS['H_A'], G.P_CENTERS['c_base'], {playing_card = G.playing_card})

			    local card_encode = string.sub(target_suit, 1, 1)..'_'

			    local card_suffix = target_rank < 10 and tostring(target_rank) or
			                        target_rank == 10 and 'T' or target_rank == 11 and 'J' or
			                        target_rank == 12 and 'Q' or target_rank == 13 and 'K' or
			                        target_rank == 14 and 'A'
			    card_encode = card_encode .. card_suffix

			    fake_card:set_base(G.P_CARDS[card_encode])
			    fake_card:add_to_deck()
			    G.deck.config.card_limit = G.deck.config.card_limit + 1
			    table.insert(G.playing_cards, fake_card)
			    G.hand:emplace(fake_card)
			    fake_card.states.visible = nil

			    G.E_MANAGER:add_event(Event({
			        func = function()
			            fake_card:start_materialize()
			            return true
			        end
			    })) 
			    table.insert(G.hand.highlighted, fake_card)
			    card_eval_status_text(fake_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_staff_master"]["card_eval"]})
		    else
		    	return play_cards_from_highlighted_OG()
		    end
		end
		if jkr.ability.name == 'HCM Faceless' then
			sendInfoMessage("Faceless Generation Process!")
			jkr.ability.extra.faceless_trigger = false
			if #G.hand.highlighted > 4 then return play_cards_from_highlighted_OG() end
			local suits = {"Hearts", "Diamonds", "Clubs", "Spades"}
		    local ranks = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
		    local temp_hand_suits = {}
		    local temp_hand_ranks = {}
		    for k, v in ipairs(G.hand.highlighted) do
		    	if v.config.center == G.P_CENTERS.m_stone then
		    	elseif v.config.center == G.P_CENTERS.m_wild then
		    		table.insert(temp_hand_suits, "Wild") 
		    		table.insert(temp_hand_ranks, v:get_id())
		    	else
			    	table.insert(temp_hand_suits, v.base.suit)
			    	table.insert(temp_hand_ranks, v:get_id())
			    end
		    end
		    if #temp_hand_suits == 0 then return play_cards_from_highlighted_OG() end
		    local temp_card_suit = "Meh"
		    local temp_card_rank = 0
		    table.insert(temp_hand_suits, temp_card_suit)
		    table.insert(temp_hand_ranks, temp_card_rank)
		    
			local hand_priority = {}
			for k, v in ipairs(G.handlist) do
				hand_priority[v] = k
				-- The smaller the better!
			end
			local current_hand = nil
			local best_hand = 'High Card'
			local best_suit = nil 
			local best_rank = nil
			for _, current_rank in ipairs(ranks) do 
				for _, current_suit in ipairs(suits) do 
				    temp_hand_suits[#temp_hand_suits] = current_suit
				    temp_hand_ranks[#temp_hand_ranks] = current_rank
				    current_hand = hcm_best_hand(temp_hand_suits, temp_hand_ranks)
				    if hand_priority[current_hand] < hand_priority[best_hand] then 
				    	best_hand = current_hand
				    	best_suit = current_suit
				    	best_rank = current_rank
				    end
				end
			end

			if best_suit == nil or best_rank == nil then return play_cards_from_highlighted_OG() end

			sendInfoMessage("Best Match: " .. best_hand)
			sendInfoMessage("Inserting " .. best_rank .." of ".. best_suit)

			jkr.ability.extra.faceless_trigger = true
			G.playing_card = (G.playing_card and G.playing_card + 1) or 1
		    
		    local fake_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS['H_A'], G.P_CENTERS['c_base'], {playing_card = G.playing_card})

		    local card_encode = string.sub(best_suit, 1, 1)..'_'

		    local card_suffix = best_rank < 10 and tostring(best_rank) or
		                        best_rank == 10 and 'T' or best_rank == 11 and 'J' or
		                        best_rank == 12 and 'Q' or best_rank == 13 and 'K' or
		                        best_rank == 14 and 'A'
		    card_encode = card_encode .. card_suffix

		    fake_card:set_base(G.P_CARDS[card_encode])
		    fake_card:add_to_deck()
		    G.deck.config.card_limit = G.deck.config.card_limit + 1
		    table.insert(G.playing_cards, fake_card)
		    G.hand:emplace(fake_card)
		    fake_card.states.visible = nil

		    G.E_MANAGER:add_event(Event({
		        func = function()
		            fake_card:start_materialize()
		            return true
		        end
		    })) 
		    table.insert(G.hand.highlighted, fake_card)
		    card_eval_status_text(fake_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_faceless"]["card_eval"]})
		end
		if jkr.ability.name == 'HCM Musical Alchemist' then
			sendInfoMessage("Musical Alchemist Generation Process!")
			if #G.hand.highlighted ~= 4 then return play_cards_from_highlighted_OG() end
			local suits = {"Hearts", "Diamonds", "Clubs", "Spades"}
		    local ranks = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
		    local temp_hand_suits = {}
		    local temp_hand_ranks = {}
		    for k, v in ipairs(G.hand.highlighted) do
		    	if v.config.center == G.P_CENTERS.m_stone then
		    	elseif v.config.center == G.P_CENTERS.m_wild then
		    		table.insert(temp_hand_suits, "Wild") 
		    		table.insert(temp_hand_ranks, v:get_id())
		    	else
			    	table.insert(temp_hand_suits, v.base.suit)
			    	table.insert(temp_hand_ranks, v:get_id())
			    end
		    end
		    if #temp_hand_ranks == 0 then return play_cards_from_highlighted_OG() end
		    local temp_card_suit = "Wild"
		    local temp_card_rank = 4
		    table.insert(temp_hand_suits, temp_card_suit)
		    table.insert(temp_hand_ranks, temp_card_rank)
			local current_hand = hcm_best_hand(temp_hand_suits, temp_hand_ranks)
			if current_hand == 'Flush' or current_hand == 'Flush Five' or current_hand == 'Flush House' then
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
		    
			    local card_encode = 'D_4'
			    local fake_card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[card_encode], G.P_CENTERS['c_base'], {playing_card = G.playing_card})

				fake_card:set_ability(G.P_CENTERS.m_wild, nil, true)
			    fake_card:add_to_deck()
			    G.deck.config.card_limit = G.deck.config.card_limit + 1
			    table.insert(G.playing_cards, fake_card)
			    G.hand:emplace(fake_card)
			    fake_card.states.visible = nil

			    G.E_MANAGER:add_event(Event({
			        func = function()
			            fake_card:start_materialize()
			            return true
			        end
			    })) 
			    table.insert(G.hand.highlighted, fake_card)
			    card_eval_status_text(fake_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_musical_alchemist"]["card_eval"]})
			else
				return play_cards_from_highlighted_OG()
			end
		end
		if jkr.ability.name == 'HCM Juggling Gun' then
			sendInfoMessage("Juggling Gun!")
			local lowest_unhighlighted_card = nil
			local lowest_card_value = nil
			for k, v in ipairs(G.hand.cards) do
				if v.highlighted then 
				else
			    	if v.config.center == G.P_CENTERS.m_stone then
			    		if lowest_card_value == nil then 
			    			lowest_card_value = 50
			    			lowest_unhighlighted_card = v 
			    		end
			    	else
				    	if lowest_card_value == nil or v:get_id() < lowest_card_value then 
				    		lowest_card_value = v:get_id()
				    		lowest_unhighlighted_card = v
				    	end
				    end
				end
		    end
		    if lowest_unhighlighted_card == nil then 
		    else
		    	table.insert(G.hand.highlighted, lowest_unhighlighted_card)
		    	card_eval_status_text(lowest_unhighlighted_card, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_juggling_gun"]["card_eval"]})
			end
		end
	end
	return play_cards_from_highlighted_OG(e)
end

local update_draw_to_hand_OG = Game.update_draw_to_hand

function Game:update_draw_to_hand(dt)
	--sendInfoMessage("Update draw to hand!")
	if hcm_has_sq then 
		if hcm_sq and hcm_sq.ability.extra.bonus_hand then 
			self.STATE = self.STATES.HAND_PLAYED
			sendInfoMessage("state reverted!")
			return true
		end
	end
	update_draw_to_hand_OG(self, dt)
end

local update_new_round_OG = Game.update_new_round

function Game:update_new_round(dt)
	if hcm_has_sq then 
		if hcm_sq and hcm_sq.ability.extra.bonus_hand then 
			self.STATE = self.STATES.HAND_PLAYED
			sendInfoMessage("state reverted!")
			return true
		end
	end
	--sendInfoMessage("Leaked into new rounds!")
	update_new_round_OG(self, dt)
end

local end_round_OG = end_round 
function end_round()
	sendInfoMessage("end round now!")
	if hcm_has_sq and hcm_sq and hcm_sq.ability.extra.indicator then 
		hcm_sq.ability.extra.indicator = false 
		sendInfoMessage("Actually, end of round skipped!")
	else
		end_round_OG()
	end
end

local update_hand_played_OG = Game.update_hand_played

function Game:update_hand_played(dt)
	--sendInfoMessage("Update Hand Played")
    if self.buttons then self.buttons:remove(); self.buttons = nil end
    if self.shop then self.shop:remove(); self.shop = nil end

    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
        if G.GAME.chips - G.GAME.blind.chips >= 0 or G.GAME.current_round.hands_left < 1 then
            G.STATE = G.STATES.NEW_ROUND
        else
            G.STATE = G.STATES.DRAW_TO_HAND
        end
        G.STATE_COMPLETE = false
        return true
        end
        }))
    end
end


local draw_from_deck_to_hand_OG = G.FUNCS.draw_from_deck_to_hand

G.FUNCS.draw_from_deck_to_hand = function(e)
	--sendInfoMessage("draw cards now!")
	if hcm_has_sq and hcm_sq and hcm_sq.ability.extra.indicator then 
		hcm_sq.ability.extra.indicator = false 
		--sendInfoMessage("Actually, skipped!")
	else
		return draw_from_deck_to_hand_OG(e)
	end
end

local draw_from_play_to_discard_OG = G.FUNCS.draw_from_play_to_discard

G.FUNCS.draw_from_play_to_discard = function(e)
	draw_from_play_to_discard_OG()
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM Typhoid Mary' then
			sendInfoMessage("Typhoid Mary!")
			if jkr.ability.extra.bonus_hand then
				sendInfoMessage("Typhoid Mary Bonus Set!")
				G.E_MANAGER:add_event(Event({
			        trigger = 'before',
			        func = function()
			        	card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_typhoid_mary"]["card_eval"]})
						sendInfoMessage("Typhoid Mary Bonus Triggered!")
			        	G.E_MANAGER:add_event(Event({
		                    trigger = 'before',
		                    func = function()
		                        for k, v in ipairs(jkr.ability.extra.highlighted_cards) do
					        		draw_card(G.discard, G.hand, k*100/#jkr.ability.extra.highlighted_cards,'up', nil ,v, 0.005, k%2==0, nil, math.max((21-k)/20,0.7))
					        	end
					        	sendInfoMessage(#jkr.ability.extra.highlighted_cards)
					        	return true
		                    end
		                }))

			        	G.E_MANAGER:add_event(Event({
		                    trigger = 'before',
		                    func = function()
		                        for k, v in ipairs(jkr.ability.extra.highlighted_cards) do
									table.insert(G.hand.highlighted, v)
								end
								sendInfoMessage(#G.hand.highlighted)
					        	return true
		                    end
		                }))
		             	G.E_MANAGER:add_event(Event({
		                    trigger = 'immediate',
		                    func = function()
		                    	sendInfoMessage("Time to play")
		                        ease_hands_played(1)
		                        G.FUNCS.play_cards_from_highlighted(e)
					        	return true
		                    end
		                }))

			            return true
			        end
			    }))
			end
		end
	end
	--]]--
    --draw_from_play_to_discard_OG()
	for _, jkr in pairs(G.jokers.cards) do
    	if jkr.ability.name == 'HCM Punker Viper' then
			sendInfoMessage("Punker Viper!")
		    card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_punker_viper"]["card_eval"]})
            G.FUNCS.draw_from_discard_to_deck(e)
		end
	end
end

local flame_handler_OG = G.FUNCS.flame_handler

G.FUNCS.flame_handler = function(e)
	flame_handler_OG(e)
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM Lethal Scoville' then
			if not hcm_flamed then
				if G.ARGS.score_intensity.earned_score >= G.ARGS.score_intensity.required_score and G.ARGS.score_intensity.required_score > 0 then
			    	sendInfoMessage("Play for the Fire!")
			    	if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			            G.E_MANAGER:add_event(Event({
			                trigger = 'before',
			                delay = 0.0,
			                func = (function()
			                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sixth')
			                        card:add_to_deck()
			                        G.consumeables:emplace(card)
			                        G.GAME.consumeable_buffer = 0
			                    return true
			                end)}))
			            card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_lethal_scoville"]["card_eval"], colour = G.C.SECONDARY_SET.Spectral})
			        end
			        hcm_flamed = true
			    end
			end
		end
	end
end

function hcm_best_hand(current_suits, current_ranks)
    local suits, ranks = {}, {}
    for i, _ in ipairs(current_suits) do
    	if current_suits[i] == "Wild" then
    		local all_suits = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
    		if SMODS and SMODS.Card and SMODS.Card.SUIT_LIST then all_suits = SMODS.Card.SUIT_LIST end
    		for _, cur_suit in ipairs(all_suits) do
    			suits[cur_suit] = (suits[cur_suit] or 0) + 1
    		end
    	else 
        	suits[current_suits[i]] = (suits[current_suits[i]] or 0) + 1
        end
        ranks[current_ranks[i]] = (ranks[current_ranks[i]] or 0) + 1
        -- Ace can also act as rank 1 for straights
        if current_ranks[i] == 14 then
            ranks[1] = (ranks[1] or 0) + 1
        elseif current_ranks[i] == 1 then
        	ranks[14] = (ranks[14] or 0) + 1
        end
    end

    local four_fingers = next(find_joker('Four Fingers'))
    local shortcut = next(find_joker('Shortcut'))

    local function hcm_check_flush()
        for _, count in pairs(suits) do
            if count >= (four_fingers and 4 or 5) then return true end
        end
        return false
    end

    local function hcm_check_straight()
        local count = 0
        local gapped = false
        for i = 1, 14 do
            if ranks[i] then
                count = count + 1
                gapped = false
                if count == (four_fingers and 4 or 5) then return true end
            elseif shortcut and not gapped then
            	gapped = true
            else
                count = 0
            end
        end
        return false
    end

    local function hcm_check_straight_flush()
        return hcm_check_flush() and hcm_check_straight()
    end

    local function hcm_check_of_a_kind()
        local max_kind, pair = 0, 0
        for k, count in pairs(ranks) do
        	if k == 1 then
        	else
	            if count == 2 then pair = pair + 1 end
	            if count > max_kind then max_kind = count end
	        end
        end
        return max_kind, pair
    end

    local max_kind, pair = hcm_check_of_a_kind()
    if max_kind == 5 and hcm_check_flush() then return "Flush Five" end
    if max_kind == 3 and pair > 0 and hcm_check_flush() then return "Flush House" end
    if max_kind == 5 then return "Five of a Kind" end  -- With wildcards or special rules
    if hcm_check_straight_flush() then return "Straight Flush" end
    if max_kind == 4 then return "Four of a Kind" end
    if max_kind == 3 and pair > 0 then return "Full House" end
    if hcm_check_flush() then return "Flush" end
    if hcm_check_straight() then return "Straight" end
    if max_kind == 3 then return "Three of a Kind" end
    if pair >= 2 then return "Two Pair" end
    if pair == 1 then return "Pair" end
    return "High Card"
end

local back_trigger_effect_OG = Back.trigger_effect
function Back:trigger_effect(args)

	local roundandround = false 
	local rnr_jkr = nil
	for _, jkr in pairs(G.jokers.cards) do
		if jkr.ability.name == 'HCM Round and Round' then
			roundandround = true 
			rnr_jkr = jkr
		end
	end

	if args.context == 'final_scoring_step' and roundandround and self.name ~= 'Plasma Deck' then
		local new_args = {context = 'final_scoring_step', chips = args.chips, mult = args.mult}	
		local result1, result2 = back_trigger_effect_OG(self, args)
		sendInfoMessage("Checking Round and Round!")
		if rnr_jkr.ability.extra.required_sat and args.context == 'final_scoring_step' then
	        sendInfoMessage("Round and Round!")
	        local tot = new_args.chips + new_args.mult
	        new_args.chips = math.floor(tot/2)
	        new_args.mult = math.floor(tot/2)
	        update_hand_text({delay = 0}, {mult = new_args.mult, chips = new_args.chips})

	        G.E_MANAGER:add_event(Event({
	            func = (function()
	                local text = G.localization.descriptions["Joker"]["j_hcm_round_and_round"]["card_eval"]
	                play_sound('gong', 0.94, 0.3)
	                play_sound('gong', 0.94*1.5, 0.2)
	                play_sound('tarot1', 1.5)
	                ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
	                ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
	                attention_text({
	                    scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
	                })
	                G.E_MANAGER:add_event(Event({
	                    trigger = 'after',
	                    blockable = false,
	                    blocking = false,
	                    delay =  4.3,
	                    func = (function() 
	                            ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
	                            ease_colour(G.C.UI_MULT, G.C.RED, 2)
	                        return true
	                    end)
	                }))
	                G.E_MANAGER:add_event(Event({
	                    trigger = 'after',
	                    blockable = false,
	                    blocking = false,
	                    no_delete = true,
	                    delay =  6.3,
	                    func = (function() 
	                        G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
	                        G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
	                        return true
	                    end)
	                }))
	                return true
	            end)
	        }))

	        delay(0.6)
	        sendInfoMessage("The score should be: "..(new_args.chips * new_args.mult))
	        --return args.chips, args.mult
			if result1 ~= nil then 
				return result1, result2 
			end 
	        return new_args.chips, new_args.mult
	        
	    end
		sendInfoMessage("The args should be: "..new_args.chips.." / "..new_args.mult)
		
	end

	return back_trigger_effect_OG(self, args)

	--[[
	
	]]--
	
end

local deck_info_OG = G.UIDEF.deck_info

function G.UIDEF.deck_info(_show_remaining)

	if G.GAME.hcm_balor then
		sendInfoMessage("Balor!")

	  	return create_UIBox_generic_options({contents ={create_tabs(
		    {tabs = _show_remaining and {
		        {
		          label = localize('b_remaining'),
		          chosen = true,
		          tab_definition_function = G.UIDEF.view_deck,
		          tab_definition_function_args = true,
		        },
		        {
		          label = G.localization.descriptions["Joker"]["j_hcm_balor"]["card_eval"],
		          tab_definition_function = G.UIDEF.view_deck_balor,
		          tab_definition_function_args = true,
		        },
		        {
		            label = localize('b_full_deck'),
		            tab_definition_function = G.UIDEF.view_deck
		        },
		    } or {
		      {
		        label = localize('b_full_deck'),
		        chosen = true,
		        tab_definition_function = G.UIDEF.view_deck
		      },
		    },
		    tab_h = 8,
		    snap_to_nav = true})}})
	end
	return deck_info_OG(_show_remaining)
end

function G.UIDEF.view_deck_balor(unplayed_only)
	local deck_tables = {}
	G.VIEWING_DECK = true
	local cards_in_order = {}
	for k, v in ipairs(G.deck.cards) do
		table.insert(cards_in_order, v)
	end

	local view_deck = CardArea(
		G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
		6.5*G.CARD_W,
		0.6*G.CARD_H,
		{
			card_limit = #cards_in_order, 
			type = 'title', 
			view_deck = true, 
			highlight_limit = 0, 
			card_w = G.CARD_W*0.7, 
			draw_layers = {'card'}
		}
	)

	table.insert(deck_tables, 
		{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
			{n=G.UIT.O, config={object = view_deck}}
		}}
	)

	for i = #cards_in_order, 1, -1 do
		if cards_in_order[i] then
			local greyed, _scale = nil, 0.7
			if unplayed_only and not ((cards_in_order[i].area and cards_in_order[i].area == G.deck) or cards_in_order[i].ability.wheel_flipped) then
				greyed = true
			end
			local copy = copy_card(cards_in_order[i],nil, _scale)
			copy.greyed = greyed
			copy.T.x = view_deck.T.x + view_deck.T.w/2
			copy.T.y = view_deck.T.y

			copy:hard_set_T()
			view_deck:emplace(copy)
	    end
	end

	local t = 
	{n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
		{n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={}},
		{n=G.UIT.R, config={align = "cm"}, nodes={
  			{n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}
		}},
		{n=G.UIT.R, config={align = "cm", minh = 0.8, padding = 0.05}, nodes={
	  		{n=G.UIT.R, config={align = "cm"}, nodes={
	    		{n=G.UIT.T, config={text = G.localization.descriptions["Joker"]["j_hcm_balor"]["card_explained"],colour = G.C.WHITE, scale =0.3}},
	  		}} or nil,
		}}
	}}
	return t
end

function hcm_wing_wind_bundle(card, already_happening, jkr)
	local disabled_seal = "None" 
	local hcm_triggered = false
	if already_happening then disabled_seal = already_happening end
	if disabled_seal ~= 'Gold' and card.seal == 'Gold' then
		if jkr then card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
        ease_dollars(3)
        hcm_triggered = true
        --card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_gold')})
    end
	if disabled_seal ~= 'Purple' and card.seal == 'Purple' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        if jkr then card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                    local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, '8ba')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                return true
            end)}))
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
    	hcm_triggered = true
    end
	if disabled_seal ~= 'Blue' and card.seal == 'Blue' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        if jkr then card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_wing_wind"]["card_eval"]}) end
        local card_type = 'Planet'
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                    local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, 'blusl')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                return true
            end)}))
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
    	hcm_triggered = true
    end
    return hcm_triggered
end

function Game:update_xplaying_pack(dt)
    if self.buttons then self.buttons:remove(); self.buttons = nil end
    if self.shop then G.shop.alignment.offset.y = G.ROOM.T.y+11 end

    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        G.CONTROLLER.interrupt.focus = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                    timer = 0.015,
                    scale = 0.3,
                    initialize = true,
                    lifespan = 3,
                    speed = 0.2,
                    padding = -1,
                    attach = G.ROOM_ATTACH,
                    colours = {G.C.BLACK, G.C.RED},
                    fill = true
                })
                G.booster_pack_sparkles.fade_alpha = 1
                G.booster_pack_sparkles:fade(1, 0)
                G.booster_pack = UIBox{
                    definition = create_UIBox_xplaying_pack(),
                    config = {align="tmi", offset = {x=0,y=G.ROOM.T.y + 9},major = G.hand, bond = 'Weak'}
                }
                G.booster_pack.alignment.offset.y = -2.2
                        G.ROOM.jiggle = G.ROOM.jiggle + 3
                ease_background_colour_blind(G.STATES.STANDARD_PACK)
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                G.CONTROLLER:recall_cardarea_focus('pack_cards')
                                return true
                            end}))
                        return true
                    end
                }))  
                return true
            end
        }))  
    end
end


local card_open_OG = Card.open
function Card:open()
	if self.ability.set == "Booster" and self.ability.name:find('Low Light') then
		stop_use()
        G.STATE_COMPLETE = false 
        self.opening = true
        self.states.hover.can = false
        G.ARGS.is_xplaying_booster = true
        G.STATE = G.STATES.STANDARD_PACK
        G.GAME.pack_size = self.ability.extra
        G.GAME.pack_choices = self.config.center.config.choose or 1
        if self.cost > 0 then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                inc_career_stat('c_shop_dollars_spent', self.cost)
                self:juice_up()
            return true end }))
            ease_dollars(-self.cost) 
       	else
           	delay(0.2)
       	end
       	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, 
       		func = function()
	            self:explode()
	            local pack_cards = {}

	            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, 
	            	func = function()
		                local _size = self.ability.extra
		                
		                for i = 1, _size do
		                    local card = nil
		                    card = create_card("Base", G.pack_cards, nil, nil, nil, true, nil, 'sta')
		                    while not xplaying_config[hcm_determine_xplaying_key(card)] do
		                    	card = create_card("Base", G.pack_cards, nil, nil, nil, true, nil, 'sta')
		                    end
		                    card:set_edition(nil)
		                    card.T.x = self.T.x
		                    card.T.y = self.T.y
		                    card:set_x_playing(hcm_determine_xplaying_key(card))
		                    card:start_materialize({G.C.WHITE, G.C.WHITE}, nil, 1.5*G.SETTINGS.GAMESPEED)
		                    pack_cards[i] = card
		                end
		                return true
		            end
		        }))

	            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, 
	            	func = function()
		                if G.pack_cards then 
		                    if G.pack_cards and G.pack_cards.VT.y < G.ROOM.T.h then 
		                    for k, v in ipairs(pack_cards) do
		                        G.pack_cards:emplace(v)
		                    end
		                    return true
		                    end
		                end
		            end
		        }))

	            for i = 1, #G.jokers.cards do
	                G.jokers.cards[i]:calculate_joker({open_booster = true, card = self})
	            end

	            if G.GAME.modifiers.inflation then 
	                G.GAME.inflation = G.GAME.inflation + 1
	                G.E_MANAGER:add_event(Event({
	                	func = function()
		                  	for k, v in pairs(G.I.CARD) do
		                      	if v.set_cost then v:set_cost() end
		                  	end
		                  	return true 
		                end 
		            }))
	            end

	        	return true 
	    	end 
		}))
	else
		G.ARGS.is_xplaying_booster = false
		card_open_OG(self)
	end
end

local update_standard_pack_OG = Game.update_standard_pack;
function Game:update_standard_pack(dt)
	if G.ARGS.is_xplaying_booster then
		Game:update_xplaying_pack(dt)
	else
		update_standard_pack_OG(self, dt)
	end
end

function create_UIBox_xplaying_pack()
  	local _size = G.GAME.pack_size
  	G.pack_cards = CardArea(
    	G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
    	_size*G.CARD_W*1.1,
    	1.05*G.CARD_H, 
    	{card_limit = _size, type = 'consumeable', highlight_limit = 1})

    local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
      	{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
        	{n=G.UIT.R, config={align = "cm"}, nodes={
        		{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
          			{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
            			{n=G.UIT.O, config={object = G.pack_cards}},
          			}}
        		}}
      		}},
      		{n=G.UIT.R, config={align = "cm"}, nodes={
      		}},
      		{n=G.UIT.R, config={align = "tm"}, nodes={
        		{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
        		{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
        			UIBox_dyn_container({
          				{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
            				{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
              					{n=G.UIT.O, config={object = DynaText({string = localize('k_cigarette_pack'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
            				}},
            				{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
              					{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
              					{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}
            				}},
          				}}
        			}),
      			}},
        		{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
          			{n=G.UIT.R,config={minh =0.2}, nodes={}},
          			{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
            			{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
          			}}
        		}}
      		}}
    	}}
  	}}
  	return t
end

local poll_edition_OG = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed)
	--'edi'..(key_append or '')..G.GAME.round_resets.ante
end


-- This is an important replacement that handles a piece of faulty code in OG game
function Card:set_edition(edition, immediate, silent)
    self.edition = nil
    if not edition then return end
    if edition.holo then
        if not self.edition then self.edition = {} end
        self.edition.mult = G.P_CENTERS.e_holo.config.extra
        self.edition.holo = true
        self.edition.type = 'holo'
    elseif edition.foil then
        if not self.edition then self.edition = {} end
        self.edition.chips = G.P_CENTERS.e_foil.config.extra
        self.edition.foil = true
        self.edition.type = 'foil'
    elseif edition.polychrome then
        if not self.edition then self.edition = {} end
        self.edition.x_mult = G.P_CENTERS.e_polychrome.config.extra
        self.edition.polychrome = true
        self.edition.type = 'polychrome'
    elseif edition.negative then
        if not self.edition then
            self.edition = {}
            if self.added_to_deck then --Need to override if adding negative to an existing joker
                if self.ability.consumeable then
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                else
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                end
            end
        end
        self.edition.negative = true
        self.edition.type = 'negative'
    end

    if self.area and self.area == G.jokers then 
        if self.edition then
            if not G.P_CENTERS['e_'..(self.edition.type)].discovered then 
                discover_card(G.P_CENTERS['e_'..(self.edition.type)])
            end
        else
            if not G.P_CENTERS['e_base'].discovered then 
                discover_card(G.P_CENTERS['e_base'])
            end
        end
    end

    if self.edition and not silent then
        G.CONTROLLER.locks.edition = true
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = not immediate and 0.2 or 0,
            blockable = not immediate,
            func = function()
                self:juice_up(1, 0.5)
                if self.edition and self.edition.foil then play_sound('foil1', 1.2, 0.4) end
                if self.edition and self.edition.holo then play_sound('holo1', 1.2*1.58, 0.4) end
                if self.edition and self.edition.polychrome then play_sound('polychrome1', 1.2, 0.7) end
                if self.edition and self.edition.negative then play_sound('negative', 1.5, 0.4) end
               return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                G.CONTROLLER.locks.edition = false
               return true
            end
          }))
    end

    if G.jokers and self.area == G.jokers then 
        check_for_unlock({type = 'modify_jokers'})
    end

    self:set_cost()
end



function sendNestedMessage(message, logger)
    if client then
        level = "INFO "
        logger = logger or "DefaultLogger"
        message = message or "Default log message"
        message = tableToString(message)
        -- naive way to separate the logs if the console receive multiple logs at the same time
        client:send(os.date('%Y-%m-%d %H:%M:%S') .. " :: " .. level .. " :: " .. logger .. " :: " .. message .. "ENDOFLOG")
    end
end

function tableToString(t, seen, depth)
	local hdepth = depth
	if not depth then hdepth = 0 end
    if type(t) ~= "table" then
        return tostring(t)
    end
    
    seen = seen or {}
    if seen[t] then
        return "..."  -- Handle cyclic references
    end
    seen[t] = true

    local parts = {}
    for key, value in pairs(t) do
        local keyString = tostring(key)
        local valueString
        if type(value) == "table" then
        	if hdepth > 5 then valueString = "[TABLE: "..key.."]"
            else valueString = tableToString(value, nil, hdepth + 1) end
        else
            valueString = tostring(value)
        end
        table.insert(parts, keyString .. "=" .. valueString)
    end
    return "{" .. table.concat(parts, ", ") .. "}"
end

----------------------------------------------
------------MOD CODE END----------------------