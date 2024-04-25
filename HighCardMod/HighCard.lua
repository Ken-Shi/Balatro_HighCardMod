--- STEAMODDED HEADER
--- MOD_NAME: High Card Mod
--- MOD_ID: HighCardMod
--- MOD_AUTHOR: [Kenny Stone]
--- MOD_DESCRIPTION: Create a deck that references the HighCard Franchise!
--- BADGE_COLOUR: AF843E
--- DISPLAY_NAME: HIGH CARD

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
    XPlayingSpade4 = true,
    XPlayingSpade5 = true,
    XPlayingSpade7 = true,
    XPlayingSpade8 = true,
    XPlayingSpade9 = true,
    XPlayingSpade10 = true,
    XPlayingSpadeK = false,
    XPlayingSpadeA = true,
    -- Heart Family
    XPlayingHeart2 = true, 
    XPlayingHeart3 = true,
    XPlayingHeart4 = true,
    XPlayingHeart5 = true,
    XPlayingHeart6 = true,
    XPlayingHeart7 = true,
    XPlayingHeartJ = true,
    XPlayingHeartK = true,
    XPlayingHeartA = true,
    -- Diamond Family
    XPlayingDiamond2 = true,
    XPlayingDiamond3 = true,
    XPlayingDiamond6 = true,
    XPlayingDiamond7 = true,
    XPlayingDiamond8 = true,
    XPlayingDiamond10 = true,
    XPlayingDiamondJ = true,
    XPlayingDiamondK = true,
    -- Club Family
    XPlayingClub2 = true,
    XPlayingClub3 = true,
    XPlayingClub5 = true,
    XPlayingClub7 = true,
    XPlayingClub8 = true,
    XPlayingClub10 = true,
    XPlayingClubJ = true,
    XPlayingClubK = true,
}

-- Create Jokers
local xplaying_jokers = {}
local xplaying_jokers_info = {
    XPlayingJoker = {
    	loc = {
	        name = "X-Playing Joker",
	        text = {
	            "{C:red}PLAY{} {C:attention}first hand{} of round.",
	            "(Transform into the scoring",
	            "X-Playing card or X-hand)"
	        }, 
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Neo New Nambu!"
	    },
        ability_name = "HCM Neo New Nambu",
        slug = "hcm_neo_new_nambu",
        ability = { extra = { hand_gain = 1, hand_size = 6, hand_ge = 5, 
        			done = false} }
    },
    XPlayingSpade4 = {
    	loc = {
	        name = "Clear Lance",
	        text = {
	            "If you play {C:attention}#1#{} cards and",
	            "score {C:attention}exactly #2#{} cards,",
	            "this card gives {X:mult,C:white}X#3#{} Mult. ",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Brain Buster!"
	    },
        ability_name = "HCM Brain Buster",
        slug = "hcm_brain_buster",
        ability = { extra = { current_highest = 5, Xmult = 1, Xmult_acc = 1,
        			done = false} }
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Honest Straight!",
	        card_eval_pc = "HIT!"
	    },
        ability_name = "HCM Honest Straight",
        slug = "hcm_honest_straight",
        ability = { extra = { transfer_card = nil, done = false} }
    },
    XPlayingSpadeK = {
    	loc = {
	        name = "San Galgano",
	        text = {
	            "When you play and score {C:attention}High Card{},",
	            "{C:attention}consume{} the scoring card and disable",
	            "its transformation. Gain {X:mult,C:white}X#1#{} per card",
	            "consumed. {C:inactive}(Currently give{} {X:mult,C:white}X#2#{} {C:inactive}){}",
	            "{C:red}Warning: This card has a mind of its own!{}"
	        },
	        card_eval_consume = "Consume..",
	        card_eval_replace = "My Turn!",
	        card_eval_takeover = "THE THRONE IS MINE!"
	    },
        ability_name = "HCM San Galgano",
        slug = "hcm_san_galgano",
        ability = { extra = { Xmult = 1, Xmult_acc = 1, card_consumed = 0, 
        			done = false} }
    },
    XPlayingSpadeA = {
    	loc = {
	        name = "Love & Peace",
	        text = {
	            "Give {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
	            "per card scored, but",
	            "{C:attention}force a card{} for each hand.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Chameleon!"
	    },
        ability_name = "HCM Chameleon",
        slug = "hcm_chameleon",
        ability = { extra = { done = false} }
    },
    XPlayingHeartJ = {
    	loc = {
	        name = "Sky Dancer",
	        text = {
	            "Scoring your {C:attention}most played hand{}",
	            "that's not High Card will",
	            "give a corresponding {C:planet}Planet{} card.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Sky Dancer!"
	    },
        ability_name = "HCM Sky Dancer",
        slug = "hcm_sky_dancer",
        ability = { extra = { done = false} }
    },
    XPlayingHeartK = {
    	loc = {
	        name = "Masculine Parfait",
	        text = {
	            "Destroy all scoring {C:attention}face cards{} and add",
	            "{C:chips}+#1#{} chips and {C:mult}+#2#{} mult per card to {C:attention}both{}",
	            "{C:attention}this joker and the playing card of this{}.",
	            "{C:inactive}(Now gives {}{C:chips}+#3#{} chips, {C:mult}+#4#{} mult{C:inactive}){}",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Marble Rumble!"
	    },
        ability_name = "HCM Marble Rumble",
        slug = "hcm_marble_rumble",
        ability = { extra = { done = false} }
    },
    XPlayingDiamond6= {
    	loc = {
	        name = "13 Stairs",
	        text = {
	            "If you have scored {C:red}exactly{}",
	            "{C:red}#1#{} cards this round, ",
	            "{C:attention}-#2# Ante{}. {C:inactive}({}{C:red}#3#{} {C:inactive}cards scored){}",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Red Labyrinth!"
	    },
        ability_name = "HCM Red Labyrinth",
        slug = "hcm_red_labyrinth",
        ability = { extra = {reroll_cost = 1, done = false} }
    },
    XPlayingDiamond10= {
    	loc = {
	        name = "Unlucky Poky",
	        text = {
	            "All {C:green,E:1,S:1.1}probabilities{} become",
	            "{C:green,E:1,S:1.1}deterministic{} (always trigger)",
	            "during the scoring stage.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Unlucky Poky!"
	    },
        ability_name = "HCM Unlucky Poky",
        slug = "hcm_unlucky_poky",
        ability = { extra = { done = false} }
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Out of Five!"
	    },
        ability_name = "HCM Out of Five",
        slug = "hcm_out_of_five",
        ability = { extra = { best_hand = "Nothing else", msg_on = false, 
        			done = false} }
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Round & Round!"
	    },
        ability_name = "HCM Round and Round",
        slug = "hcm_round_and_round",
        ability = { extra = { required_cnt = 5, required_sat = false, done = false} }
    },
    XPlayingClub2= {
    	loc = {
	        name = "Metallical Parade",
	        text = {
	            "{X:mult,C:white}X#1#{} per {C:attention}Steel Card{} or",
	            "{C:attention}Gold Card{} played when scored.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Metallical Parade!"
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Green Green!"
	    },
        ability_name = "HCM Green Green",
        slug = "hcm_green_green",
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval_pc = "Stomp!",
	        card_eval_jk = "G Round!"
	    },
        ability_name = "HCM G Round",
        slug = "hcm_g_round",
        ability = { extra = { mult_gain = 5, mult_acc = 0, done = false} }
    },
    XPlayingClub7= {
    	loc = {
	        name = "Lethal Scoville",
	        text = {
	            "If your scoring hand {C:attention}lit{}",
	            "{C:attention}the fire{}, gain a random",
	            "{C:spectral}Spectral{} card.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval_pc = "Shadow..",
	        card_eval_jk = "Sinking Shadow!"
	    },
        ability_name = "HCM Sinking Shadow",
        slug = "hcm_sinking_shadow",
        ability = { extra = { mult_gain = 0, done = false} }
    },
    XPlayingClub10= {
    	loc = {
	        name = "Million Volt",
	        text = {
	            "{C:attention}Steel{} Card will also act",
	            "like {C:attention}Gold{} Card and {C:attention}vice versa{}.",
	            "{C:red}(Only for {}{C:attention}enhancement{} {C:red}effects){}",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
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
	            "back to {C:attention}X-Playing Joker{}."
	        },
	        card_eval = "Coming Home!"
	    },
        ability_name = "HCM Coming Home",
        slug = "hcm_coming_home",
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
}
local xplaying_deck_info = {name = "X-Playing Deck",
					        text = {
					            "Start run as a {C:red}Player{}",
					            "(i.e. Start with ",
					            "{C:attention}X-Playing{} Joker)"
					        }}

local faceless_trigger = true
local hcm_flamed = false

local x_sprite_info = {
	XPlayingSpadeK = {max = 500, order = 1, name = "San Galgano", set = "XPlaying", pos = {x=0,y=0}, effect = "San Galgano", label = "San Galgano", config = {bonus = 1}, atlas = "m_hcm_san_galgano"},
}

local x_playing_loc = {
	name = "X-Playing Card", 
	text = {
		"If your {C:attention}first hand{}",
		"of the round is",
		"{C:attention}High Card{} of this,",
        "{C:red}PLAY{} this X-Playing Card!",
    }, 
}

-- Initialize deck effect
local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    Backapply_to_runRef(arg_56_0)

    -- High Card Deck
    if arg_56_0.effect.config.XPlayingDeck then
        G.E_MANAGER:add_event(Event({
            func = function()
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

--[[
local generate_card_ui_OG = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
	local card = _c
  	if _c and _c.config.center then card = _c.config.center end
  	local first_pass = nil
    if not full_UI_table then 
        first_pass = true
    end
  	local supported_badge = {}
  	local extra_badge = nil
  	if first_pass and badges then 
  		for k, v in ipairs(badges) do
        	if v == 'X-Playing Card' then extra_badge = {key = _c.xability.handname, set = 'XPlaying'} 
        	else table.insert(supported_badge, v)
        	end
        end
  	end
	local result_table = generate_card_ui_OG(card, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)

	--[[
	if extra_badge then 
		local desc_nodes = (not result_table.name and result_table.main) or result_table.info
  		localize{type = 'other', key = extra_badge.key, nodes = desc_nodes, vars = specific_vars}
  	end
	
	

  	return result_table
end
]]--


--[[
local generate_card_ui_OG = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
  	local card = _c
  	if _c and _c.config.center then card = card.config.center end
  	if _c and (_c.xability and _c.xability.set == 'XPlaying') or (_c.set and _c.set == 'XPlaying' ) then
	    local first_pass = nil
	    if not full_UI_table then 
	        first_pass = true
	        full_UI_table = {
	            main = {},
	            info = {},
	            type = {},
	            name = nil,
	            badges = badges or {}
	        }
	    end

	    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
	    local name_override = nil
	    local info_queue = {}

	    if full_UI_table.name then
	        full_UI_table.info[#full_UI_table.info+1] = {}
	        desc_nodes = full_UI_table.info[#full_UI_table.info]
	    end

	    if not full_UI_table.name then
	        if specific_vars and specific_vars.no_name then
	            full_UI_table.name = true
	        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
	            if (_c.name == 'Stone Card') then full_UI_table.name = true end
	            if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
	                full_UI_table.name = {}
	                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
	                full_UI_table.name = full_UI_table.name[1]
	            end
	        else
	            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
	        end
	        full_UI_table.card_type = card_type or _c.set
	    end 

	    local loc_vars = {}
	    if main_start then 
	        desc_nodes[#desc_nodes+1] = main_start 
	    end


	    localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}

	    if main_end then 
	        desc_nodes[#desc_nodes+1] = main_end 
	    end

	   --Fill all remaining info if this is the main desc
	    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
	        if desc_nodes == full_UI_table.main and not full_UI_table.name then
	            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
	            if not full_UI_table.name then full_UI_table.name = {} end
	        elseif desc_nodes ~= full_UI_table.main then 
	            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
	        end
	    end

	    if first_pass and not (card.set == 'Edition') and badges then
	        for k, v in ipairs(badges) do
	        	if v == 'X-Playing Card' then info_queue[#info_queue+1] = {key = _c.xability.atlas, set = 'XPlaying'} end
	            if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
	            if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
	            if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
	            if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
	            if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
	            if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
	            if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
	            if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
	            if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
	            if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
	            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
	        end
	    end

	    for _, v in ipairs(info_queue) do
	        generate_card_ui(v, full_UI_table)
	    end

	    return full_UI_table
    end
  
    return generate_card_ui_OG(card, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
end
]]--

--[[
local generate_UIBox_ability_table_OG = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
  	if self.xability and self.xability.set == 'XPlaying' then
	    local card_type, hide_desc = self.ability.set or "None", nil
	    local loc_vars = nil
	    local main_start, main_end = nil, nil
	    local no_badge = nil
	    local is_custom = false
 
		if self.debuff then
	        loc_vars = { debuffed = true, playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour}
	    elseif card_type == 'Default' or card_type == 'Enhanced' then
	        loc_vars = { playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour,
	                    nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
	                    bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
	                    x_playing = true,
	                }
	    end

        local badges = {}
	    if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
	          badges.card_type = card_type
	    end
	    if self.edition then
	        if self.edition.type == 'negative' and self.ability.consumeable then
	            badges[#badges + 1] = 'negative_consumable'
	        else
	            badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
	        end
	    end
	    badges[#badges + 1] = 'X-Playing Card'
	    if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
	    if self.ability.eternal then badges[#badges + 1] = 'eternal' end
	    if self.pinned then badges[#badges + 1] = 'pinned_left' end

	    if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end

	    return generate_card_ui(self, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
  	end

  	return generate_UIBox_ability_table_OG(self)
end
]]--



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

-- X-Playing Mechanics
function xplay(hand_name, card_info)
	if not xplaying_config[hand_name] then return false end
	local joker_to_destroy = nil
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.name == "HCM X-Play" then 
            joker_to_destroy = G.jokers.cards[i] 
        end
    end
    joker_to_destroy.getting_sliced = true
    G.E_MANAGER:add_event(Event({
        func = function()
            joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
            return true 
        end }))
    G.E_MANAGER:add_event(Event({
        func = function() 
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_"..xplaying_jokers_info[hand_name].slug, nil)
            card:set_edition(nil, nil, true)
            if "j_"..xplaying_jokers_info[hand_name].slug == "j_hcm_reapers_hand" then 
                card:set_eternal(true) 
            end
            if "j_"..xplaying_jokers_info[hand_name].slug == "j_hcm_masculine_parfait" then 
                card.ability.extra.chips_acc = card_info:get_chip_bonus()
                card.ability.extra.mult_acc = card_info:get_chip_mult()
                card.ability.extra.transfer_card = card_info
            end
            card:add_to_deck()
            G.jokers:emplace(card)
            return true
        end}))
    return {
        message = G.localization.descriptions["Joker"]["j_hcm_xplay"]["card_eval"],
        card = self
    }
end

function end_xplay(hand_name)
	local joker_to_destroy = nil
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.name == xplaying_jokers_info[hand_name].ability_name then 
            joker_to_destroy = G.jokers.cards[i] 
        end
    end
    if joker_to_destroy == nil then return false end
    joker_to_destroy.getting_sliced = true
    G.E_MANAGER:add_event(Event({
        func = function()
            joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
            return true 
        end }))
    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
    -- Add card
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = function() 
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_hcm_xplay", nil)
            --card:set_eternal(true)
            card:set_edition(nil, nil, true)
            --card:juice_up(1, 0.5)
            --sendInfoMessage("set!")
            card:add_to_deck()
            G.jokers:emplace(card)
            G.GAME.joker_buffer = 0
            return true
        end}))
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

function SMODS.INIT.HighCardMod()

    init_localization()
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
            if value.ability_name == "HCM X-Play" then joker.eternal_compat = true end
            if value.ability_name == "HCM Reapers Hand" then joker.eternal_compat = true end
            joker:register()
            local sprite = SMODS.Sprite:new("j_" .. value.slug, SMODS.findModByID("HighCardMod").path,
                "j_" .. value.slug .. ".png", 71, 95, "asset_atli")
            sprite:register()
            if key == "XPlayingSpadeK" then
	            local m_sprite = SMODS.Sprite:new("m_" .. value.slug, SMODS.findModByID("HighCardMod").path,
	                "m_" .. value.slug .. ".png", 71, 95, "asset_atli")
	            m_sprite:register()
	            G.localization.descriptions.Other[key] = x_playing_loc
	        end
        end
    end

    -- Individual Jokers
    if xplaying_config.XPlayingJoker then
        function SMODS.Jokers.j_hcm_xplay.loc_def(card)
            return { card.ability.extra.placeholder }
        end
        SMODS.Jokers.j_hcm_xplay.calculate = function(self, context)
            if not context.blueprint then
                if SMODS.end_calculate_context(context) then
                    if G.GAME.current_round.hands_played == 0 then
                        if context.scoring_name == "High Card" then
                        	if context.scoring_hand[1].config.center == G.P_CENTERS.m_stone then return false end
                        	local card_rank = context.scoring_hand[1]:get_id()
                        	local card_suit = context.scoring_hand[1].base.suit
                        	local xcard_name = "XPlaying"..string.sub(card_suit, 1, -2)..hcm_id_to_rank(card_rank)
                        	sendInfoMessage(xcard_name)
                        	if xplaying_config[xcard_name] then
                        		return xplay(xcard_name, context.scoring_hand[1])
                        	end
                        end 
                    end
                end
            end
        end
    end
    if xplaying_config.XPlayingSpade2 then
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
    if xplaying_config.XPlayingSpade4 then
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
    if xplaying_config.XPlayingSpade7 then
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
                            local selected_enhancement = enhance_options[pseudorandom(pseudoseed('seed'), 1, #enhance_options)]
                            v:set_ability(selected_enhancement, nil, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    v:juice_up()
                                    return true
                                end
                            })) 
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
                            v:set_ability(G.P_CENTERS.c_base, nil, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    v:juice_up()
                                    v.vampired = nil
                                    return true
                                end
                            })) 
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
        SMODS.Jokers.j_hcm_bokka.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade9")
                    self.ability.extra.done = true
                end
                if context.before then 
                    local protected = false
                    for k, v in ipairs(context.full_hand) do
                        if v.debuff then
                            protected = true
                        end
                    end
                    if protected then 
                        G.E_MANAGER:add_event(Event({
                        func = function() 
                            for k, v in ipairs(context.full_hand) do
                                if v.debuff then
                                    v:set_debuff(false)
                                end
                            end
                            return true
                        end}))
                        return {
                            message = G.localization.descriptions["Joker"]["j_hcm_bokka"]["card_eval"],
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
    if xplaying_config.XPlayingSpade10 then
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
		                end
		                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
		                    if context.scoring_hand[i] ~= self.ability.extra.transfer_card then
		                        copy_card(self.ability.extra.transfer_card, context.scoring_hand[i])
		                    end
		                    return true end 
		                }))
		            end 
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeK then
        function SMODS.Jokers.j_hcm_san_galgano.loc_def(card)
            return { card.ability.extra.Xmult, card.ability.extra.Xmult_acc }
        end
        SMODS.Jokers.j_hcm_san_galgano.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpadeK")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                	
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
                	
                end
            end
        end
    end
    if xplaying_config.XPlayingSpadeA then
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
                        local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                        forced_card.ability.forced_selection = true
                        G.hand:add_to_highlighted(forced_card)
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
                    context.scoring_hand[1]:set_ability(G.P_CENTERS.m_stone, nil, true)
                    G.E_MANAGER:add_event(Event({
                            func = function()
                                context.scoring_hand[1]:juice_up()
                                return true
                            end
                        })) 
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
                            v:change_suit(chosen_suit)
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
    if xplaying_config.XPlayingHeartJ then
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
    if xplaying_config.XPlayingHeartK then
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
                    	if self.ability.extra.transfer_card then sendInfoMessage("card exist") end
                    	self.ability.extra.transfer_card.ability.perma_bonus = (self.ability.extra.transfer_card.ability.perma_bonus or 0) + self.ability.extra.chips_gain
                    	self.ability.extra.transfer_card.ability.mult = (self.ability.extra.transfer_card.ability.mult or 0) + self.ability.extra.mult_gain
                    	self.ability.extra.chips_acc = self.ability.extra.transfer_card:get_chip_bonus()
                    	self.ability.extra.mult_acc = self.ability.extra.transfer_card:get_chip_mult()
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
        SMODS.Jokers.j_hcm_marble_rumble.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond3")
                    self.ability.extra.done = true
                end
                if context.before then 
                    for k, v in ipairs(context.scoring_hand) do
                        if v.config.center ~= G.P_CENTERS.m_stone then
                            v:set_ability(G.P_CENTERS.m_glass, nil, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    v:juice_up()
                                    return true
                                end
                            })) 
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
    if xplaying_config.XPlayingDiamond6 then
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
    if xplaying_config.XPlayingDiamond10 then
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
    if xplaying_config.XPlayingDiamondK then
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
    if xplaying_config.XPlayingClub2 then
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
                            card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = "Metal!"})
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
    if xplaying_config.XPlayingClub5 then
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
    if xplaying_config.XPlayingClub7 then
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
    if xplaying_config.XPlayingClub10 then
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
    if xplaying_config.XPlayingClubK then
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
end

local add_to_deckref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck then
        
        if self.ability.name == 'HCM X-Play' then 
            for idx, jkr in pairs(xplaying_jokers) do
                local jokers_for_remove = {}
                for k, rjkr in pairs(G.P_JOKER_RARITY_POOLS[4]) do
                    if rjkr.name == jkr.ability_name then
                        jokers_for_remove[#jokers_for_remove + 1] = k
                    end
                end

                for _, k in ipairs(jokers_for_remove) do
                    G.P_JOKER_RARITY_POOLS[4][k] = nil
                end
            end
        end
        if self.ability.name == 'HCM Neo New Nambu' then
            entrance_neo_new_nambu(self)
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
        if self.ability.name == 'HCM Red Labyrinth' then 
        	--card_eval_status_text(self, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_red_labyrinth"]["card_eval"]})
            ease_background_colour{new_colour = G.C.RED, contrast = 3}
        end
    end
    add_to_deckref(self, from_debuff)
end

local remove_from_deckref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck then
        if self.ability.name == 'HCM Neo New Nambu' then
            G.GAME.blind.debuff["h_size_ge"] = 1
            G.GAME.blind.loc_debuff_text = ''
        end
    end
    remove_from_deckref(self, from_debuff)
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
	if new_results.top == nil then return result end
	for _, jkr in pairs(G.jokers.cards) do
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
        elseif jkr.ability.name == 'HCM Love Connection' then 
		    if not next(new_results["Pair"]) then 
		    	new_results["Pair"] = result.top 
		    end
		    --sendInfoMessage("Pair Effect Dominates! ")
		    return new_results
		elseif jkr.ability.name == 'HCM Out of Five' then 
		    local replacement = hcm_hand_most_played(false)
		    if replacement == nil then return result end
		    if next(result["Flush Five"]) then 
		    elseif next(result["Flush House"]) then 
		    elseif next(result["Five of a Kind"]) then
		    elseif next(result["Straight Flush"]) then 
		    elseif next(result["Four of a Kind"]) then  
		    elseif next(result["Full House"]) then 
		    elseif next(result["Flush"]) then  
		    elseif next(result["Straight"]) then
		    elseif next(result["Three of a Kind"]) then 
		    elseif next(result["Two Pair"]) then 
		    elseif next(result["Pair"]) then
		    elseif next(result["High Card"]) then
		        new_results[replacement] = result["High Card"]
		        card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = G.localization.descriptions["Joker"]["j_hcm_out_of_five"]["card_eval"]})
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

evaluate_play_OG = G.FUNCS.evaluate_play
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
                    		G.play.cards[idx] = copy_card(jkr.ability.extra.transfer_card, G.play.cards[idx])
                    		--G.play.cards[idx]:juice_up()
                    	end
                    end

            		G.E_MANAGER:add_event(Event({trigger = 'before', func = function()
            			for idx, val in ipairs(G.play.cards) do
            				if scoring_hand[i] == G.play.cards[idx] then
	                    		--G.play.cards[idx] = copy_card(jkr.ability.extra.transfer_card, G.play.cards[idx])
	                    		G.play.cards[idx]:juice_up()
	                    	end
	                    end
	                    return true end 
	                }))

                end
            end 
		end 
	end
	sendInfoMessage("Actual Eval Play")
	result = evaluate_play_OG(self, e)
	sendInfoMessage("Done!")
	return result
end

play_cards_from_highlighted_OG = G.FUNCS.play_cards_from_highlighted

G.FUNCS.play_cards_from_highlighted = function(e)
	
	for _, jkr in pairs(G.jokers.cards) do
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
	end
	return play_cards_from_highlighted_OG()
end

flame_handler_OG = G.FUNCS.flame_handler

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
        suits[current_suits[i]] = (suits[current_suits[i]] or 0) + 1
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

----------------------------------------------
------------MOD CODE END----------------------