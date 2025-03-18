# ExCldrUnitsRepro

Reproduction repository for https://github.com/elixir-cldr/cldr_units/issues/48.

Just install dependencies and run `mix test`.

```
Running ExUnit with seed: 0, max_cases: 20

..

  1) test megajoules formatting formats megajoules in German locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:19
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(1, unit: :megajoule, locale: :de, style: :short) == "1 MJ"
     left:  "1\u00A0Mj"
     right: "1 MJ"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:20: (test)



  2) test megajoules formatting formats megajoules in English locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:23
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(2, unit: :megajoule, locale: :en, style: :short) == "2 MJ"
     left:  "2 Mj"
     right: "2 MJ"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:24: (test)

..

  3) test unit name formatting formats megajoule name in German locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:37
     Assertion with == failed
     code:  assert Cldr.Unit.display_name(:megajoule, locale: :de) == "Megajoule"
     left:  {:error, {Cldr.Unit.UnitNotTranslatableError, "The unit :megajoule is not translatable"}}
     right: "Megajoule"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:38: (test)



  4) test unit name formatting formats megajoule name in English locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:41
     Assertion with == failed
     code:  assert Cldr.Unit.display_name(:megajoule, locale: :en) == "megajoules"
     left:  {:error, {Cldr.Unit.UnitNotTranslatableError, "The unit :megajoule is not translatable"}}
     right: "megajoules"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:42: (test)



  5) test data unit formatting formats megabytes in German locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:47
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(1, unit: :megabyte, locale: :de, style: :narrow) == "1 MB"
     left:  "1 Mb"
     right: "1 MB"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:48: (test)

..

  6) test data unit formatting formats megabytes in English locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:59
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(4, unit: :megabyte, locale: :en, style: :narrow) == "4 MB"
     left:  "4Mb"
     right: "4 MB"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:60: (test)



  7) test data unit formatting formats kilobytes in English locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:63
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(5, unit: :kilobyte, locale: :en, style: :narrow) == "5 kB"
     left:  "5kB"
     right: "5 kB"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:64: (test)



  8) test data unit formatting formats megabits in English locale (ExCldrUnitsReproTest)
     test/ex_cldr_units_repro_test.exs:67
     Assertion with == failed
     code:  assert Cldr.Unit.to_string!(6, unit: :megabit, locale: :en, style: :narrow) == "6 Mb"
     left:  "6Mbit"
     right: "6 Mb"
     stacktrace:
       test/ex_cldr_units_repro_test.exs:68: (test)


Finished in 0.08 seconds (0.00s async, 0.08s sync)
14 tests, 8 failures
```

Comments:

- 1: For some reason, Megajoule in German has a non-breakable space (Unicode \u00A0) between the number and unit. While I think that makes sense, it seems inconsistent with the other formatters. (For example, English Megajoule has a normal space, as does German kilojoule.)
- 1,2: Megajoule should have a big J like kilojoule.
- 3,4: I think Megajoule should be translatable just like kilojoule. But it's not a big deal.
- 5,6: This seems to mix up Megabit and Megabytes - in the narrow format, bytes usually have a big B and bits a small b. Why, oh why did our ancestors have to choose two names with the same first letter? ;-)
- 5,6,7,8: The behaviour regarding separator space seems inconsistent.
- 8: I think in the narrow format, megabit should be Mb, not Mbit (that's the short format, no?) - for German, that seems to work.
