module Hinfo.Options.Internal.Types where

import Options.Applicative

data AppOption = Name
                | Version
                | Description


appOpts :: ParserInfo AppOption
appOpts = info(appOptionParser <**> helper)
  ( fullDesc
  <> progDesc "Report Information On A Haskell App"
  <> header "hinfo - information on haskell apps")

appOptionParser :: Parser AppOption
appOptionParser = nameInput <|> versionInput <|> descriptionInput

nameInput :: Parser AppOption
nameInput = flag' Name
  ( long "name" <> short 'n' <> help "Report Application Name")

versionInput :: Parser AppOption
versionInput = flag' Version
  ( long "version" <> short 'v' <> help "Report Application Version")

descriptionInput :: Parser AppOption
descriptionInput = flag' Description
  (long "description" <> short 'd' <> help "Report Application Description")