module SPT.Realism.Conversion
    ( convertBaseToRealism
    )
where

import Data.Text qualified as T
import GHC.Records (getField)
import Relude
import SPT.Props qualified as Base
import SPT.Realism.AmmoTemplate (AmmoTemplate (..))
import SPT.Realism.GearTemplate (GearTemplate (..))
import SPT.Realism.GunTemplate (GunTemplate (..))
import SPT.Realism.ModTemplate (ModTemplate (..))
import SPT.Realism.Template (Template (..))
import SPT.Template qualified as Base


convertBaseToRealism :: Base.Template -> Template
convertBaseToRealism tmpl
    | matchesMod tmpl = undefined
    | matchesGear tmpl = undefined
    | matchesGun tmpl = undefined
    | matchesAmmo tmpl = undefined
    | otherwise = undefined


matchesMod :: Base.Template -> Bool
matchesMod tmpl = case tmpl.template_name of
    Just name -> any (`T.isPrefixOf` name) prefixes
    Nothing -> False
  where
    prefixes = ["mod", "sight", "stock", "pistolgrip", "barrel", "handguard", "magazine"]


matchesGear :: Base.Template -> Bool
matchesGear = undefined


matchesAmmo :: Base.Template -> Bool
matchesAmmo tmpl = tmpl ^? #template_props
  where prefixes = ["ammo", "patron"]


matchesGun :: Base.Template -> Bool
matchesGun tmpl =
    maybe False (isJust . (.propsweapClass)) tmpl.template_props
        || maybe
            False
            (isJust . (.propsweapUseType))
            tmpl.template_props
        || maybe
            False
            ( maybe False (\name -> any (`T.isPrefixOf` name) prefixes)
                . (.propsName)
            )
            tmpl.template_props
        || maybe
            False
            (\name -> any (`T.isPrefixOf` name) prefixes)
            tmpl.template_name
  where
    prefixes = ["weap", "gun"]
