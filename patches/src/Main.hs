{-# LANGUAGE OverloadedStrings, ScopedTypeVariables, LambdaCase #-}

import Control.Applicative
import Control.Exception
import Control.Monad
import Data.Aeson
import Data.Aeson.Types (typeMismatch)
import qualified Data.ByteString.Lazy as BL
import qualified Data.Csv as C
import qualified Data.Vector as V
import Debug.Trace

-- Datatypes for program pairs, which are read from
--   ../features/data/ucsd/data/derived/sp14/pairs.json

data Pair = Pair { hw :: String
                 , index :: Int
                 , problem :: String
                 , bad :: String
                 , fix :: String
                 } deriving (Show)

instance FromJSON Pair where
  parseJSON (Object v) = Pair <$> v .: "hw"
                              <*> v .: "index"
                              <*> v .: "problem"
                              <*> v .: "bad"
                              <*> v .: "fix"
  parseJSON invalid    = typeMismatch "Pair" invalid 

-- Datatypes for patches, which are read from
--   ../data/sp14_all/spans+trees+all/0000.csv

type SourceSpan = ((Int, Int), (Int, Int))
readSourceSpan :: String -> SourceSpan
readSourceSpan = read                             -- read as ((Int, Int), (Int, Int))                           
               . (\s -> "(" ++ s ++ ")")          -- add parens                           
               . map (\case {'-' -> ','; c -> c}) -- convert dash to comma

data Patch = Patch { sourceSpan :: SourceSpan
                   , lCluster1 :: Double
                   , lCluster2 :: Double
                   , lCluster3 :: Double
                   } deriving (Show)

instance C.FromNamedRecord Patch where
    parseNamedRecord r = Patch <$> fmap readSourceSpan (r C..: "SourceSpan")
                               <*> r C..: "L-Cluster1"
                               <*> r C..: "L-Cluster2"
                               <*> r C..: "L-Cluster3"

-- Apply a patch to a string (program)

-- Cut a string at the given location (row, column)
cut :: (Int, Int) -> String -> (String, String)
cut loc = f (1, 1) ""
  where
    f :: (Int, Int) -> String -> String -> (String, String)
    f _      _   []                 = error $ "Cut position out of bounds (location " ++ show loc ++ " not found)"
    f loc' acc (x:xs) | loc == loc' = (reverse acc, x:xs)      -- if we are at loc, we have found the cut position
    f (r, c) acc ('\n':xs)          = f (r+1, 1) ('\n':acc) xs -- newline means go down a row
    f (r, c) acc (x:xs)             = f (r, c+1) (x:acc)    xs -- other character means go down a column

-- Replace the given span with a replacement string
splice :: SourceSpan -> String -> String -> String
splice (a, b) replacement str = left ++ replacement ++ right
  where
    (str', right)             = cut b str
    (left, _)                 = cut a str'

-- Apply the patch to the given program, returns a program
applyPatch :: String -> Patch -> String
applyPatch bad patch = splice (sourceSpan patch) replacement bad
  where
    replacement
      | lCluster1 patch > 0.0 = "L-Cluster1"
      | lCluster2 patch > 0.0 = "L-Cluster2"
      | lCluster3 patch > 0.0 = "L-Cluster3"
      | otherwise             = "unknown patch"



-- Main function

main :: IO ()
main = do
  let mkError msg reason = ioError $ userError (msg ++ ": " ++ reason)
  bads <- maybe (mkError "Can't read pairs.json" "Aeson parsing failure")
                (pure . map bad)
                =<< decodeFileStrict' "pairs.json"
  patches <- either (mkError "Can't read patches.csv")
                    (pure . V.toList . snd)
                    =<< C.decodeByName <$> BL.readFile "patches.csv"

  -- Print out pairs of programs and patches
  let pairs = zip bads patches :: [(String, Patch)]
  forM_ pairs $ \(bad, patch) -> print (bad, sourceSpan patch)

  -- Fix all patches
  let fixedPairs = zipWith applyPatch bads patches :: [String]
  print fixedPairs