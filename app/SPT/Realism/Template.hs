{-# LANGUAGE TemplateHaskell #-}

module SPT.Realism.Template
    ( Template (..)
    , AmmoTemplate (..)
    , ModTemplate (..)
    , GearTemplate (..)
    , GunTemplate (..)
    , LoyaltyLevel (..)
    , TemplateType (..)
    , ItemID (..)
    )
where

import Data.Aeson (ToJSON (..))
import Data.Aeson.TH (deriveToJSON)
import Data.Char (toLower)
import Data.Text (Text)
import Prelude.Linear
import SPT.Realism.TH (derivingOpts)


data Template
    = AmmoTemplate AmmoTemplate
    | ModTemplate ModTemplate
    | GearTemplate GearTemplate
    | GunTemplate GunTemplate


instance ToJSON Template where
    toJSON = \case
        AmmoTemplate a -> toJSON a
        ModTemplate m -> toJSON m
        GearTemplate g -> toJSON g
        GunTemplate g -> toJSON g


data AmmoTemplate = MkAmmoTemplate
    { itemID :: ItemID
    , name :: Text
    , templateType :: TemplateType
    , loyaltyLevel :: Maybe LoyaltyLevel
    , basePriceModifier :: Maybe Double
    , damage :: Maybe Word
    , penetrationPower :: Maybe Word
    }


data ModTemplate = MkModTemplate
    { itemID :: ItemID
    , name :: Text
    , templateType :: Maybe TemplateType
    , loyaltyLevel :: Maybe LoyaltyLevel
    , basePriceModifier :: Maybe Double
    , modType :: Text
    , accuracy :: Maybe Double
    , aimSpeed :: Maybe Double
    , autoROF :: Maybe Double
    , blocksFolding :: Maybe Bool
    , cameraRecoil :: Maybe Double
    , canCycleSubs :: Maybe Bool
    , centerOfImpact :: Maybe Double
    , chamberSpeed :: Maybe Double
    , checkTimeModifier :: Maybe Double
    , conflictingItems :: Maybe [ItemID]
    , convergence :: Maybe Double
    , coolFactor :: Maybe Double
    , dispersion :: Maybe Double
    , durabilityBurnModificator :: Maybe Double
    , ergonomics :: Maybe Double
    , flash :: Maybe Double
    , hasShoulderContact :: Maybe Bool
    , heatFactor :: Maybe Double
    , horizontalRecoil :: Maybe Double
    , loadUnloadModifier :: Maybe Double
    , loudness :: Maybe Double
    , magMalfunctionChance :: Maybe Double
    , modMalfunctionChance :: Maybe Double
    , price :: Maybe Int
    , recoilAngle :: Maybe Double
    , reloadSpeed :: Maybe Double
    , semiROF :: Maybe Double
    , shotgunDispersion :: Maybe Double
    , stockAllowADS :: Maybe Bool
    , velocity :: Maybe Double
    , verticalRecoil :: Maybe Double
    , weight :: Maybe Double
    }


data GearTemplate = MkGearTemplate
    { itemID :: ItemID
    , name :: Text
    , templateType :: TemplateType
    , loyaltyLevel :: Maybe LoyaltyLevel
    , basePriceModifier :: Maybe Double
    }


data GunTemplate = MkGunTemplate
    { itemID :: ItemID
    , name :: Text
    , templateType :: TemplateType
    , loyaltyLevel :: LoyaltyLevel
    , basePriceModifier :: Double
    , weapType :: Text
    , operationType :: Text
    , allowOverheat :: Double
    , autoROF :: Double
    , baseChamberCheckSpeed :: Double
    , baseChamberSpeedMulti :: Double
    , baseFixSpeed :: Double
    , baseMalfunctionChance :: Double
    , baseReloadSpeedMulti :: Double
    , baseTorque :: Double
    , cameraRecoil :: Double
    , centerOfImpact :: Double
    , convergence :: Double
    , coolFactorGun :: Double
    , coolFactorGunMods :: Double
    , dispersion :: Double
    , durabilityBurnRatio :: Double
    , ergonomics :: Double
    , hasShoulderContact :: Bool
    , heatFactorByShot :: Double
    , heatFactorGun :: Double
    , hipAccuracyRestorationDelay :: Double
    , hipAccuracyRestorationSpeed :: Double
    , hipInnaccuracyGain :: Double
    , horizontalRecoil :: Double
    , isManuallyOperated :: Bool
    , maxChamberSpeed :: Double
    , minChamberSpeed :: Double
    , offsetRotation :: Double
    , recoilAngle :: Double
    , recoilDamping :: Double
    , recoilHandDamping :: Double
    , recoilIntensity :: Double
    , semiROF :: Double
    , shotgunDispersion :: Double
    , velocity :: Double
    , verticalRecoil :: Double
    , visualMulti :: Double
    , weapAccuracy :: Double
    , weaponAllowADS :: Bool
    , weight :: Double
    }


newtype ItemID = MkItemID {getItemID :: Text}
    deriving (ToJSON) via Text


data TemplateType = Gun | Mod | Gear | Ammo
    deriving stock (Show)


instance ToJSON TemplateType where
    toJSON = toJSON . map toLower . show


newtype LoyaltyLevel = MkLoyaltyLevel {getLoyaltyLevel :: Word}
    deriving (ToJSON) via Word


$(deriveToJSON derivingOpts ''AmmoTemplate)
$(deriveToJSON derivingOpts ''ModTemplate)
