module Main (main) where

import Args (Args (..), argsP)
import Data.Aeson (eitherDecodeFileStrict)
import Options.Applicative
    ( execParser
    , fullDesc
    , helper
    , info
    , progDesc
    )
import Relude
import SPT.Template (Template)


main :: IO ()
main = do
    args <-
        execParser
            $ info (argsP <**> helper)
            $ fullDesc
            <> progDesc "Create Realism mod patch based on an existing JSON file"
    res <- eitherDecodeFileStrict @(Map Text Template) args.file
    print res
