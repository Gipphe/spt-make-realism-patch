module Args
    ( Args (..)
    , argsP
    )
where

import Options.Applicative (Parser, help, long, metavar, short, strOption)
import Relude


newtype Args = MkArgs
    { file :: FilePath
    }
    deriving stock (Show)


argsP :: Parser Args
argsP =
    MkArgs
        <$> strOption
            ( long "file"
                <> short 'f'
                <> metavar "PATH"
                <> help "Input file to create patch from"
            )
