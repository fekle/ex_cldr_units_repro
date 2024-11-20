defmodule ExCldrUnitsRepro.Gettext do
  @moduledoc false
  use Gettext.Backend,
    otp_app: :ex_cldr_units_repro,
    locales: [:de, :en],
    default_locale: :en
end

defmodule ExCldrUnitsRepro.Cldr do
  @moduledoc false
  use Cldr,
    otp_app: :ex_cldr_units_repro,
    locales: [:de, :en],
    default_locale: :en,
    add_fallback_locales: true,
    gettext: ExCldrUnitsRepro.Gettext,
    providers: [
      Cldr.Language,
      Cldr.Number,
      Cldr.Unit
    ]
end

defmodule ExCldrUnitsRepro do
  @moduledoc false
end
