{-# LANGUAGE DeriveGeneric #-}

module Export (
  export,
  ExportType(..),
  ) where

import Control.Monad
import Data.Aeson
import GHC.Generics

import Types

data ExportType = ExportType { index :: Int
                             , bad   :: String
                             , fix   :: String
                             } deriving Generic

instance ToJSON ExportType where
  toEncoding = genericToEncoding defaultOptions

-- Given a list of ExportType we'll export a JSON file containing the pairs.
-- It will just be an array of objects with keys {index, bad, fix}.
export :: FilePath -> [ExportType] -> IO ()
export = encodeFile