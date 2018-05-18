defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    Shell.info(room.description())

    case chosen_action = select_action(room.actions) do
      :error -> handle_invalid_choice(room)
      _ -> {room, chosen_action}
    end
  end

  defp select_action(room_actions) do
    room_actions
    |> display_options
    |> generate_question
    |> Shell.prompt()
    |> parse_numerical_answer
    |> find_action_by_index(room_actions)
  end

  defp find_action_by_index(index, room_actions)
       when index < 0 or index >= length(room_actions),
       do: :error

  defp find_action_by_index(index, room_actions) do
    Enum.at(room_actions, index)
  end

  defp handle_invalid_choice(room) do
    Shell.info("")
    Shell.info("Please select one of the options...")
    Shell.info("")
    start(room)
  end
end
