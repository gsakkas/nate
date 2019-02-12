{-# LANGUAGE OverloadedStrings, LambdaCase #-}

module Types (
  Diff(..),
  SourceSpan,
  Patch(..),
  patchContent
  ) where

import Data.Aeson
import Data.Aeson.Types
import qualified Data.Csv as C

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

-- Hardcoded patch string, taken from
--   ../data/sp14_all/clusters/top_clusters.txt

patchContent :: [String]
patchContent = [
    "EmptyG",
    "VarG",
    "AppG (fromList [VarG])",
    "LitG",
    "ListG EmptyG Nothing",
    "TupleG (fromList [VarG])",
    "AppG (fromList [AppG (fromList [EmptyG])])",
    "AppG (fromList [TupleG (fromList [EmptyG])])",
    "BopG VarG VarG",
    "BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))",
    "TupleG (fromList [LitG,ListG EmptyG Nothing])",
    "BopG VarG LitG",
    "BopG (BopG EmptyG EmptyG) LitG",
    "AppG (fromList [AppG (fromList [EmptyG]),LitG])",
    "LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)",
    "CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])",
    "ListG (BopG EmptyG EmptyG) Nothing",
    "CaseG VarG (fromList [(Nothing,VarG)])",
    "LamG (LamG EmptyG)",
    "CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])",
    "AppG (fromList [VarG,AppG (fromList [EmptyG])])",
    "LamG VarG",
    "TupleG (fromList [VarG,AppG (fromList [EmptyG])])",
    "ListG LitG Nothing",
    "BopG VarG (AppG (fromList [EmptyG]))",
    "LamG (LetG NonRec (fromList [EmptyG]) EmptyG)",
    "LamG (AppG (fromList [EmptyG]))",
    "LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))",
    "ConAppG (Just (TupleG (fromList [VarG]))) Nothing",
    "LamG (TupleG (fromList [EmptyG]))",
    "AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])",
    "LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))",
    "TupleG (fromList [ListG EmptyG Nothing])",
    "ListG VarG Nothing",
    "LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))",
    "LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))",
    "LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))",
    "BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))",
    "LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))",
    "AppG (fromList [ConAppG Nothing (Just (TApp \"unit\" []))])"
  ]
