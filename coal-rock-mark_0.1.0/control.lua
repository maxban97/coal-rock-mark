-- control.lua
local function draw_icon_on_rocks(surface)
  for _, rock in pairs(surface.find_entities_filtered{ name = "huge-rock", type = "simple-entity" }) do
    rendering.draw_sprite{
      sprite = "item/coal",
      target = rock,
      surface = surface,
      x_scale = 1.0,
      y_scale = 1.0,
      render_layer = "light-effect",  -- ensure it's above the entity
      target_offset = {0, -1.5},      -- move it clearly above the rock
      only_in_alt_mode = false
    }
  end
end

script.on_event(defines.events.on_player_created, function(event)
  local player = game.get_player(event.player_index)
  if player and player.valid then
    draw_icon_on_rocks(player.surface)
  end
end)

script.on_event(defines.events.on_chunk_generated, function(event)
  draw_icon_on_rocks(event.surface)
end)
