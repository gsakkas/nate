module Patches (
  patchContent,
  ) where

patchContent :: [String]
patchContent = [
    {- "EmptyG"                                                -} "",
    {- "VarG"                                                  -} "x",
    {- "AppG ([VarG])"                                         -} "(x y z)",
    {- "LitG"                                                  -} "123",
    {- "ListG EmptyG Nothing"                                  -} "[]",
    {- "TupleG ([VarG])"                                       -} "(x, y, ..., z)",
    {- "AppG ([AppG [EmptyG]])"                                -} "(a b) (c d)",
    {- "AppG ([TupleG [EmptyG]])"                              -} "x * y",
    {- "BopG VarG VarG"                                        -} "(a b c) + (x y z)",
    {- "BopG (AppG [EmptyG]) (AppG [EmptyG])"                  -} "(x, 1, ..., \"abc\")",
    {- "TupleG ([LitG,ListG EmptyG Nothing])"                  -} "x * 5",
    {- "BopG VarG LitG"                                        -} "(_ * _) + 1",
    {- "BopG (BopG EmptyG EmptyG) LitG"                        -} "(x y z) 4 1 2",
    {- "AppG ([AppG [EmptyG],LitG])"                           -} "(_ * _), ..., (_ * _)]",
    {- "LetG NonRec ([VarG]) (LetG NonRec [EmptyG] EmptyG)"    -} "todo",
    {- "CaseG VarG ([(Nothing,TupleG [EmptyG])])"              -} "todo",
    {- "ListG (BopG EmptyG EmptyG) Nothing"                    -} "todo",
    {- "CaseG VarG ([(Nothing,VarG)])"                         -} "todo",
    {- "LamG (LamG EmptyG)"                                    -} "todo",
    {- "CaseG VarG ([(Nothing,LetG NonRec [EmptyG] EmptyG)])"  -} "todo",
    {- "AppG ([VarG,AppG [EmptyG]])"                           -} "todo",
    {- "LamG VarG"                                             -} "todo",
    {- "TupleG ([VarG,AppG [EmptyG]])"                         -} "todo",
    {- "ListG LitG Nothing"                                    -} "todo",
    {- "BopG VarG (AppG [EmptyG])"                             -} "todo",
    {- "LamG (LetG NonRec [EmptyG] EmptyG)"                    -} "todo",
    {- "LamG (AppG [EmptyG])"                                  -} "todo",
    {- "LetG NonRec ([CaseG EmptyG ([(Nothing,EmptyG)])])
                    (CaseG EmptyG ([(Nothing,EmptyG)]))"       -} "todo",
    {- "ConAppG (Just (TupleG ([VarG]))) Nothing"              -} "todo",
    {- "LamG (TupleG [EmptyG])"                                -} "todo",
    {- "AppG ([AppG [EmptyG],ListG EmptyG Nothing])"           -} "todo",
    {- "LetG NonRec ([BopG EmptyG EmptyG])
                    (CaseG EmptyG ([(Nothing,EmptyG)]))"       -} "todo",
    {- "TupleG ([ListG EmptyG Nothing])"                       -} "todo",
    {- "ListG VarG Nothing"                                    -} "todo",
    {- "LetG NonRec ([VarG]) (TupleG [EmptyG])"                -} "todo",
    {- "LetG NonRec ([LamG EmptyG]) (AppG [EmptyG])"           -} "todo",
    {- "LetG NonRec ([LamG EmptyG]) (TupleG [EmptyG])"         -} "todo",
    {- "BopG (BopG EmptyG EmptyG) (AppG [EmptyG])"             -} "todo",
    {- "LetG NonRec ([AppG [EmptyG]]) (AppG [EmptyG])"         -} "todo",
    {- "AppG ([ConAppG Nothing (Just (TApp \"unit\" []))])     -} "todo"
  ]






-- Hardcoded patch string, taken from
--   ../data/sp14_all/clusters/top_clusters.txt

patchAST :: [String]
patchAST = [
    "EmptyG",
    "VarG",
    "AppG ([VarG])",
    "LitG",
    "ListG EmptyG Nothing",
    "TupleG ([VarG])",
    "AppG ([AppG [EmptyG]])",
    "AppG ([TupleG [EmptyG]])",
    "BopG VarG VarG",
    "BopG (AppG [EmptyG]) (AppG [EmptyG])",
    "TupleG ([LitG,ListG EmptyG Nothing])",
    "BopG VarG LitG",
    "BopG (BopG EmptyG EmptyG) LitG",
    "AppG ([AppG [EmptyG],LitG])",
    "LetG NonRec ([VarG]) (LetG NonRec [EmptyG] EmptyG)",
    "CaseG VarG ([(Nothing,TupleG [EmptyG])])",
    "ListG (BopG EmptyG EmptyG) Nothing",
    "CaseG VarG ([(Nothing,VarG)])",
    "LamG (LamG EmptyG)",
    "CaseG VarG ([(Nothing,LetG NonRec [EmptyG] EmptyG)])",
    "AppG ([VarG,AppG [EmptyG]])",
    "LamG VarG",
    "TupleG ([VarG,AppG [EmptyG]])",
    "ListG LitG Nothing",
    "BopG VarG (AppG [EmptyG])",
    "LamG (LetG NonRec [EmptyG] EmptyG)",
    "LamG (AppG [EmptyG])",
    "LetG NonRec ([CaseG EmptyG ([(Nothing,EmptyG)])]) (CaseG EmptyG ([(Nothing,EmptyG)]))",
    "ConAppG (Just (TupleG ([VarG]))) Nothing",
    "LamG (TupleG [EmptyG])",
    "AppG ([AppG [EmptyG],ListG EmptyG Nothing])",
    "LetG NonRec ([BopG EmptyG EmptyG]) (CaseG EmptyG ([(Nothing,EmptyG)]))",
    "TupleG ([ListG EmptyG Nothing])",
    "ListG VarG Nothing",
    "LetG NonRec ([VarG]) (TupleG [EmptyG])",
    "LetG NonRec ([LamG EmptyG]) (AppG [EmptyG])",
    "LetG NonRec ([LamG EmptyG]) (TupleG [EmptyG])",
    "BopG (BopG EmptyG EmptyG) (AppG [EmptyG])",
    "LetG NonRec ([AppG [EmptyG]]) (AppG [EmptyG])",
    "AppG ([ConAppG Nothing (Just (TApp \"unit\" []))])"
  ]
