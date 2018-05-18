defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")
    select_hero(DungeonCrawl.Heroes.all())
  end

  defp select_hero(heroes) do
    heroes
    |> display_options
    |> generate_question
    |> Shell.prompt()
    |> parse_numerical_answer
    |> find_hero_by_index(heroes)
    |> confirm_hero(heroes)
  end

  defp find_hero_by_index(index, heroes)
       when index < 0 or index >= length(heroes),
       do: :error

  defp find_hero_by_index(index, heroes) do
    Enum.at(heroes, index)
  end

  defp confirm_hero(:error, heroes), do: handle_invalid_choice(heroes)

  defp confirm_hero(chosen_hero, _) do
    Shell.info("")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end

  defp handle_invalid_choice(heroes) do
    Shell.info("")
    Shell.info("Please select one of the options...")
    Shell.info("")
    select_hero(heroes)
  end
end
