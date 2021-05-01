
--- Interval in seconds that specifies how often shark spawns.
--
--  @setting shark.interval
shark.interval = tonumber(core.settings:get("shark.interval")) or 60

--- Chance for each node of spawning shark at each interval.
--
--  The value is inverted. So a chance of value of 9000 equals 1/9000.
--
--  @setting shark.chance
shark.chance = tonumber(core.settings:get("shark.chance")) or 9000

--- Minimum node light required for spawning.
--
--  "0" is darkest & "14" is lightest (daylight).
--  See: [Node definition] light_source
--
--  @setting shark.min_light
shark.min_light = tonumber(core.settings:get("shark.min_light")) or 4

--- Maximum node light required for spawning.
--
--  "0" is darkest & "14" is lightest (daylight).
--  See: [Node definition] light_source
--
--  @setting shark.max_light
shark.max_light = tonumber(core.settings:get("shark.max_light")) or 20

--- Minimum height at which shark can spawn.
--
--  @setting shark.min_height
shark.min_height = tonumber(core.settings:get("shark.min_height")) or -30

--- Maximum height at which shark can spawn.
--
--  @setting shark.max_height
shark.max_height = tonumber(core.settings:get("shark.max_height")) or -3
