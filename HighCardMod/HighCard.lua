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
    XPlayingHeart5 = true,
    -- Diamond Family
    XPlayingDiamond3 = true,
    XPlayingDiamond7 = true,
    -- Club Family
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
    XPlayingHeart5 = "j_calories_high",
    XPlayingDiamond3 = "j_marble_rumble",
    XPlayingDiamond7 = "j_never_no_dollars",
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
                card:add_to_deck()
                G.jokers:emplace(card)
                G.GAME.joker_buffer = 0
                return true
            end}))
    end

    if config.XPlayingJoker then
        SMODS.Jokers.j_xplay.calculate = function(self, context)
            if SMODS.end_calculate_context(context) then
                if G.GAME.current_round.hands_played == 0 then
                    if context.scoring_name == "High Card" then
                        if context.full_hand[1]:get_id() == 2 and context.full_hand[1]:is_suit("Spades") then
                            return xplay("XPlayingSpade2")
                        end
                        if context.full_hand[1]:get_id() == 14 and context.full_hand[1]:is_suit("Spades") then
                            return xplay("XPlayingSpadeA")
                        end
                        if context.full_hand[1]:get_id() == 5 and context.full_hand[1]:is_suit("Hearts") then
                            return xplay("XPlayingHeart5")
                        end
                        if context.full_hand[1]:get_id() == 3 and context.full_hand[1]:is_suit("Diamonds") then
                            return xplay("XPlayingDiamond3")
                        end
                        if context.full_hand[1]:get_id() == 7 and context.full_hand[1]:is_suit("Diamonds") then
                            return xplay("XPlayingDiamond7")
                        end
                        if context.full_hand[1]:get_id() == 3 and context.full_hand[1]:is_suit("Clubs") then
                            return xplay("XPlayingClub3")
                        end
                    end 
                end
            end
        end
    end

    if config.XPlayingSpade2 then
        SMODS.Jokers.j_neo_new_nambu.calculate = function(self, context)
            --ease_discard(-G.GAME.current_round.discards_left, nil, true)
            --sendDebugMessage(G.hand.size)
            --G.hand:change_size(self.ability.extra.hand_size)
            if context.end_of_round and not self.ability.extra.done then
                --self.ability.extra.done = true
                --sendDebugMessage("End of Round!")
                --G.GAME.blind:set_blind(nil, nil, true)
                end_xplay("XPlayingSpade2")
                self.ability.extra.done = true
                --G.GAME.blind.debuff = {}
                --sendDebugMessage("Transformed!")
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

    if config.XPlayingSpadeA then
        SMODS.Jokers.j_love_and_peace.calculate = function(self, context)
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
            --[[
            if context.discard then 
                self.ability.extra.discard_cnt = self.ability.extra.discard_cnt + 1
                sendDebugMessage(self.ability.extra.discard_cnt)
                sendDebugMessage(#G.hand.highlighted)
                if self.ability.extra.discard_cnt == #G.hand.highlighted then 
                    sendDebugMessage("Love-P Discard Match! ")
                    local any_forced = nil
                    local any_none_nil = nil
                    for k, v in ipairs(G.hand.cards) do
                        if v then 
                            any_none_nil = true 
                        end
                        if v and v.ability.forced_selection then
                            any_forced = true
                        end
                    end
                    if not any_forced and any_none_nil then 
                        --G.hand:unhighlight_all()
                        local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                        while any_none_nil and forced_card == nil do
                            forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                        end
                        forced_card.ability.forced_selection = true
                        G.hand:add_to_highlighted(forced_card)
                    end
                    self.ability.extra.discard_cnt = 0
                end
            end
            ]]--
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

    if config.XPlayingHeart5 then
        SMODS.Jokers.j_calories_high.calculate = function(self, context)
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

    if config.XPlayingDiamond3 then
        SMODS.Jokers.j_marble_rumble.calculate = function(self, context)
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

    if config.XPlayingDiamond7 then
        SMODS.Jokers.j_never_no_dollars.calculate = function(self, context)
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

    if config.XPlayingClub3 then
        SMODS.Jokers.j_green_green.calculate = function(self, context)
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
        if self.ability.name == 'Green Green' then
            evaluate_poker_hand = evaluate_poker_hand_OG
            sendDebugMessage("Straight Effect Wears Off! ")
        end
    end
    remove_from_deckref(self, from_debuff)
end


-- Shady Business here:
-- Function to wrap the original function with your additional logic
function highcard_wraplast(originalFunc, additionalFunc)
    return function(hand)
        -- Call the additional function
        ret = originalFunc(hand)
        ret = additionalFunc(ret)

        -- Then call the original function with all the original arguments
        return ret
    end
end

function always_straight(ret)
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

evaluate_poker_hand_OG = evaluate_poker_hand

----------------------------------------------
------------MOD CODE END----------------------