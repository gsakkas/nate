{-# LANGUAGE ScopedTypeVariables #-}

import Control.Exception
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import qualified Data.Csv as C
import qualified Data.Vector as V

import Types (Diff(..), SourceSpan, Patch(..), patchContent)

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
    b'                        = let (r, c) = b in (r, c+1) -- include endpoint
    (str', right)             = cut b' str
    (left, _)                 = cut a str'

-- Apply the patch to the given program, returns a program
applyPatch :: String -> Patch -> String
applyPatch bad patch = splice (sourceSpan patch) replacement' bad
  where
    replacement
      | lCluster1 patch > 0.0 = patchContent !! 0
      | lCluster2 patch > 0.0 = patchContent !! 1
      | lCluster3 patch > 0.0 = patchContent !! 2
      | otherwise             = "unknown patch"
    replacement' = " (" ++ replacement ++ ") "



-- Main function

badProgramPath = "pairs.json"
patchesPath = "patches.csv"

main :: IO ()
main = do
  -- Read in bad programs and their patches
  let mkError msg reason = ioError $ userError (msg ++ ": " ++ reason)
  bads <- maybe (mkError ("Can't read " ++ badProgramPath) "Aeson parse failed")
                (pure . map bad)
                =<< decodeFileStrict' badProgramPath
  patches <- either (mkError ("Can't read " ++ patchesPath))
                    (pure . V.toList . snd)
                    =<< C.decodeByName <$> BL.readFile patchesPath

  -- Print out pairs of programs and patches
  let pairs = zip bads patches :: [(String, Patch)]
  print pairs -- forM_ pairs $ \(bad, patch) -> print (bad, sourceSpan patch)

  -- Fix all patches
  let fixed = zipWith applyPatch bads patches :: [String]
  print fixed