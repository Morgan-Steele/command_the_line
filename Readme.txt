StatsManager:
	Maintains user data: health, level, coins
	Maintains Line data: affection, obedience, color, texture, topper, abilities (name, skill level, aptitude, training level, like
	Externally triggered functions: TrainAbility, UseAbility, TakeDamage, Heal, etc.
	Other events trigger StatsManager functions to adjust global user/Line stats

EventsManager
	Adventure events are randomly triggered during gameplay
	Causes a popup where user may have a decision or just press ok
	Specific events are more likely based on relevant stats
	Every minute, there is a % chance of an event happening. If an event is triggered, the specific event is randomly chosen with bias towards events if influenced by stats
	If a choice is made, it calls a function in the StatsManager to adjust stats.
	Reads from StatsManager to influence probability of certain events that are more likely with specific stats.

Combat Manager:
	
