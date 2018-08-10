module Hinfo 
  (
    app
  , execute
  ) where

import Options.Applicative                (execParser)
import Hinfo.Hpack
import Hinfo.Options
import System.Exit
import qualified Data.Text as T
import qualified Data.Text.IO as T

app :: IO ()
app = do
  options <- execParser appOpts
  packageFile <- loadDefault
  execute options packageFile


execute :: AppOption -> PackageFile -> IO ()
execute  Name        pf = T.putStrLn $ packageName pf
execute  Version     pf = T.putStrLn $ packageVersion pf
execute  Description pf = maybe (die "Missing Description") T.putStrLn $ packageDescription pf