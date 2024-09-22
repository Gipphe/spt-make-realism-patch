module SPT.Realism.TH (derivingOpts) where

import Data.Aeson.TH
    ( Options
    , defaultOptions
    , fieldLabelModifier
    , omitNothingFields
    )
import Data.Char (toUpper)
import Prelude.Linear


derivingOpts :: Options
derivingOpts =
    defaultOptions
        { fieldLabelModifier = \case
            x : xs -> toUpper x : xs
            xs -> xs
        , omitNothingFields = True
        }
