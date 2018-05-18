defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> display_options
    |> generate_question
    |> Shell.prompt()
    |> parse_answer
    |> find_hero_by_index(heroes)
    |> confirm_hero
  end

  defp find_hero_by_index(index, heroes) when index < 0 or index >= length(heroes), do: :error

  defp find_hero_by_index(index, heroes) do
    Enum.at(heroes, index)
  end

  defp confirm_hero(:error), do: start()

  defp confirm_hero(chosen_hero) do
    Shell.info("")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end
