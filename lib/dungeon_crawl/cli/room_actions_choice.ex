defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    room_actions = room.actions

    Shell.info(room.description())

    chosen_action =
      room_actions
      |> display_options
      |> generate_question
      |> Shell.prompt()
      |> parse_answer
      |> find_action_by_index(room_actions)
      |> handle_choice(room)

    {room, chosen_action}
  end

  defp find_action_by_index(index, room_actions) when index < 0 or index >= length(room_actions), do: :error

  defp find_action_by_index(index, room_actions) do
    Enum.at(room_actions, index)
  end

  defp handle_choice(:error, room) do
    Shell.info("")
    Shell.info("Please select one of the options...")
    Shell.info("")
    start(room)
  end

  defp handle_choice(action, _), do: action
end
