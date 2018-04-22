defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all,
    do: [
      %Character{
        name: "Knight",
        description: "Knight has a strong defense and consistent damage.",
        hit_points: 18,
        max_hit_points: 18,
        attack_description: "a sword",
        damage_range: 4..5
      },
      %Character{
        name: "Wizard",
        description: "Wizard has a strong attact but low health.",
        hit_points: 8,
        max_hit_points: 8,
        attack_description: "a fireball",
        damage_range: 6..10
      },
      %Character{
        name: "Rogue",
        description: "Rogue has high variability of attack damage.",
        hit_points: 12,
        max_hit_points: 12,
        attack_description: "a dagger",
        damage_range: 1..12
      }
    ]
end
