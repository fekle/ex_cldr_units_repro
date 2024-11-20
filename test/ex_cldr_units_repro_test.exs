defmodule ExCldrUnitsReproTest do
  use ExUnit.Case

  alias ExCldrUnitsRepro.Cldr

  doctest ExCldrUnitsRepro

  # This fails - the J should be uppercase
  test "32 kilojoules is formatted correctly" do
    assert Cldr.Unit.to_string!(32, unit: :kilojoule, locale: :de, style: :short) == "32 kJ"

    assert Cldr.Unit.to_string!(32, unit: :kilojoule, locale: :en, style: :short) == "32 kJ"
  end

  # This fails
  test "32 megajoules is formatted correctly" do
    assert Cldr.Unit.to_string!(32, unit: :megajoule, locale: :de, style: :short) == "32 MJ"

    assert Cldr.Unit.to_string!(32, unit: :megajoule, locale: :en, style: :short) == "32 MJ"
  end

  # This fails
  test "Unit name kilojoule is formatted correctly" do
    assert Cldr.Unit.display_name(:kilojoule, locale: :de) == "Kilojoule"

    assert Cldr.Unit.display_name(:kilojoule, locale: :en) == "kilojoules"
  end

  # This fails
  test "Unit name megajoule is formatted correctly" do
    assert Cldr.Unit.display_name(:megajoule, locale: :de) == "Megajoule"

    assert Cldr.Unit.display_name(:megajoule, locale: :en) == "megajoules"
  end

  # This fails - Bytes are formatted like bits; the B should be uppercase.
  # When using narrow style, megabit should be Mb with a lowercase b, not the current "Mbit."
  test "Megabytes, kilobytes, and megabits are formatted correctly" do
    assert Cldr.Unit.to_string!(32, unit: :megabyte, locale: :de, style: :narrow) == "32 MB"
    assert Cldr.Unit.to_string!(32, unit: :kilobyte, locale: :de, style: :narrow) == "32 kB"
    assert Cldr.Unit.to_string!(32, unit: :megabit, locale: :de, style: :narrow) == "32 Mb"

    assert Cldr.Unit.to_string!(32, unit: :megabyte, locale: :en, style: :narrow) == "32 MB"
    assert Cldr.Unit.to_string!(32, unit: :kilobyte, locale: :en, style: :narrow) == "32 kB"
    assert Cldr.Unit.to_string!(32, unit: :megabit, locale: :en, style: :narrow) == "32 Mb"
  end
end
