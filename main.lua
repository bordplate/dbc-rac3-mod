require 'settings'

function OnLoad()
	print("Starting automation...")
	planet_start_bolts = ratchet.bolts
	
	if game.planet == 1 then  -- Start with defined amount of bolts on Veldin
		ratchet.bolts = VELDIN_START_BOLTS
		planet_start_bolts = VELDIN_START_BOLTS
	end
	
	set_planet_bolts = true
	print("Automation started!")
end

visitedPlanets = {}

function OnTick(ticks)
	local game_state = game.state

	if game_state ~= 0 then
		if game_state == 6 and set_planet_bolts then
			planet_start_bolts = ratchet.bolts
		end
		
		return
	end
	
	if set_planet_bolts ~= true then
		set_planet_bolts = true
	end

	local bolts = ratchet.bolts
	local planet = game.planet
	
	if visitedPlanets[planet] == nil then
		print("Adding " .. planet .. " to visited planets.")
		visitedPlanets[planet] = true
	end
	
	-- Decrease bolts every 10 frames
	if (ticks % BOLT_DECREASE_FREQUENCY) == 0 then
		if planet > 0 then
			bolts = bolts - (#visitedPlanets * BOLT_DECREASE_MULTIPLIER)
		else
			bolts = bolts - 1
		end
		
		ratchet.bolts = bolts
	end
	
	if bolts <= 0 then
		print("No more bolts left, reloading planet ID " .. planet)
		
		set_planet_bolts = false
		
		game:loadPlanet(planet)
		ratchet.bolts = planet_start_bolts
	end
end

function OnUnload()
	print("Unloading automation!")
end