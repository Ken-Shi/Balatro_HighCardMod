--- STEAMODDED HEADER
--- MOD_NAME: High Card Mod
--- MOD_ID: HighCardMod
--- MOD_AUTHOR: [Kenny Stone]
--- MOD_DESCRIPTION: Create a deck that references the HighCard Franchise!

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
    XPlayingSpade7 = true,
    XPlayingSpade8 = true,
    XPlayingSpade9 = true,
    XPlayingSpadeA = true,
    -- Heart Family
    XPlayingHeart2 = true, 
    XPlayingHeart3 = true,
    XPlayingHeart4 = true,
    XPlayingHeart5 = true,
    XPlayingHeart7 = true,
    XPlayingHeartA = true,
    -- Diamond Family
    XPlayingDiamond2 = true,
    XPlayingDiamond3 = true,
    XPlayingDiamond6 = true,
    XPlayingDiamond7 = true,
    XPlayingDiamond10 = true,
    XPlayingDiamondJ = true,
    -- Club Family
    XPlayingClub2 = true,
    XPlayingClub3 = true,
    XPlayingClub5 = true,
    XPlayingClub8 = true,
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
	        }
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
	        }
	    },
        ability_name = "HCM Neo New Nambu",
        slug = "hcm_neo_new_nambu",
        ability = { extra = { hand_gain = 1, hand_size = 6, hand_ge = 5, 
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
	        }
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
	        }
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
	        }
	    },
        ability_name = "HCM Bokka",
        slug = "hcm_bokka",
        ability = { extra = { done = false} }
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
	        }
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
	            "When that happens, every",
	            "played cards will score.",
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
	        }
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
	        }
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
	        }
	    },
        ability_name = "HCM Calories High",
        slug = "hcm_calories_high",
        ability = { extra = { discard_gain = 1, hand_play = 1, discard_cnt = 0, 
        			done = false} }
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
	        }
	    },
        ability_name = "HCM Chameleon",
        slug = "hcm_chameleon",
        ability = { extra = { done = false} }
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
	        }
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
	        }
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
	        }
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
	        }
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
	        }
	    },
        ability_name = "HCM Never No Dollars",
        slug = "hcm_never_no_dollars",
        ability = { extra = { max_money = 20, chip_mult = 10, done = false} }
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
	        }
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
	        }
	    },
        ability_name = "HCM Out of Five",
        slug = "hcm_out_of_five",
        ability = { extra = { best_hand = "Nothing else", msg_on = false, 
        			done = false} }
    },
    XPlayingClub2= {
    	loc = {
	        name = "Metallical Parade",
	        text = {
	            "{X:mult,C:white}X#1#{} per {C:attention}Steel Card{} or",
	            "{C:attention}Gold Card{} played when scored.",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
	        }
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
	        }
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
	        }
	    },
        ability_name = "HCM G Round",
        slug = "hcm_g_round",
        ability = { extra = { mult_gain = 5, mult_acc = 0, done = false} }
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
	        }
	    },
        ability_name = "HCM Sinking Shadow",
        slug = "hcm_sinking_shadow",
        ability = { extra = { mult_gain = 0, done = false} }
    },
    XPlayingClubJ= {
    	loc = {
	        name = "Coming Home",
	        text = {
	            "After playing hand or discard,",
	            "you always draw cards that",
	            "form your most played hand. ",
	            "{C:inactive}(Now Looking for{} {C:attention}#1#{}{C:inactive}...){}",
	            "When round ends, transform",
	            "back to {C:attention}X-Playing Joker{}."
	        }
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
	        }
        },
        ability_name = "HCM Reapers Hand",
        slug = "hcm_reapers_hand",
        ability = { extra = { chips_gain = 0, mult_gain = 0, xmult_gain = 1,
                            steel_cnt = 0, gold_cnt = 0, lucky_cnt = 0,
                            glass_cnt = 0, gseal = 0, rseal = 0, bseal = 0,
                    done = false} }
    },
}
local faceless_trigger = true

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

-- X-Playing Mechanics
function xplay(hand_name)
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
            card:add_to_deck()
            G.jokers:emplace(card)
            return true
        end}))
    return {
        message = "PLAY!",
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

    -- Initialize the deck
    if xplaying_config["XPlayingDeck"] then
        local newDeck = SMODS.Deck:new("X-Playing Deck", 
        								"XPlayingDeck", 
        								{ XPlayingDeck = true, atlas = "b_xplaying" },
        								--G.cardback_info["xplaying"], 
        								{x = 0, y = 0},
        								{name = "X-Playing Deck",
								        text = {
								            "Start run as a {C:red}Player{}",
								            "(i.e. Start with ",
								            "{C:attention}X-Playing{} Joker)"
								        }})
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
                        		return xplay(xcard_name)
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
                        message = "Neo New Nambu!",
                        card = self
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
                        message = "Interceptor On!",
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
                        message = "Interceptor Off!",
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
                            card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Place Bomb..", Xmult_mod=1})
                        end
                    end
                    if self.ability.extra.mult_cnt ~= 0 then
                        return {
                            message = "All Kaboom!",
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
                            message = "Bokka!",
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
                        message = "Love & Peace!",
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
                        message = "Rockin' Rocks!",
                        card = self
                    }
                end
                if context.repetition then
                    if context.cardarea == G.play and context.other_card.config.center == G.P_CENTERS.m_stone then
                        return {
                            message = "Rockin' Rocks!",
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
                            message = 'Agent S!',
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
                            message = "Calorie's High!",
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
                            message = "Chameleon!",
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
                        message = "Marble Rumble!",
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
                        message = "13 Stairs!",
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
                            message = "Never No Dollars!",
                            chip_mod = self.ability.extra.chip_mult * wallet,
                            mult_mod = wallet,
                            card = self
                        }
                    else
                        return {
                            message = "No Dollars :(",
                            card = self
                        }
                    end
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
                        message = "Unlucky Poky!",
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
                        message = "Metallical Parade!",
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
                            card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Stomp!", Xmult_mod=1})
                        end
                    end
                    if self.ability.extra.mult_acc ~= 0 then
                        return {
                            message = "G Round!",
                            mult_mod = self.ability.extra.mult_acc,
                            card = self
                        }
                    end
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
                                card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Shadow..", Xmult_mod=1})
                            end
                        end
                    end
                    if self.ability.extra.mult_acc ~= 0 then
                        return {
                            message = "Sinking Shadow!",
                            mult_mod = self.ability.extra.mult_gain,
                            card = self
                        }
                    end
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
                            self.ability.extra.xmult_gain = self.ability.extra.xmult_gain * 2
                        elseif context.destroying_card.config.center == G.P_CENTERS.m_steel then
                            self.ability.extra.xmult_gain = self.ability.extra.xmult_gain * 1.5
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
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Reap!", Xmult_mod=1})
                    end
                    local lucky_multi = 0
                    if self.ability.extra.lucky_cnt > 0 then
                        for i = 1, self.ability.extra.lucky_cnt do
                            if pseudorandom('lucky_mult') < G.GAME.probabilities.normal / 5 then
                                card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Lucky Mult!", Xmult_mod=1})
                                lucky_multi = lucky_multi + 1
                            end
                            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / 15 then
                                card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Lucky Dollars!", Xmult_mod=1})
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
                                                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Shattered!"})
                                                        glass_shattered = glass_shattered + 1
                                                    end
                                                end
                                                while glass_shattered > 0 do
                                                    self.ability.extra.xmult_gain = self.ability.extra.xmult_gain / 2
                                                    self.ability.extra.glass_cnt = self.ability.extra.glass_cnt - 1
                                                    glass_shattered = glass_shattered - 1
                                                end
                                            end
                                        return true
                                    end)}))
                    return {
                        message = "Reaper's Hand!",
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
            entrance_neo_new_nambu()
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
        --[[
        if self.ability.name == 'HCM Jelly Crawler' then
            evaluate_poker_hand = highcard_wraplast(evaluate_poker_hand_OG, jelly_render)
        end
        ]]--
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
        --[[
        if self.ability.name == 'HCM Jelly Crawler' then
            evaluate_poker_hand = evaluate_poker_hand_OG
            sendInfoMessage("Jelly Crawler Effect Wears Off! ")
        end
        ]]--
    end
    remove_from_deckref(self, from_debuff)
end

function entrance_neo_new_nambu()
	ease_discard(-G.GAME.current_round.discards_left, nil, true)
    local handsize_change = self.ability.extra.hand_size - G.hand.config.card_limit
    G.hand:change_size(handsize_change)
    G.GAME.round_resets.temp_handsize = handsize_change
    
    G.GAME.blind.debuff["h_size_ge"] = self.ability.extra.hand_ge
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
		        card_eval_status_text(jkr, 'extra', nil, nil, nil, {message = "Out of Five!"})
		    end   
		    return new_results
        end
	end
	return new_results
end

local draw_card_OG = draw_card

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
    	card_eval_status_text(xcard, 'extra', nil, nil, nil, {message = "Coming Home!"})
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
		    card_eval_status_text(fake_card, 'extra', nil, nil, nil, {message = "Faceless!"})
		end
	end
	return play_cards_from_highlighted_OG()
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