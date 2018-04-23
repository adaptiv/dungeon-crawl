defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      },
      %Room{
        description: "You are in a great hallway. There is a magnificent carpet on the floor.",
        actions: [forward(), search()],
        trigger: Triggers.Trap
      },
      %Room{
        description: "You are in a dark chamber. Thick veils cover the light.",
        actions: [forward(), search()],
        trigger: Triggers.Treasure
      }
    ]
end
