-- Lower values decrease bolts faster, 0 is fastest, don't set to lower than 0 plz
BOLT_DECREASE_FREQUENCY = 	10 

-- Bolts decrease by the amount of planets/levels you've visted multiplied by this value. 
-- If you increase this value, bolts decrease by amount of planets visited multiplied by this.
BOLT_DECREASE_MULTIPLIER =  1

-- Example: if BOLT_DECREASE_FREQUENCY is 10 and BOLT_DECREASE_MULTIPLIER is 2 and you've visited 3 planets, bolts decrease by 6 every 10 frames.
-- Since the game runs at 60 frames per second, you'd lose 6 * 6 = 36 bolts every second. 

-- How many bolts you start with at Veldin
VELDIN_START_BOLTS = 50