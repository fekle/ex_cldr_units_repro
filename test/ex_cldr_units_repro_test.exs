defmodule ExCldrUnitsReproTest do
  use ExUnit.Case

  alias ExCldrUnitsRepro.Cldr

  doctest ExCldrUnitsRepro

  describe "kilojoules formatting" do
    test "formats kilojoules in German locale" do
      assert Cldr.Unit.to_string!(1, unit: :kilojoule, locale: :de, style: :short) == "1 kJ"
    end

    test "formats kilojoules in English locale" do
      assert Cldr.Unit.to_string!(2, unit: :kilojoule, locale: :en, style: :short) == "2 kJ"
    end
  end

  describe "megajoules formatting" do
    test "formats megajoules in German locale" do
      assert Cldr.Unit.to_string!(1, unit: :megajoule, locale: :de, style: :short) == "1 MJ"
    end

    test "formats megajoules in English locale" do
      assert Cldr.Unit.to_string!(2, unit: :megajoule, locale: :en, style: :short) == "2 MJ"
    end
  end

  describe "unit name formatting" do
    test "formats kilojoule name in German locale" do
      assert Cldr.Unit.display_name(:kilojoule, locale: :de) == "Kilojoule"
    end

    test "formats kilojoule name in English locale" do
      assert Cldr.Unit.display_name(:kilojoule, locale: :en) == "kilojoules"
    end

    test "formats megajoule name in German locale" do
      assert Cldr.Unit.display_name(:megajoule, locale: :de) == "Megajoule"
    end

    test "formats megajoule name in English locale" do
      assert Cldr.Unit.display_name(:megajoule, locale: :en) == "megajoules"
    end
  end

  describe "data unit formatting" do
    test "formats megabytes in German locale" do
      assert Cldr.Unit.to_string!(1, unit: :megabyte, locale: :de, style: :narrow) == "1 MB"
    end

    test "formats kilobytes in German locale" do
      assert Cldr.Unit.to_string!(2, unit: :kilobyte, locale: :de, style: :narrow) == "2 kB"
    end

    test "formats megabits in German locale" do
      assert Cldr.Unit.to_string!(3, unit: :megabit, locale: :de, style: :narrow) == "3 Mb"
    end

    test "formats megabytes in English locale" do
      assert Cldr.Unit.to_string!(4, unit: :megabyte, locale: :en, style: :narrow) == "4 MB"
    end

    test "formats kilobytes in English locale" do
      assert Cldr.Unit.to_string!(5, unit: :kilobyte, locale: :en, style: :narrow) == "5 kB"
    end

    test "formats megabits in English locale" do
      assert Cldr.Unit.to_string!(6, unit: :megabit, locale: :en, style: :narrow) == "6 Mb"
    end
  end
end
