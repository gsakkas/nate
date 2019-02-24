import Control.Exception.Safe
import Control.Monad
import Data.Aeson
import Data.Maybe (catMaybes)
import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.Csv as C
import qualified Data.Vector as V
import Text.Printf

import Types
import Patches

-- Cut a string at the given location (row, column)
cut :: (Int, Int) -> String -> (String, String)
cut loc = f (1, 1) ""
  where
    f :: (Int, Int) -> String -> String -> (String, String)
    f _      _   []                   = ("", "") --error $ "Cut position out of bounds (location " ++ show loc ++ " not found)"
    f loc'   acc (x:xs) | loc == loc' = (reverse acc, x:xs)   -- if we are at loc, we have found the cut position
    f (r, c) acc (x:xs) | x == '\n'   = f (r+1, 1) (x:acc) xs -- newline means go down a row
                        | otherwise   = f (r, c+1) (x:acc) xs -- other character means go down a column

-- Replace the given span with a replacement string
splice :: SourceSpan -> String -> String -> String
splice (a, b) replacement str = left ++ replacement ++ right
  where
    b'                        = let (r, c) = b in (r, c+1) -- include endpoint
    (str', right)             = cut b' str
    (left, _)                 = cut a str'

-- Apply the patch to the given program, returns a program
applyPatch :: Patch -> String -> String
applyPatch patch bad = splice (sourceSpan patch) replacement' bad
  where
    replacement = case cluster patch of
      NoCluster                         -> bad -- means no patch found in csv, will not apply
      (Cluster n) | (n >= 1 && n <= 40) -> patchContent !! (n - 1)
      c                                 -> "UNKNOWN PATCH " ++ show c
    replacement' = "\x1b[32m" ++ replacement ++ "\x1b[0m"



-- Main function

pairsPath, patchesDir :: FilePath
pairsPath = "../features/data/ucsd/data/derived/sp14/pairs.json"
patchesDir = "../data/sp14_all/spans+trees+all"

-- pairsPath = "pairs.json"
-- patchesDir = "."

main :: IO ()
main = do
  -- Read in bad programs and their patches
  -- Sometimes there is no patch file 0000.csv generated for a program, in which case we get Nothing
  -- diffs :: [Diff], fixed :: [Maybe String]
  diffs <- catMaybes . map decode' . BL.lines <$> BL.readFile pairsPath
  fixed <- mapM patch diffs
  let list = filter ((/="") . snd) (zip [0..] fixed)
  forM_ (take 30 list) printProgram
  where
    -- (mkError "a" "b") throws an error "a: b"
    mkError :: String -> String -> IO IOException
    mkError msg reason = ioError $ userError (msg ++ ": " ++ reason)
    patch :: Diff -> IO String
    patch Diff{..} = do
      let patchesPath = printf "%s/%04d.csv" patchesDir index
      fileContents <- try (BL.readFile patchesPath) :: IO (Either IOException BL.ByteString)
      case fileContents of
        Left  _    -> pure $ "" -- "couldn't find patch file: " ++ patchesPath
        Right file ->
          case snd <$> C.decodeByName file :: Either String (V.Vector Patch) of
            Left  err     -> mkError ("Can't read " ++ patchesPath) err >>= throw
            Right patches -> pure $ V.foldr applyPatch bad patches -- apply patches in reverse order
    printProgram :: (Int, String) -> IO ()
    printProgram (i, prog) = do
      printf "Program %04d: \n" i
      putStrLn prog
