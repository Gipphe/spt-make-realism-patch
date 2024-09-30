{-# LANGUAGE TemplateHaskell #-}

-- | Generated by make-snippets
module SPT.Realism.GunTemplate
    ( GunTemplate (..)
    )
where

import Data.Aeson.TH (deriveToJSON)
import Optics.TH (makeFieldLabels)
import Relude
import SPT.Realism.TH (derivingOpts)


data GunTemplate = MkGunTemplate
    { allowOverheat :: Maybe Bool
    , autoROF :: Maybe Double
    , baseChamberCheckSpeed :: Maybe Double
    , baseChamberSpeedMulti :: Maybe Double
    , baseFixSpeed :: Maybe Double
    , baseMalfunctionChance :: Maybe Double
    , baseReloadSpeedMulti :: Maybe Double
    , baseTorque :: Maybe Double
    , cameraRecoil :: Maybe Double
    , centerOfImpact :: Maybe Double
    , convergence :: Maybe Double
    , coolFactorGun :: Maybe Double
    , coolFactorGunMods :: Maybe Double
    , dispersion :: Maybe Double
    , durabilityBurnRatio :: Maybe Double
    , ergonomics :: Maybe Double
    , foldable :: Maybe Bool
    , hasShoulderContact :: Maybe Bool
    , heatFactorByShot :: Maybe Double
    , heatFactorGun :: Maybe Double
    , height :: Maybe Double
    , hipAccuracyRestorationDelay :: Maybe Double
    , hipAccuracyRestorationSpeed :: Maybe Double
    , hipInnaccuracyGain :: Maybe Double
    , horizontalRecoil :: Maybe Double
    , isManuallyOperated :: Maybe Bool
    , itemID :: Text
    , loyaltyLevel :: Maybe Double
    , masteryCategory :: Maybe Text
    , maxChamberSpeed :: Maybe Double
    , minChamberSpeed :: Maybe Double
    , name :: Text
    , offsetRotation :: Maybe Double
    , operationType :: Maybe Text
    , recoilAngle :: Maybe Double
    , recoilDamping :: Maybe Double
    , recoilForceUp :: Maybe Double
    , recoilHandDamping :: Maybe Double
    , recoilIntensity :: Maybe Double
    , repairCost :: Maybe Double
    , semiROF :: Maybe Double
    , shotgunDispersion :: Maybe Double
    , templateID :: Maybe Text
    , templateType :: Maybe Text
    , velocity :: Maybe Double
    , verticalRecoil :: Maybe Double
    , visualMulti :: Maybe Double
    , weapAccuracy :: Maybe Double
    , weaponAllowADS :: Maybe Bool
    , weapType :: Maybe Text
    , weight :: Maybe Double
    , width :: Maybe Double
    }
    deriving stock (Show)


$(deriveToJSON derivingOpts ''GunTemplate)


$(makeFieldLabels ''Gun)
