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
    XPlayingSpade9 = true,
    XPlayingSpadeA = true,
    -- Heart Family
    XPlayingHeart3 = true,
    XPlayingHeart4 = true,
    XPlayingHeart5 = true,
    XPlayingHeart7 = true,
    -- Diamond Family
    XPlayingDiamond2 = true,
    XPlayingDiamond3 = true,
    XPlayingDiamond7 = true,
    XPlayingDiamond10 = true,
    -- Club Family
    XPlayingClub2 = true,
    XPlayingClub3 = true,
    XPlayingClub5 = true,
    XPlayingClubJ = true,
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
    XPlayingSpade9 = {
        name = "Bokka",
        text = {
            "Remove {C:attention}debuff{}",
            "from played cards.",
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
    XPlayingDiamond2 = {
        name = "Love Connection",
        text = {
            "Your poker hand played",
            "is always considered to",
            "have contained a {C:attention}Pair{}.",
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
            "Turn your {C:attention}scoring hand{} into",
            "{C:attention}Lucky Cards{} and become {C:green,E:1,S:1.1}extra-lucky{}",
            "during the scoring stage, but",
            "{C:red}lose all of them afterwards{}.",
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
    XPlayingClub5 = {
        name = "G Round",
        text = {
            "When {C:attention}Stone Cards{} are played,",
            "gain {C:mult}+#1#{} Mult each for this",
            "round and {C:attention}destroy{} them.",
            "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}",
            "Transform back to",
            "{C:attention}X-Playing Joker{}",
            "at end of round. "
        }
    },
    XPlayingClubJ = {
        name = "Coming Home",
        text = {
            "After playing hand or discard,",
            "you always draw cards that",
            "form your most played hand. ",
            "{C:inactive}(Now Looking for{} {C:attention}#1#{}{C:inactive}...){}",
            --"{C:inactive}(Only if it is possible){}",
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
    XPlayingSpade9 = {
        ability_name = "Bokka",
        slug = "bokka",
        ability = { extra = { done = false} },
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
    XPlayingDiamond2= {
        ability_name = "Love Connection",
        slug = "love_connection",
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
    XPlayingClub5= {
        ability_name = "G Round",
        slug = "g_round",
        ability = { extra = { mult_gain = 5, mult_acc = 0, done = false} },
        rarity = 4,
        cost = 0,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false
    },
    XPlayingClubJ= {
        ability_name = "Coming Home",
        slug = "coming_home",
        ability = { extra = { best_hand = "High Card", done = false} },
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
    XPlayingSpade9 = "j_bokka",
    XPlayingSpadeA = "j_love_and_peace",
    XPlayingHeart3 = "j_rockin_rocks",
    XPlayingHeart4 = "j_agent_s",
    XPlayingHeart5 = "j_calories_high",
    XPlayingHeart7 = "j_chameleon",
    XPlayingDiamond2 = "j_love_connection",
    XPlayingDiamond3 = "j_marble_rumble",
    XPlayingDiamond7 = "j_never_no_dollars",
    XPlayingDiamond10 = "j_unlucky_poky",
    XPlayingClub2 = "j_metallical_parade",
    XPlayingClub3 = "j_green_green",
    XPlayingClub5 = "j_g_round",
    XPlayingClubJ = "j_coming_home",
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
                --sendDebugMessage("set!")
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
                            if context.full_hand[1]:get_id() == 9 and context.full_hand[1]:is_suit("Spades") then
                                return xplay("XPlayingSpade9")
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
                            if context.full_hand[1]:get_id() == 2 and context.full_hand[1]:is_suit("Diamonds") then
                                return xplay("XPlayingDiamond2")
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
                            if context.full_hand[1]:get_id() == 5 and context.full_hand[1]:is_suit("Clubs") then
                                return xplay("XPlayingClub5")
                            end
                            if context.full_hand[1]:get_id() == 11 and context.full_hand[1]:is_suit("Clubs") then
                                return xplay("XPlayingClubJ")
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

    if config.XPlayingSpade9 then
        SMODS.Jokers.j_bokka.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingSpade9")
                    self.ability.extra.done = true
                end

                if context.before then 
                    local protected = false
                    for k, v in ipairs(context.full_hand) do
                        if v.debuff then
                            --v:set_debuff(false)
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
                    --context.scoring_hand[1]:set_ability(G.P_CENTERS.m_stone, nil, true) 
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

    if config.XPlayingDiamond2 then
        SMODS.Jokers.j_love_connection.calculate = function(self, context)
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

    if config.XPlayingDiamond3 then
        SMODS.Jokers.j_marble_rumble.calculate = function(self, context)
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
                        if v.config.center ~= G.P_CENTERS.m_stone then
                            v:set_ability(G.P_CENTERS.m_lucky, nil, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    v:juice_up()
                                    return true
                                end
                            })) 
                        end
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
                if context.destroying_card then 
                    if context.destroying_card.config.center == G.P_CENTERS.m_lucky then
                        return true
                    end
                    return nil
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

    if config.XPlayingClub5 then
        SMODS.Jokers.j_g_round.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClub5")
                    self.ability.extra.done = true
                end

                if context.destroying_card then 
                    --sendDebugMessage("Destroying card!")
                    if context.destroying_card.config.center == G.P_CENTERS.m_stone then 
                        --sendDebugMessage("Destroying stone card!")
                        --card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Stomp!"})
                        return true
                    end
                    return nil
                end

                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    --sendDebugMessage("Evaluate G Round!")
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

    if config.XPlayingClubJ then
        SMODS.Jokers.j_coming_home.calculate = function(self, context)
            if not context.blueprint then
                if context.end_of_round and not self.ability.extra.done then
                    end_xplay("XPlayingClubJ")
                    self.ability.extra.done = true
                end
                if context.pre_discard then
                    --self.ability.extra.discard_cnt = self.ability.extra.discard_cnt + 1
                    --if self.ability.extra.discard_cnt == #G.hand.highlighted then
                    self.ability.extra.best_hand = string_level_unflush(hand_most_played())
                    sendDebugMessage("Coming Home Discard Draw!")
                    --delay(0.3)
                    local draw_result = coming_home_draws()
                    self.ability.extra.discard_cnt = 0
                    if draw_result then 
                        return {
                            message = "Coming Home!",
                            card = self
                        }
                    end
                    --end
                end
                if context.after then
                    self.ability.extra.best_hand = string_level_unflush(hand_most_played())
                    sendDebugMessage("Coming Home Hand Draw!")
                    local draw_result = coming_home_draws()
                    if draw_result then 
                        return {
                            message = "Coming Home!",
                            card = self
                        }
                    end
                end


                if SMODS.end_calculate_context(context) then
                    self.ability.extra.done = false
                    self.ability.extra.best_hand = string_level_unflush(hand_most_played())
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
        elseif self.ability.name == 'G Round' then
            loc_vars = { self.ability.extra.mult_gain, self.ability.extra.mult_acc }
        elseif self.ability.name == 'Coming Home' then
            loc_vars = { self.ability.extra.best_hand }
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
        if self.ability.name == 'Love Connection' then
            evaluate_poker_hand = highcard_wraplast(evaluate_poker_hand, always_pair)
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
        if self.ability.name == 'Coming Home' then 
            self.ability.extra.best_hand = string_level_unflush(hand_most_played())
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
        if self.ability.name == 'Love Connection' then
            evaluate_poker_hand = evaluate_poker_hand_OG
            sendDebugMessage("Pair Effect Wears Off! ")
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

function always_pair(ret, hand)
    if ret.top == nil then return ret end

    local new_results = ret
    if not next(new_results["Pair"]) then new_results["Pair"] = ret.top end
    
    if new_results.top == nil then return ret end

    return new_results
end

function string_level_unflush(hand_name)
    if hand_name == "Flush Five" then return "Five of a Kind" 
    elseif hand_name == "Flush House" then return "Full House"
    elseif hand_name == "Royal Flush" then return "Straight Flush"
    else end
    return hand_name
end

function hand_most_played()
    local most_played_hand = nil
    local most_played_times = 0
    for k, v in pairs(G.GAME.hands) do
        if v.played >= most_played_times then
            most_played_hand = k
            most_played_times = v.played
        end
    end
    return most_played_hand
end

function coming_home_draws()
    local most_played_hand = hand_most_played()
    sendDebugMessage("Looking to draw: "..most_played_hand)
    local draw_outcome = false
    if most_played_hand == "Five of a Kind" then
        draw_outcome, _ = draw_for_X_times(5, true)
    elseif most_played_hand == "Straight Flush" then
        draw_outcome, _ = draw_for_straight_flush(true)
    elseif most_played_hand == "Four of a Kind" then
        draw_outcome, _ = draw_for_X_times(4, true)
    elseif most_played_hand == "Full House" then
        draw_outcome, _ = draw_for_full_house(true)
    elseif most_played_hand == "Flush" then
        draw_outcome, _ = draw_for_flush(true)
    elseif most_played_hand == "Straight" then
        draw_outcome, _ = draw_for_straight(true)
    elseif most_played_hand == "Three of a Kind" then
        draw_outcome, _ = draw_for_X_times(3, true)
    elseif most_played_hand == "Two Pair" then
        draw_outcome, _ = draw_for_two_pairs(true)
    elseif most_played_hand == "Pair" then 
        draw_outcome, _ = draw_for_X_times(2, true)
    elseif most_played_hand == "High Card" then
    else end
    return draw_outcome
end

function draw_for_X_times(xtimes, draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local possible_numbers = {}
    local possible_draws = {}
    local possible_draw_cnt = 0
    local draws_needed = {}
    -- Check for hand availibility
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_id = v:get_id()
            if possible_numbers[card_id] then 
                possible_numbers[card_id] = possible_numbers[card_id] + 1
                draws_needed[card_id] = draws_needed[card_id] - 1
            else 
                possible_numbers[card_id] = 1 
                possible_draws[card_id] = {}
                draws_needed[card_id] = xtimes - 1
            end
        end
    end
    -- Check deck for possibility
    for k, v in ipairs(G.deck.cards) do
        local card_id = v:get_id()
        if possible_numbers[card_id] then
            possible_numbers[card_id] = possible_numbers[card_id] + 1
            table.insert(possible_draws[card_id], v)
        else 
            possible_numbers[card_id] = 1 
            possible_draws[card_id] = {}
            table.insert(possible_draws[card_id], v)
            draws_needed[card_id] = xtimes
        end
    end

    --sendDebugMessage("Deck Depth: "..#G.deck.cards)
    --sendDebugMessage("Hand limit: "..G.hand.config.card_limit)
    --sendDebugMessage("Hand hold: "..#G.hand.cards)
    --sendDebugMessage("Hand highlighted: "..#G.hand.highlighted)
    --sendDebugMessage("Hand Space: "..hand_space)
    

    local draw_possible = false
    local draw_cnt = 0
    -- Check for feasibility (whether a hand is possible at all)
    -- Check for satisfiability (whether the remaining hand is enough to draw it)
    -- If draw is possible, draw
    for k, _ in pairs(possible_numbers) do
        if possible_numbers[k] >= xtimes and draws_needed[k] <= hand_space then 
            draw_possible = true
            possible_draw_cnt = possible_draw_cnt + 1
            if drawflag and draw_cnt < hand_space then
                for i, v in ipairs(possible_draws[k]) do
                    sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                    draw_cnt = draw_cnt + 1
                    if draw_cnt >= hand_space then break end
                end
            end
            --if draw_cnt >= hand_space then break end
        end
        if draw_cnt > 0 then break end
    end
    return draw_possible, possible_draw_cnt
end

function draw_for_two_pairs(draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local possible_numbers = {}
    local possible_draws = {}
    local possible_draw_cnt = 0
    local draws_needed = {}
    local ready_pair = 0
    local half_ready_pair = 0
    local half_ready_pair_record = {}

    --local contains_2, number_of_2 = draw_for_X_times(2, false)
    -- Check for hand availibility
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_id = v:get_id()
            if possible_numbers[card_id] then 
                possible_numbers[card_id] = possible_numbers[card_id] + 1
                draws_needed[card_id] = draws_needed[card_id] - 1
            else 
                possible_numbers[card_id] = 1 
                possible_draws[card_id] = {}
                draws_needed[card_id] = 1
            end
        end
    end
    for k, v in pairs(draws_needed) do
        if v <= 0 then 
            ready_pair = ready_pair + 1 
        end
        if v == 1 then 
            half_ready_pair = half_ready_pair + 1 
            half_ready_pair_record[k] = true
        end
    end

    -- Check deck for possibility
    for k, v in ipairs(G.deck.cards) do
        local card_id = v:get_id()
        if possible_numbers[card_id] then
            possible_numbers[card_id] = possible_numbers[card_id] + 1
            table.insert(possible_draws[card_id], v)
        else 
            possible_numbers[card_id] = 1 
            possible_draws[card_id] = {}
            table.insert(possible_draws[card_id], v)
            draws_needed[card_id] = 2
        end
    end

    local draw_possible = false
    local draw_cnt = 0
    if ready_pair < 2 then 
        local required_draws = 4 - math.min(half_ready_pair, 2 - ready_pair) - ready_pair * 2
        possible_draw_cnt = possible_draw_cnt + 1
        sendDebugMessage("Half Ready Pair: "..half_ready_pair)
        sendDebugMessage("Ready Pair: "..ready_pair)
        sendDebugMessage("Required Draw: "..required_draws)
        if drawflag and required_draws <= hand_space then 
            for k, _ in pairs(possible_numbers) do
                if half_ready_pair_record[k] then
                    local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[k])
                    local drawn_card = possible_draws[k][draw_idx]
                    sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                    draw_cnt = draw_cnt + 1
                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                end
                if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
            end
            for k, _ in pairs(possible_numbers) do
                if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                if half_ready_pair_record[k] or draw_cnt >= hand_space then
                else
                    for i, v in ipairs(possible_draws[k]) do
                        sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                        draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                        draw_cnt = draw_cnt + 1
                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                    end
                end
            end
        end
    end
    return draw_possible, possible_draw_cnt
end

function draw_for_full_house(draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local possible_numbers = {}
    local possible_draws = {}
    local possible_draw_cnt = 0
    local draws_needed = {}
    local ready_pair = 0
    local ready_pair_record = {}
    local ready_toak = 0
    local ready_toak_record = {}
    local half_ready_pair = 0
    local half_ready_pair_record = {}
    local toak_reserve = nil
    local pair_reserve = nil

    --local contains_2, number_of_2 = draw_for_X_times(2, false)
    -- Check for hand availibility
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_id = v:get_id()
            if possible_numbers[card_id] then 
                possible_numbers[card_id] = possible_numbers[card_id] + 1
                draws_needed[card_id] = draws_needed[card_id] - 1
            else 
                possible_numbers[card_id] = 1 
                possible_draws[card_id] = {}
                draws_needed[card_id] = 2
            end
        end
    end
    for k, v in pairs(draws_needed) do
        if v <= 0 then 
            ready_toak = ready_toak + 1
            ready_toak_record[k] = true
        end
        if v == 1 then 
            ready_pair = ready_pair + 1 
            ready_pair_record[k] = true
        end
        if v == 2 then 
            half_ready_pair = half_ready_pair + 1 
            half_ready_pair_record[k] = true
        end
    end

    -- Check deck for possibility
    for k, v in ipairs(G.deck.cards) do
        local card_id = v:get_id()
        if possible_numbers[card_id] then
            possible_numbers[card_id] = possible_numbers[card_id] + 1
            table.insert(possible_draws[card_id], v)
        else 
            possible_numbers[card_id] = 1 
            possible_draws[card_id] = {}
            table.insert(possible_draws[card_id], v)
            draws_needed[card_id] = 3
        end
    end

    local draw_possible = false
    local draw_cnt = 0
    if ready_toak >= 2 then
    elseif ready_pair >= 1 and ready_toak >= 1 then
    else
        local required_draws = 5
        local hard_decision = nil
        if ready_toak >= 1 then 
            required_draws = required_draws - 3
            if half_ready_pair >= 1 then required_draws = required_draws - 1 end
        elseif ready_pair >= 2 then required_draws = 1
        elseif ready_pair == 1 then 
            required_draws = required_draws - 2
            hard_decision = true
            if half_ready_pair >= 1 then required_draws = required_draws - 1 end
        else
            required_draws = required_draws - math.min(half_ready_pair, 2)
        end
        possible_draw_cnt = possible_draw_cnt + 1
        sendDebugMessage("Half Ready Pair: "..half_ready_pair)
        sendDebugMessage("Ready Pair: "..ready_pair)
        sendDebugMessage("Ready TOAK: "..ready_toak)
        sendDebugMessage("Required Draw: "..required_draws)
        if drawflag and required_draws <= hand_space then 
            -- try to draw a pair if toak exist
            if ready_toak >= 1 then
                for k, _ in pairs(possible_numbers) do
                    if ready_toak_record[k] then
                    elseif half_ready_pair_record[k] and possible_draws[k] and next(possible_draws[k]) then
                        local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[k])
                        local drawn_card = possible_draws[k][draw_idx]
                        sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                        draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                        draw_cnt = draw_cnt + 1
                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                    end
                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                end
                for k, _ in pairs(possible_numbers) do
                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                    if ready_toak_record[k] then
                    elseif half_ready_pair_record[k] or draw_cnt >= hand_space then
                    elseif possible_draws[k] and next(possible_draws[k]) then
                        for i, v in ipairs(possible_draws[k]) do
                            sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                            draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                            draw_cnt = draw_cnt + 1
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                        end
                    end
                end
            -- try to edit add to the pair or draw a toak
            elseif ready_pair >= 1 then
                for k, _ in pairs(possible_numbers) do
                    -- if it is a pair and you can still draw it, make it toak
                    if ready_pair_record[k] and possible_draws[k] and next(possible_draws[k]) then
                        local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[k])
                        local drawn_card = possible_draws[k][draw_idx]
                        sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                        draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                        draw_cnt = draw_cnt + 1
                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                        -- if two pairs
                        for k2, _ in pairs(possible_numbers) do
                            if k ~= k2 and ready_pair_record[k2] and possible_draws[k2] and next(possible_draws[k2]) then
                                local draw_idx2 = pseudorandom(pseudoseed('seed'),1,#possible_draws[k2])
                                local drawn_card2 = possible_draws[k2][draw_idx]
                                sendDebugMessage("Draw Triggered! "..drawn_card2.base.suit.." "..drawn_card2:get_id())
                                draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card2)
                                draw_cnt = draw_cnt + 1
                                if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            end
                        end
                        -- if only one pairs but a bunch of half_pairs
                        for k2, _ in pairs(possible_numbers) do
                            if half_ready_pair_record[k2] and possible_draws[k2] and next(possible_draws[k2]) then
                                local draw_idx2 = pseudorandom(pseudoseed('seed'),1,#possible_draws[k2])
                                local drawn_card2 = possible_draws[k2][draw_idx]
                                sendDebugMessage("Draw Triggered! "..drawn_card2.base.suit.." "..drawn_card2:get_id())
                                draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card2)
                                draw_cnt = draw_cnt + 1
                                if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            end
                        end
                        -- if no half pairs
                        for k2, _ in pairs(possible_numbers) do
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            if half_ready_pair_record[k2] or draw_cnt >= hand_space then
                            elseif possible_draws[k2] and next(possible_draws[k2]) then
                                for i, v in ipairs(possible_draws[k2]) do
                                    sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                                    draw_cnt = draw_cnt + 1
                                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                                end
                            end
                        end
                    -- if it is a pair and you can't draw more of it, use it as pair
                    elseif ready_pair_record[k] then 
                        for k2, _ in pairs(possible_numbers) do
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            if k == k2 then
                            elseif possible_draws[k2] and next(possible_draws[k2]) then
                                local needed_draw = half_ready_pair_record[k] and 2 or 3
                                if #possible_draws[k2] >= needed_draw then
                                    for i, v in ipairs(possible_draws[k2]) do
                                        sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                                        draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                                        draw_cnt = draw_cnt + 1
                                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                                    end
                                end
                            end
                        end
                    end
                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                end
            else 
                -- need to draw a full pair first
                local trio_complete = nil
                for k, _ in pairs(possible_numbers) do
                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                    if half_ready_pair_record[k] and possible_draws[k] and #possible_draws[k] >= 2 then
                        trio_complete = k
                        local inner_cnt = 0
                        for i, v in ipairs(possible_draws[k]) do
                            if inner_cnt >= 2 then break end
                            inner_cnt = inner_cnt + 1
                            sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                            draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                            draw_cnt = draw_cnt + 1
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                        end
                    end
                end
                if trio_complete == nil then 
                    for k, _ in pairs(possible_numbers) do
                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                        if possible_draws[k] and #possible_draws[k] >= 3 then
                            trio_complete = k
                            local inner_cnt = 0
                            for i, v in ipairs(possible_draws[k]) do
                                if inner_cnt >= 3 then break end
                                inner_cnt = inner_cnt + 1
                                sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                                draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                                draw_cnt = draw_cnt + 1
                                if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            end
                        end
                    end
                end
                if trio_complete then 
                    local pair_complete = nil
                    for k, _ in pairs(possible_numbers) do
                        if possible_draws[k] and next(possible_draws[k]) and half_ready_pair_record[k] and k ~= trio_complete then
                            pair_complete = k
                            local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[k])
                            sendDebugMessage(draw_idx)
                            local drawn_card = possible_draws[k][draw_idx]
                            sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                            draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                            draw_cnt = draw_cnt + 1
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                        end
                        if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                    end
                    if pair_complete == nil then
                        required_draws = required_draws + 1
                        for k, _ in pairs(possible_numbers) do
                            if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                            if possible_draws[k] and #possible_draws[k] >= 2 then
                                pair_complete = k
                                for i, v in ipairs(possible_draws[k]) do
                                    sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                                    draw_cnt = draw_cnt + 1
                                    if draw_cnt >= required_draws or draw_cnt >= hand_space then break end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return draw_possible, possible_draw_cnt
end

function draw_for_flush(draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local possible_numbers = {}
    local possible_draws = {}
    local possible_draw_cnt = 0
    local draws_needed = {}

    local four_fingers = next(find_joker('Four Fingers'))
    local xtimes = 5 - (four_fingers and 1 or 0)

    -- Check for hand availibility
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_suit = v.base.suit
            if possible_numbers[card_suit] then 
                possible_numbers[card_suit] = possible_numbers[card_suit] + 1
                draws_needed[card_suit] = draws_needed[card_suit] - 1
            else 
                possible_numbers[card_suit] = 1 
                possible_draws[card_suit] = {}
                draws_needed[card_suit] = xtimes - 1
            end
        end
    end
    -- Check deck for possibility
    for k, v in ipairs(G.deck.cards) do
        local card_suit = v.base.suit
        if possible_numbers[card_suit] then
            possible_numbers[card_suit] = possible_numbers[card_suit] + 1
            table.insert(possible_draws[card_suit], v)
        else 
            possible_numbers[card_suit] = 1 
            possible_draws[card_suit] = {}
            table.insert(possible_draws[card_suit], v)
            draws_needed[card_suit] = xtimes
        end
    end
    --sendDebugMessage("Hand hold: "..#G.hand.cards)
    --sendDebugMessage("Hand highlighted: "..#G.hand.highlighted)
    --sendDebugMessage("Hand Space: "..hand_space)
    
    local draw_possible = false
    local draw_cnt = 0
    -- Check for feasibility (whether a hand is possible at all)
    -- Check for satisfiability (whether the remaining hand is enough to draw it)
    -- If draw is possible, draw
    for k, _ in pairs(possible_numbers) do
        if possible_numbers[k] >= xtimes and draws_needed[k] <= hand_space then 
            draw_possible = true
            possible_draw_cnt = possible_draw_cnt + 1
            if drawflag and draw_cnt < hand_space then
                for i, v in ipairs(possible_draws[k]) do
                    sendDebugMessage("Draw Triggered! "..v.base.suit.." "..v:get_id())
                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, v)
                    draw_cnt = draw_cnt + 1
                    if draw_cnt >= hand_space then break end
                end
            end
            --if draw_cnt >= hand_space then break end
        end
        if draw_cnt > 0 then break end
    end
    return draw_possible, possible_draw_cnt
end

function draw_for_straight(draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local available_values = {}
    local available_values_hand = {}
    local possible_draws = {}
    local possible_draw_cnt = 0

    local four_fingers = next(find_joker('Four Fingers'))
    local shortcut = next(find_joker('Shortcut'))
    local xtimes = 5 - (four_fingers and 1 or 0)
    local gap = 5 - (shortcut and 2 or 1)

    -- Register what is in hand
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_id = v:get_id()
            local card_missing = true
            for _, v in ipairs(available_values) do
                if v == card_id then card_missing = false end
            end
            if card_missing then 
                table.insert(available_values, card_id) 
                table.insert(available_values_hand, card_id) 
            end
        end
    end
    table.sort(available_values)
    table.sort(available_values_hand)
    -- Register what is in deck
    for k, v in ipairs(G.deck.cards) do
        local card_id = v:get_id()
        if possible_draws[card_id] then 
            table.insert(possible_draws[card_id], v)
        else
            possible_draws[card_id] = {}
            table.insert(possible_draws[card_id], v)
        end
        local card_missing = true
        for _, v in ipairs(available_values) do
            if v == card_id then card_missing = false end
        end
        if card_missing then 
            table.insert(available_values, card_id) 
        end
    end
    table.sort(available_values)
    for _, v in ipairs(available_values) do 
        if v == 14 then
            table.insert(available_values, v, 1)
            break 
        end
    end

    --sendDebugMessage("Hand hold: "..#G.hand.cards)
    --sendDebugMessage("Hand highlighted: "..#G.hand.highlighted)
    --sendDebugMessage("Hand Space: "..hand_space)

    local draw_possible = false
    local draw_cnt = 0
    -- Check for feasibility (whether a hand is possible at all)
    -- Check for satisfiability (whether the remaining hand is enough to draw it)
    -- If draw is possible, draw
    for k, v in ipairs(available_values) do
        if #available_values - k < xtimes - 1 then 
        else 
            local straight_possible = true
            local current_value = v
            if k == 1 and current_value == 14 then current_value = 1 end
            for i = 1, xtimes - 1 do 
                if available_values[k + i] and available_values[k + i] - current_value == 1 then 
                    current_value = available_values[k + i]
                else 
                    straight_possible = false
                    break
                end
            end
            if straight_possible then 
                local cards_needed = xtimes
                for i = 0, xtimes - 1 do
                    if available_values_hand then
                        for j, v2 in ipairs(available_values_hand) do
                            if available_values[k + i] and available_values[k + i] == v2 then 
                                cards_needed = cards_needed - 1
                            end
                        end
                    end
                end
                -- Draw possible if enough space is at hand
                if cards_needed <= hand_space then
                    for i = 0, xtimes - 1 do
                        need_to_draw = true
                        if available_values_hand then
                            for j, v2 in ipairs(available_values_hand) do
                                if available_values[k + i] and available_values[k + i] == v2 then 
                                    need_to_draw = false
                                    break
                                end
                            end
                        end
                        if need_to_draw and draw_cnt < hand_space then 
                            possible_draw_cnt = possible_draw_cnt + 1
                            if drawflag and possible_draws[available_values[k + i]] then 
                                local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[available_values[k + i]])
                                local drawn_card = possible_draws[available_values[k + i]][draw_idx]
                                sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                                draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                                draw_cnt = draw_cnt + 1
                                if draw_cnt >= hand_space then break end
                            end
                        end
                    end
                end
            end
        end
        if draw_cnt > 0 then break end
    end
    return draw_possible, possible_draw_cnt
end

function draw_for_straight_flush(draw_or_not)
    local drawflag = draw_or_not
    if draw_or_not then else drawflag = true end
    local hand_space = math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards + #G.hand.highlighted)
    local available_values = {}
    local available_values_hand = {}
    local possible_draws = {}
    local possible_draw_cnt = 0

    local four_fingers = next(find_joker('Four Fingers'))
    local shortcut = next(find_joker('Shortcut'))
    local xtimes = 5 - (four_fingers and 1 or 0)
    local gap = 5 - (shortcut and 2 or 1)

    -- Register what is in hand
    for k, v in ipairs(G.hand.cards) do
        if v.highlighted then
        else
            local card_id = v:get_id()
            local card_suit = v.base.suit
            if available_values[card_suit] then 
                local card_missing = true
                for _, v in ipairs(available_values[card_suit]) do
                    if v == card_id then card_missing = false end
                end
                if card_missing then
                    table.insert(available_values[card_suit], card_id)
                    table.insert(available_values_hand[card_suit], card_id)
                end
            else
                available_values[card_suit] = {}
                available_values_hand[card_suit] = {}
                table.insert(available_values[card_suit], card_id)
                table.insert(available_values_hand[card_suit], card_id)
            end
        end
    end
    for k, v in pairs(available_values) do
        table.sort(available_values[k])
    end
    for k, v in pairs(available_values_hand) do
        table.sort(available_values_hand[k])
    end
    -- Register what is in deck
    for k, v in ipairs(G.deck.cards) do
        local card_id = v:get_id()
        local card_suit = v.base.suit
        if possible_draws[card_suit] then 
        else possible_draws[card_suit] = {} end
        if possible_draws[card_suit][card_id] then 
            table.insert(possible_draws[card_suit][card_id], v)
        else
            possible_draws[card_suit][card_id] = {}
            table.insert(possible_draws[card_suit][card_id], v)
        end
        if available_values[card_suit] then 
            local card_missing = true
            for _, v in ipairs(available_values[card_suit]) do
                if v == card_id then card_missing = false end
            end
            if card_missing then
                table.insert(available_values[card_suit], card_id)
            end
        else
            available_values[card_suit] = {}
            table.insert(available_values[card_suit], card_id)
        end
    end
    for k, _ in pairs(available_values) do
        table.sort(available_values[k])
        for _, v in ipairs(available_values[k]) do 
            if v == 14 then
                table.insert(available_values[k], v, 1)
                break 
            end
        end
    end
    

    --sendDebugMessage("Hand hold: "..#G.hand.cards)
    --sendDebugMessage("Hand highlighted: "..#G.hand.highlighted)
    --sendDebugMessage("Hand Space: "..hand_space)

    local draw_possible = false
    local draw_cnt = 0
    -- Check for feasibility (whether a hand is possible at all)
    -- Check for satisfiability (whether the remaining hand is enough to draw it)
    -- If draw is possible, draw
    for suit, _ in pairs(available_values) do
        for k, v in ipairs(available_values[suit]) do
            if #available_values[suit] - k < xtimes - 1 then 
            else 
                local straight_possible = true
                local current_value = v
                if k == 1 and current_value == 14 then current_value = 1 end
                for i = 1, xtimes - 1 do 
                    if available_values[suit][k + i] and available_values[suit][k + i] - current_value == 1 then 
                        current_value = available_values[suit][k + i]
                    else 
                        straight_possible = false
                        break
                    end
                end
                if straight_possible then 
                    local cards_needed = xtimes
                    for i = 0, xtimes - 1 do
                        if available_values_hand[suit] then
                            for j, v2 in ipairs(available_values_hand[suit]) do
                                if available_values[suit][k + i] and available_values[suit][k + i] == v2 then 
                                    cards_needed = cards_needed - 1
                                end
                            end
                        end
                    end
                    -- Draw possible if enough space is at hand
                    if cards_needed <= hand_space then
                        for i = 0, xtimes - 1 do
                            need_to_draw = true
                            if available_values_hand[suit] then
                                for j, v2 in ipairs(available_values_hand[suit]) do
                                    if available_values[suit][k + i] and available_values[suit][k + i] == v2 then 
                                        need_to_draw = false
                                        break
                                    end
                                end
                            end
                            if need_to_draw and draw_cnt < hand_space then 
                                possible_draw_cnt = possible_draw_cnt + 1
                                if drawflag and possible_draws[suit] and possible_draws[suit][available_values[suit][k + i]] then 
                                    local draw_idx = pseudorandom(pseudoseed('seed'),1,#possible_draws[suit][available_values[suit][k + i]])
                                    local drawn_card = possible_draws[suit][available_values[suit][k + i]][draw_idx]
                                    sendDebugMessage("Draw Triggered! "..drawn_card.base.suit.." "..drawn_card:get_id())
                                    draw_card(G.deck,G.hand, draw_cnt*100/hand_space,'up', true, drawn_card)
                                    draw_cnt = draw_cnt + 1
                                    if draw_cnt >= hand_space then break end
                                end
                            end
                        end
                    end
                end
            end
            if draw_cnt > 0 then break end
        end
        if draw_cnt > 0 then break end
    end
    return draw_possible, possible_draw_cnt
end

evaluate_poker_hand_OG = evaluate_poker_hand
draw_card_OG = draw_card

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