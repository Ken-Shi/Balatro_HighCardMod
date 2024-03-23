--- STEAMODDED HEADER
--- MOD_NAME: High Card Deck and Jokers
--- MOD_ID: HighCardMod
--- MOD_AUTHOR: [Kenny Stone]
--- MOD_DESCRIPTION: Create a deck that references the HighCard Franchise!

----------------------------------------------
------------MOD CODE -------------------------

-- Config: DISABLE UNWANTED MODS HERE
local config = {
    -- Decks
    XPlayingDeck = true,
    -- Jokers
    XPlayingJoker = true,
    -- Spade Family
    XPlayingSpade2 = true,
    XPlayingSpadeA = true,
    -- Heart Family
    XPlayingHeart3 = true,
    XPlayingHeart4 = true,
    XPlayingHeart5 = true,
    XPlayingHeart7 = true,
    -- Diamond Family
    XPlayingDiamond3 = true,
    XPlayingDiamond7 = true,
    XPlayingDiamond10 = true,
    -- Club Family
    XPlayingClub2 = true,
    XPlayingClub3 = true,
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
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_xplay', nil)
                --card:set_eternal(true)
                card:set_edition(nil, nil, true)
                --card:juice_up(1, 0.5)
                card:add_to_deck()
                G.jokers:emplace(card)
                return true
            end
        }))
    end
end

-- Create Localization
local locs = {
    XPlayingDeck = {
        name = "X-Playing Deck",
        text = {
            "Start run as a {C:red}Player{}",
            "(i.e. Start with ",
            "{C:attention}X-Playing{} Joker)"
        }
    },
    XPlayingJoker = {
        name = "X-Playing Joker",
        text = {
            "{C:red}PLAY{} {C:attention}first hand{} of round.",
            "(Transform into the scoring",
            "X-Playing card or X-hand)"
        }
    },
    XPlayingSpade2 = {
        name = "Neo New Nambu",
        text = {
            "Gain {C:blue}+#1#{} Hand upon hand played, ",
            "but you must play {C:attention}#3# cards{}",
            "{C:attention}per hand{}, {C:attention}lose all discards{}",
            "and set hand size to {C:attention}#2#{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingSpadeA = {
        name = "Love & Peace",
        text = {
            "Gain {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult,",
            "but {C:attention}force a card{} for each hand.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingHeart3 = {
        name = "Rockin' Rocks",
        text = {
            "Turning your first scoring card ",
            "into {C:attention}Stone Card{}. Retriggers ",
            "played {C:attention}Stone Card{} for {C:attention}#1# times{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingHeart4 = {
        name = "Agent S",
        text = {
            "Retrigger the lowest",
            "played card used in",
            "scoring for {C:attention}#1# times{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingHeart5 = {
        name = "Calorie's High",
        text = {
            "Gain {C:red}+#1#{} Discard upon ",
            "card(s) discarded, but ",
            "you only play {C:attention}#2# hand{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingHeart7 = {
        name = "Chameleon",
        text = {
            "Convert {C:attention}suit{} of your",
            "played cards to suit",
            "of {C:attention}lowest played card{}.",
            "{C:inactive}(right-most if tied){}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingDiamond3 = {
        name = "Marble Rumble",
        text = {
            "Turn your {C:attention}scoring hand{}",
            "into {C:attention}Glass Card{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingDiamond7 = {
        name = "Never No Dollars",
        text = {
            "Spend up to {C:attention}#1#{} dollars,",
            "add that amount to {C:mult}Mult{}",
            "and {X:chips,C:white}X#2#{} that amount to {C:chips}Chips{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingDiamond10 = {
        name = "Unlucky Poky",
        text = {
            --"All {C:green,E:1,S:1.1}probabilities{} ",
            --"become {C:green,E:1,S:1.1}deterministic{}",
            --"(i.e. they always trigger)",
            "Turn your {C:attention}scoring hand{}",
            "into {C:attention}Lucky Card{}",
            "and become {C:green,E:1,S:1.1}extra-lucky{}",
            "during the scoring stage.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingClub2 = {
        name = "Metallical Parade",
        text = {
            "{X:mult,C:white}X#1#{} per {C:attention}Steel Card{} or",
            "{C:attention}Gold Card{} played when scored.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingClub3 = {
        name = "Green Green",
        text = {
            "Your poker hand played",
            "is always considered",
            "{C:red}only{} as {C:attention}Straight{}.",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
}

-- Create Decks
local decks = {
    XPlayingDeck = {
        name = "X-Playing Deck",
        config = { XPlayingDeck = true },
        sprite = { x = 0, y = 0 }
    },
}

-- Create Jokers
local jokers = {
    XPlayingJoker = {
        ability_name = "X-Play",
        slug = "xplay",
        ability = { extra = { placeholder = 1.0 } },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = true
    },
    XPlayingSpade2 = {
        ability_name = "Neo New Nambu",
        slug = "neo_new_nambu",
        ability = { extra = { hand_gain = 1, hand_size = 6, hand_ge = 5, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingSpadeA = {
        ability_name = "Love and Peace",
        slug = "love_and_peace",
        ability = { extra = { chips_gain = 200, mult_gain = 20, discard_cnt = 0, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingHeart3 = {
        ability_name = "Rockin Rocks",
        slug = "rockin_rocks",
        ability = { extra = { retrigger_cnt = 2, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingHeart4 = {
        ability_name = "Agent S",
        slug = "agent_s",
        ability = { extra = { retrigger_cnt = 4, repeated = false, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingHeart5 = {
        ability_name = "Calories High",
        slug = "calories_high",
        ability = { extra = { discard_gain = 1, hand_play = 1, discard_cnt = 0, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingHeart7 = {
        ability_name = "Chameleon",
        slug = "chameleon",
        ability = { extra = { done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingDiamond3= {
        ability_name = "Marble Rumble",
        slug = "marble_rumble",
        ability = { extra = { done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingDiamond7= {
        ability_name = "Never No Dollars",
        slug = "never_no_dollars",
        ability = { extra = { max_money = 20, chip_mult = 10, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingDiamond10= {
        ability_name = "Unlucky Poky",
        slug = "unlucky_poky",
        ability = { extra = { done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingClub2= {
        ability_name = "Metallical Parade",
        slug = "metallical_parade",
        ability = { extra = { Xmult = 1.5, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingClub3= {
        ability_name = "Green Green",
        slug = "green_green",
        ability = { extra = { done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
}
local joker_map = {
    XPlayingSpade2 = "j_neo_new_nambu",
    XPlayingSpadeA = "j_love_and_peace",
    XPlayingHeart3 = "j_rockin_rocks",
    XPlayingHeart4 = "j_agent_s",
    XPlayingHeart5 = "j_calories_high",
    XPlayingHeart7 = "j_chameleon",
    XPlayingDiamond3 = "j_marble_rumble",
    XPlayingDiamond7 = "j_never_no_dollars",
    XPlayingDiamond10 = "j_unlucky_poky",
    XPlayingClub2 = "j_metallical_parade",
    XPlayingClub3 = "j_green_green",
}

function SMODS.INIT.HighCardMod()

    init_localization()

    --G.cardback_info = InjectCardBack()
    G.cardback_info = ReadCardBackInfo()

    decks["XPlayingDeck"].sprite = G.cardback_info["xplaying"]

    -- Initialize Decks
    for key, value in pairs(decks) do
        if config[key] then
            local newDeck = SMODS.Deck:new(value.name, key, value.config, value.sprite, locs[key])
            newDeck:register()
        end
    end

    -- Initialize Jokers
    for key, value in pairs(jokers) do
        if config[key] then
            local joker = SMODS.Joker:new(value.ability_name, value.slug, value.ability, { x = 0, y = 0 }, locs[key],
                value.rarity, value.cost, value.unlocked, value.discovered, value.blueprint_compat, value.eternal_compat)
            joker:register()
            local sprite = SMODS.Sprite:new("j_" .. value.slug, SMODS.findModByID("HighCardMod").path,
                "j_" .. value.slug .. ".png", 71, 95, "asset_atli")
            sprite:register()
        end
    end

    --set_edition_replacement(Card, "set_edition", set_edition_robust)

    -- Joker calculations

    local function xplay(hand_name)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == "X-Play" then 
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
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, joker_map[hand_name], nil)
                card:set_edition(nil, nil, true)
                --card:juice_up(1, 0.5)
                card:add_to_deck()
                G.jokers:emplace(card)
                return true
            end}))
        return {
            message = "PLAY!",
            card = self
        }
    end

    local function end_xplay(hand_name)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == jokers[hand_name].ability_name then 
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
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_xplay", nil)
                --card:set_eternal(true)
                card:set_edition(nil, nil, true)
                --card:juice_up(1, 0.5)
                sendDebugMessage("set!")
                card:add_to_deck()
                G.jokers:emplace(card)
                G.GAME.joker_buffer = 0
                return true
            end}))
    end

    if config.XPlayingJoker then
        SMODS.Jokers.j_xplay.calculate = function(self, context)
            if not context.blueprint then
                if SMODS.end_calculate_context(context) then
                    if G.GAME.current_round.hands_played == 0 then
                        if context.scoring_name == "High Card" then
                            if context.full_hand[1]:get_id() == 2 and context.full_hand[1]:is_suit("Spades") then
                                return xplay("XPlayingSpade2")
                            end
                            if context.full_hand[1]:get_id() == 14 and context.full_hand[1]:is_suit("Spades") then
                                return xplay("XPlayingSpadeA")
                            end
                            if context.full_hand[1]:get_id() == 3 and context.full_hand[1]:is_suit("Hearts") then
                                return xplay("XPlayingHeart3")
                            end
                            if context.full_hand[1]:get_id() == 4 and context.full_hand[1]:is_suit("Hearts") then
                                return xplay("XPlayingHeart4")
                            end
                            if context.full_hand[1]:get_id() == 5 and context.full_hand[1]:is_suit("Hearts") then
                                return xplay("XPlayingHeart5")
                            end
                            if context.full_hand[1]:get_id() == 7 and context.full_hand[1]:is_suit("Hearts") then
                                return xplay("XPlayingHeart7")
                            end
                            if context.full_hand[1]:get_id() == 3 and context.full_hand[1]:is_suit("Diamonds") then
                                return xplay("XPlayingDiamond3")
                            end
                            if context.full_hand[1]:get_id() == 7 and context.full_hand[1]:is_suit("Diamonds") then
                                return xplay("XPlayingDiamond7")
                            end
                            if context.full_hand[1]:get_id() == 10 and context.full_hand[1]:is_suit("Diamonds") then
                                return xplay("XPlayingDiamond10")
                            end
                            if context.full_hand[1]:get_id() == 2 and context.full_hand[1]:is_suit("Clubs") then
                                return xplay("XPlayingClub2")
                            end
                            if context.full_hand[1]:get_id() == 3 and context.full_hand[1]:is_suit("Clubs") then
                                return xplay("XPlayingClub3")
                            end
                        end 
                    end
                end
            end
        end
    end

    if config.XPlayingSpade2 then
        SMODS.Jokers.j_neo_new_nambu.calculate = function(self, context)
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

    if config.XPlayingSpadeA then
        SMODS.Jokers.j_love_and_peace.calculate = function(self, context)
            if not context.blueprint then
                if context.before then 
                    sendDebugMessage("Love-P")
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
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpadeA")
                    self.ability.extra.done = true
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.discard_cnt = 0
                    --sendDebugMessage("Love & Peace!")
                    return {
                        message = "Love & Peace!",
                        chip_mod = self.ability.extra.chips_gain,
                        mult_mod = self.ability.extra.mult_gain,
                        card = self
                    }
                end
            end
        end
    end

    if config.XPlayingHeart3 then
        SMODS.Jokers.j_rockin_rocks.calculate = function(self, context)
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

    if config.XPlayingHeart4 then
        SMODS.Jokers.j_agent_s.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart4")
                    self.ability.extra.done = true
                end
                --if context.before then 
                --    local lowest_card_value = math.floor(get_lowest_value(context.scoring_hand))
                --    sendDebugMessage(lowest_card_value)
                --end
                if context.repetition then
                    --sendDebugMessage("Repetition!")
                    --sendDebugMessage(context.other_card:get_id())
                    --sendDebugMessage(context.cardarea)
                    if context.cardarea == G.play and context.other_card:get_id() == math.floor(get_lowest_value(context.scoring_hand)) and not self.ability.extra.repeated then
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


    if config.XPlayingHeart5 then
        SMODS.Jokers.j_calories_high.calculate = function(self, context)
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
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.discard_cnt = 0
                end
            end
        end
    end

    if config.XPlayingHeart7 then
        SMODS.Jokers.j_chameleon.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingHeart7")
                    self.ability.extra.done = true
                end
                if context.before then 
                    local lowest_id = math.floor(get_lowest_value(context.full_hand))
                    local lowest_card = context.full_hand[1]
                    for k, v in ipairs(context.full_hand) do
                        if v:get_id() == lowest_id then lowest_card = v end
                    end
                    --sendDebugMessage(first_card.base.suit)
                    context.scoring_hand = {}
                    for k, v in ipairs(context.full_hand) do
                        --if k > 1 then
                            v:change_suit(lowest_card.base.suit)
                        --end
                        table.insert(context.scoring_hand, v)
                    end
                    return {
                        message = "Chameleon!",
                        card = self
                    }
                    
                end
                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                end
            end
        end
    end

    if config.XPlayingDiamond3 then
        SMODS.Jokers.j_marble_rumble.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond3")
                    self.ability.extra.done = true
                end
                if context.before then 
                    for k, v in ipairs(context.scoring_hand) do
                        v:set_ability(G.P_CENTERS.m_glass, nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        })) 
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

    if config.XPlayingDiamond7 then
        SMODS.Jokers.j_never_no_dollars.calculate = function(self, context)
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

    if config.XPlayingDiamond10 then
        SMODS.Jokers.j_unlucky_poky.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingDiamond10")
                    self.ability.extra.done = true
                end
                if context.before then 
                    for k, v in ipairs(context.scoring_hand) do
                        v:set_ability(G.P_CENTERS.m_lucky, nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        })) 
                    end
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

    if config.XPlayingClub2 then
        SMODS.Jokers.j_metallical_parade.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub2")
                    self.ability.extra.done = true
                end
                if context.individual then 
                    if context.cardarea == G.play then
                        if context.other_card.config.center == G.P_CENTERS.m_steel or context.other_card.config.center == G.P_CENTERS.m_gold then
                            return {
                                --extra = {message = "Metallical Parade!", Xmult_mod = self.ability.extra.Xmult},
                                --message = "Metallical Parade!", 
                                x_mult = self.ability.extra.Xmult,
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

    if config.XPlayingClub3 then
        SMODS.Jokers.j_green_green.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub3")
                    self.ability.extra.done = true
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    --return {
                    --    message = "Green Green!",
                    --    card = self
                    --}
                end
            end
        end
    end

end

-- Copied and modifed from LushMod
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil, nil
    local no_badge = nil

    if self.config.center.unlocked == false and not self.bypass_lock then    -- For everyting that is locked
    elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
    elseif self.debuff then
    elseif card_type == 'Default' or card_type == 'Enhanced' then
    elseif self.ability.set == 'Joker' then
        local customJoker = true

        if self.ability.name == 'X-Play' then
            loc_vars = { self.ability.extra.placeholder }
        elseif self.ability.name == 'Neo New Nambu' then
            loc_vars = { self.ability.extra.hand_gain, self.ability.extra.hand_size, self.ability.extra.hand_ge }
        elseif self.ability.name == 'Love and Peace' then
            loc_vars = { self.ability.extra.chips_gain, self.ability.extra.mult_gain}
        elseif self.ability.name == 'Calories High' then
            loc_vars = { self.ability.extra.discard_gain, self.ability.extra.hand_play, }
        elseif self.ability.name == 'Never No Dollars' then
            loc_vars = { self.ability.extra.max_money, self.ability.extra.chip_mult, }
        elseif self.ability.name == 'Metallical Parade' then
            loc_vars = { self.ability.extra.Xmult }
        elseif self.ability.name == 'Rockin Rocks' then
            loc_vars = { self.ability.extra.retrigger_cnt }
        elseif self.ability.name == 'Agent S' then
            loc_vars = { self.ability.extra.retrigger_cnt }
        else
            customJoker = false
        end

        if customJoker then
            local badges = {}
            if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
                badges.card_type = card_type
            end
            if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
                badges.force_rarity = true
            end
            if self.edition then
                if self.edition.type == 'negative' and self.ability.consumeable then
                    badges[#badges + 1] = 'negative_consumable'
                else
                    badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
                end
            end
            if self.seal then
                badges[#badges + 1] = string.lower(self.seal) .. '_seal'
            end
            if self.ability.eternal then
                badges[#badges + 1] = 'eternal'
            end
            if self.pinned then
                badges[#badges + 1] = 'pinned_left'
            end

            if self.sticker then
                loc_vars = loc_vars or {};
                loc_vars.sticker = self.sticker
            end

            return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start,
                main_end)
        end
    end

    return generate_UIBox_ability_tableref(self)
end

local add_to_deckref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck then
        
        if self.ability.name == 'X-Play' then 
            -- Handle missing compat
            for idx, jkr in pairs(jokers) do
                --sendDebugMessage("what")
                for k, rjkr in ipairs(G.P_CENTER_POOLS['Joker']) do
                    if rjkr.name == jkr.ability_name then
                        --if not jkr.blueprint_compat then sendDebugMessage(rjkr.name) end
                        G.P_CENTER_POOLS['Joker'][k].blueprint_compat = jkr.blueprint_compat
                        G.P_CENTER_POOLS['Joker'][k].eternal_compat = jkr.eternal_compat
                    end
                end
                local jokers_for_remove = {}
                for k, rjkr in pairs(G.P_JOKER_RARITY_POOLS[4]) do
                    if rjkr.name == jkr.ability_name then
                        jokers_for_remove[#jokers_for_remove + 1] = k
                    end
                end

                for _, k in ipairs(jokers_for_remove) do
                    G.P_JOKER_RARITY_POOLS[4][k] = nil  -- Remove the table
                end
            end
            --G.GAME.blind.debuff["h_size_ge"] = 1
            --G.GAME.blind.loc_debuff_text = ''
            --sendDebugMessage("Debuff Reset via X-Play!")
        end
        if self.ability.name == 'Neo New Nambu' then
            ease_discard(-G.GAME.current_round.discards_left, nil, true)
            local handsize_change = self.ability.extra.hand_size - G.hand.config.card_limit
            G.hand:change_size(handsize_change)
            G.GAME.round_resets.temp_handsize = handsize_change
            
            --sendDebugMessage("Debuff Set!")
            G.GAME.blind.debuff["h_size_ge"] = self.ability.extra.hand_ge
            if G.GAME.blind.boss then 
                --sendDebugMessage("Boss Blind!")
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
        if self.ability.name == 'Love and Peace' then 
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
        if self.ability.name == 'Calories High' then
            ease_hands_played(self.ability.extra.hand_play - G.GAME.current_round.hands_left)
        end
        if self.ability.name == 'Chameleon' then
            evaluate_poker_hand = highcard_wraplast(evaluate_poker_hand, pre_flush)
        end
        --if self.ability.name == 'Unlucky Poky' then
        --    for k, v in pairs(G.GAME.probabilities) do 
        --        sendDebugMessage(G.GAME.probabilities[k])
        --        G.GAME.probabilities[k] = v * 1000
        --    end
        --end
        if self.ability.name == 'Green Green' then
            evaluate_poker_hand = highcard_wraplast(evaluate_poker_hand, always_straight)
        end

    end
    add_to_deckref(self, from_debuff)
end

local remove_from_deckref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck then
        if self.ability.name == 'Neo New Nambu' then
            G.GAME.blind.debuff["h_size_ge"] = 1
            G.GAME.blind.loc_debuff_text = ''
            --sendDebugMessage("Debuff Reset via remove!")
        end
        --if self.ability.name == 'Unlucky Poky' then
        --    for k, v in pairs(G.GAME.probabilities) do 
        --        G.GAME.probabilities[k] = v / 1000
        --        sendDebugMessage(G.GAME.probabilities[k])
        --    end
        --end
        if self.ability.name == 'Chameleon' then
            evaluate_poker_hand = evaluate_poker_hand_OG
            sendDebugMessage("Flush Effect Wears Off! ")
        end
        if self.ability.name == 'Green Green' then
            evaluate_poker_hand = evaluate_poker_hand_OG
            sendDebugMessage("Straight Effect Wears Off! ")
        end
    end
    remove_from_deckref(self, from_debuff)
end

function get_lowest_value(hand)
    local lowest = nil
    for k, v in ipairs(hand) do
        if not lowest or v:get_nominal() < lowest:get_nominal() then
        --if not lowest or v:get_id() > lowest:get_id() then
            lowest = v
        end
    end
    if #hand > 0 then return lowest:get_id() else return nil end
end


-- Shady Business here:
-- Function to wrap the original function with your additional logic
function highcard_wraplast(originalFunc, additionalFunc)
    return function(hand)
        -- Call the additional function
        ret = originalFunc(hand)
        ret = additionalFunc(ret, hand)

        -- Then call the original function with all the original arguments
        return ret
    end
end

function always_straight(ret, hand)
    --
    local new_results = {
        ["Flush Five"] = {},
        ["Flush House"] = {},
        ["Five of a Kind"] = {},
        ["Straight Flush"] = {},
        ["Four of a Kind"] = {},
        ["Full House"] = {},
        ["Flush"] = {},
        ["Straight"] = ret.top,
        ["Three of a Kind"] = {},
        ["Two Pair"] = {},
        ["Pair"] = {},
        ["High Card"] = {},
        top = ret.top
      }
    --]]--
    --new_results = ret
    --new_results["Straight"] = ret.top
    if new_results.top == nil then return ret end

    return new_results
end

function pre_flush(ret, hand)
    if ret.top == nil then return ret end

    local new_results = ret
    if next(ret["Five of a Kind"]) then new_results["Flush Five"] = ret["Five of a Kind"]
    elseif next(ret["Full House"]) then new_results["Flush House"] = ret["Full House"]
    elseif next(ret["Straight"]) then new_results["Straight Flush"] = ret["Straight"] end
    if #hand >= 5 then 
        local placeholder_tab = {}
        for _,v in ipairs(hand) do
            table.insert(placeholder_tab, v)
        end
        new_results["Flush"] = {placeholder_tab}
    end
    
    if new_results.top == nil then return ret end

    return new_results
end

evaluate_poker_hand_OG = evaluate_poker_hand

-- Function to wrap an existing method with your additional logic
function set_edition_replacement(class, methodName, additionalFunc)
    local originalMethod = class[methodName]

    class[methodName] = function(self)
        -- Call the additional function
        originalMethod(self)
        --sendDebugMessage('Rendering Reset Triggered!')
        additionalFunc()
        --sendDebugMessage('Card Back Injection Triggered!')
        -- Then call the original method with 'self' and any arguments
        return 
    end
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