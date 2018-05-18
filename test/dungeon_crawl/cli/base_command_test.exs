defmodule DungeonCrawl.CLI.BaseCommandsTest do
  use ExUnit.Case, async: true
  import DungeonCrawl.CLI.BaseCommands

  test "handle empty" do
    assert parse_numerical_answer("") == -1
  end

  test "handle gibberish" do
    assert parse_numerical_answer("Not a number") == -1
  end
end
