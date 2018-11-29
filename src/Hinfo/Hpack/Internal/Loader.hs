module Hinfo.Hpack.Internal.Loader where

import Hinfo.Hpack.Internal.Types   (PackageFile)
import Data.Yaml                    (decodeFileThrow)

import Control.Monad.IO.Class       (MonadIO)


loadDefault :: MonadIO m => m PackageFile
loadDefault = loadFile "package.yaml"

loadFile :: MonadIO m => FilePath -> m PackageFile
loadFile = decodeFileThrow