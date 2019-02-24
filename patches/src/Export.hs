{-# LANGUAGE DeriveGeneric #-}

module Export (
  export
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

-- Given a list of (input diff, patched program) we'll export a JSON file containing the pairs.
-- It will just be an array of objects with keys {index, bad, fix}.
export :: FilePath -> [(Diff, String)] -> IO ()
export path = encodeFile path . map convert
  where
    convert :: (Diff, String) -> ExportType
    convert (Diff{..}, patched) = ExportType index bad patched