module Types (
  Diff(..),
  SourceSpan,
  Cluster(..),
  Patch(..),
  ) where

import Control.Applicative (empty)
import Data.Aeson
import Data.Aeson.Types
import Data.List (findIndex)
import Data.Maybe (catMaybes)
import qualified Data.ByteString.Char8 as BL
import qualified Data.Csv as C
import qualified Data.HashMap.Lazy as HM
import qualified Data.Vector as V
import Debug.Trace

-- Datatypes for program pairs, which are read from
--   ../features/data/ucsd/data/derived/sp14/pairs.json

data Diff = Diff { hw :: String
                 , index :: Int
                 , problem :: String
                 , bad :: String
                 , fix :: String
                 } deriving (Show)

instance FromJSON Diff where
  parseJSON (Object v) = Diff <$> v .: "hw"
                              <*> v .: "index"
                              <*> v .: "problem"
                              <*> v .: "bad"
                              <*> v .: "fix"
  parseJSON invalid    = typeMismatch "Diff" invalid 

-- Datatypes for patches, which are read from
--   ../data/sp14_all/spans+trees+all/0000.csv

type SourceSpan = ((Int, Int), (Int, Int))
readSourceSpan :: String -> SourceSpan
readSourceSpan = read                             -- read as ((Int, Int), (Int, Int))                           
               . (\s -> "(" ++ s ++ ")")          -- add parens                           
               . map (\case {'-' -> ','; c -> c}) -- convert dash to comma

data Cluster = Cluster Int | NoCluster deriving (Show)
data Patch = Patch { sourceSpan :: SourceSpan
                   , cluster    :: Cluster
                   } deriving (Show)

instance C.FromNamedRecord Patch where
  parseNamedRecord r = do
    sourceSpan <- readSourceSpan <$> (r C..: "SourceSpan")
    -- fields = value of the corresponding fields if they exist (Nothing if field missing)
    fields <- mapM (safeLookup r) ["L-Cluster" <> i | i <- map (BL.pack . show) [1..40]]
           :: C.Parser [(Maybe Double)]
    -- get the index of the first column with value not 0.0, return cluster -1 if not found
    -- add one since index 0 maps to LCluster1
    let i = findIndex (maybe False (>0.0)) (take 40 fields)
    pure . Patch sourceSpan $ maybe NoCluster (Cluster . (+1)) i
    where
      -- a version of lookup that returns C.Parser Nothing on parse failure
      -- this probably exists, but I can't find it
      safeLookup :: (C.FromField a) => C.NamedRecord -> BL.ByteString -> C.Parser (Maybe a)
      safeLookup r name = maybe (pure Nothing) C.parseField (HM.lookup name r)
