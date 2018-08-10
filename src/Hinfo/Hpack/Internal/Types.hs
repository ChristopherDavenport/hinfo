{-# language OverloadedStrings #-}
module Hinfo.Hpack.Internal.Types where


import qualified Data.Text    as T
import qualified Data.Yaml    as Y
import Data.Aeson             (FromJSON(..), Value, (.:), (.:?), withObject)

data PackageFile = PackageFile {
    packageName         :: T.Text
  , packageVersion             :: T.Text
  , packageGithub              :: T.Text
  , packageLicense             :: T.Text
  , packageAuthor              :: T.Text
  , packageMaintainer          :: T.Text
  , packageCopyright           :: T.Text
  , packageExtraSourceFiles    :: [T.Text]
  , packageSynopsis            :: Maybe T.Text
  , packageCategory            :: Maybe T.Text
  , packageDescription         :: T.Text
  , packageDependencies        :: [T.Text]
  , packageExecutables         :: Value
  , packageTests               :: Value
} deriving (Show, Eq)


instance FromJSON PackageFile where
  parseJSON = withObject "PackageFile" $ \v -> PackageFile
    <$> v .: "name"
    <*> v .: "version"
    <*> v .: "github"
    <*> v .: "license"
    <*> v .: "author"
    <*> v .: "maintainer"
    <*> v .: "copyright"
    <*> v .: "extra-source-files"
    <*> v .:? "synopsis"
    <*> v .:? "category"
    <*> v .: "description"
    <*> v .: "dependencies"
    <*> v .: "executables"
    <*> v .: "tests"