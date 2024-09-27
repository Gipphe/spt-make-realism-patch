module SPT.Realism.Template
    ( Template (..)
    )
where

import Data.Aeson (ToJSON (..))
import Relude
import SPT.Realism.AmmoTemplate (AmmoTemplate)
import SPT.Realism.GearTemplate (GearTemplate)
import SPT.Realism.GunTemplate (GunTemplate)
import SPT.Realism.ModTemplate (ModTemplate)


data Template
    = AmmoTemplate AmmoTemplate
    | ModTemplate ModTemplate
    | GearTemplate GearTemplate
    | GunTemplate GunTemplate
    deriving stock (Show)


instance ToJSON Template where
    toJSON = \case
        AmmoTemplate a -> toJSON a
        ModTemplate m -> toJSON m
        GearTemplate g -> toJSON g
        GunTemplate g -> toJSON g
