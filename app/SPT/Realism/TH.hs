module SPT.Realism.TH (derivingOpts) where

import Data.Aeson.TH
    ( Options
    , defaultOptions
    , fieldLabelModifier
    , omitNothingFields
    )
import Data.Char (toUpper)
import Relude


derivingOpts :: Options
derivingOpts =
    defaultOptions
        { fieldLabelModifier = \case
            x : xs | x == '_' -> xs
            x : xs -> toUpper x : xs
            xs -> xs
        , omitNothingFields = True
        }
