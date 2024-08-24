# Cars AI repo with LimboAI
## Implement Behaviour Tree for NPCs
- Add LimboAI from AssetsLib to Project Root.
- Test run showcase.tscn OK
- Main scene with Tilemap BG 1280x768 (alt+enter fullscreen vewport expand)
- Add Player's basic structure and idle animation
- Add CPU Particles PUFF!!! juice
- Add baloon animations
- Add Fart sounds for Base character
- Add simple Fart sound to animation
- Add Windows Icon to project
- Fix CharacterBody2d Collision safe_margin=1px, gloating mode and moving_platforms
- Continue with https://youtu.be/gAk3xl5fBsM?si=ssjqCplAyqed6iFG&t=1689 ai\tasks\choose_random_pos.gd
- Tested dancing boxes Removed Bump logic and other trash
- Add task with name=agent.name check: if "Player": return FRESH
- Add StartNPC with triggered name agent.name if Player return FRESH than
- Transform StartNPC to start_with_npc: agent_groups=agent.get_groups agent_groups.find("Player")>-1
- Tested Working find_target.gd prints found target NPC node
