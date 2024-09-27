{-# LANGUAGE TemplateHaskell #-}

module SPT.OverridingTemplate
    ( OverridingTemplate (..)
    )
where

import Data.Aeson.TH (defaultOptions, deriveFromJSON)
import Relude
import SPT.Props (Props)


data OverridingTemplate = MkOverridingTemplate
    { overridingTemplateitemTplToClone :: Text
    , overridingTemplateparentId :: Text
    , overridingTemplateoverrideProperties :: Maybe Props
    }


$(deriveFromJSON defaultOptions ''OverridingTemplate)
