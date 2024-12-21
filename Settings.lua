Config = {}

Config.Areas = {
    [1] = {
        showBlip = true,                                  -- Show blip?
        blip = {
            coords = vector3(-1843.81, -1225.66, 13.02),  -- Blip's position
            name = "Coin 1",                              -- Blip's name
            color = 4,                                    -- Blip's color (1 = red)
            icon = 605                                    -- Blip's icon (605 = custom icon)
        },
        points = {                                        -- Area boundary points (vector2)
            vector2(-1805.83, -1242.46),
            vector2(-1863.06, -1194.73),
            vector2(-1879.76, -1213.47),
            vector2(-1823.56, -1259.71)
        },
        item = "coin",                                   -- Item to be given
        amount = 1,                                      -- Amount of item
        interval = 6000,                                 -- Interval (milliseconds, 6000 ms = 6 seconds)
        notify = {
            enter = "You have entered the Coin Area!",   -- Area entry notification
            exit = "You have exited the Coin Area!",     -- Area exit notification
            alert = "You have started earning Coins!"    -- Area alert notification
        },
    },

    [2] = {
        showBlip = true,                                  -- Show blip?
        blip = {
            coords = vector3(-3418.31, 967.64, 8.35),  -- Blip's position
            name = "Coin 2",                              -- Blip's name
            color = 1,                                    -- Blip's color (1 = red)
            icon = 605                                    -- Blip's icon (605 = custom icon)
        },
        points = {                                        -- Area boundary points (vector2)
            vector2(-3428.34, 951.82),
            vector2(-3408.85, 951.81),
            vector2(-3408.86, 983.29),
            vector2(-3428.35, 983.29)
        },
        item = "water",                                  -- Item to be given
        amount = 1,                                      -- Amount of item
        interval = 6000,                                 -- Interval (milliseconds, 6000 ms = 6 seconds)
        notify = {
            enter = "You have entered the Water Area!",   -- Area entry notification
            exit = "You have exited the Water Area!",     -- Area exit notification
            alert = "You have started earning Waters!"    -- Area alert notification
        },
    }
}
