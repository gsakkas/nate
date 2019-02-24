module Patches (
  patchContent,
  ) where

-- Hardcoded patch strings; ASTs taken from
--   ../data/sp14_all/clusters/top_clusters.txt

patchContent :: [String]
patchContent = [
    {- "EmptyG"                                               : wildcard                                              -} "_",
    {- "VarG"                                                 : some variable                                         -} "x",
    {- "AppG ([VarG])"                                        : apply some function to a set of args                  -} "f x y z",
    {- "LitG"                                                 : some literal                                          -} "123",
    {- "ListG EmptyG Nothing"                                 : list of something                                     -} "[...]",
    {- "TupleG ([VarG])"                                      : some n-tuple                                          -} "(x, y, ..., z)",
    {- "AppG ([AppG [EmptyG]])"                               : apply some function to function calls                 -} "f (a b) (c d)",
    {- "AppG ([TupleG [EmptyG]])"                             : apply some function to tuples                         -} "f (a, b) (c, d)",
    {- "BopG VarG VarG"                                       : binary op on two vars                                 -} "x * y",
    {- "BopG (AppG [EmptyG]) (AppG [EmptyG])"                 : binary op on two function calls                       -} "(a b c) + (x y z)",
    {- "TupleG ([LitG,ListG EmptyG Nothing])"                 : hetrogenous tuple of literals and lists of somethings -} "(x, 1, ..., [...], [...])",
    {- "BopG VarG LitG"                                       : binary op on a var and a literal                      -} "x * 5",
    {- "BopG (BopG EmptyG EmptyG) LitG"                       : binary op on some binary op and literal               -} "(_ * _) + 1",
    {- "AppG ([AppG [EmptyG],LitG])"                          : apply some function to function calls and literals    -} "f (x y z) 4 1 (g x)",
    {- "LetG NonRec ([VarG]) (LetG NonRec [EmptyG] EmptyG)"   : nonrec let expr binding vars and body another let     -} "let {x = a; y = b} in (let ... in ...)",
    {- "CaseG VarG ([(Nothing,TupleG [EmptyG])])"             : pattern match on a var returning tuples               -} "match x with | _ -> (a, b) | _ -> (c, d)",
    {- "ListG (BopG EmptyG EmptyG) Nothing"                   : list of binary applications                           -} "[(_ * _), ..., (_ * _)]",
    {- "CaseG VarG ([(Nothing,VarG)])"                        : pattern match on a var returning a var                -} "match x with | _ -> a | _ -> b",
    {- "LamG (LamG EmptyG)"                                   : two argument lambda with arbitrary body               -} "fun x -> fun y -> _",
    {- "CaseG VarG ([(Nothing,LetG NonRec [EmptyG] EmptyG)])" : pattern match on a var returning some nonrec let expr -} "match x with | _ -> (let ... in ...)",
    {- "AppG ([VarG,AppG [EmptyG]])"                          : fun calls where args are variables and fun calls      -} "f x y (f x y) z",
    {- "LamG VarG"                                            : lambda whose body is a variable                       -} "fun x -> y",
    {- "TupleG ([VarG,AppG [EmptyG]])"                        : n-tuple of variables and function calls               -} "(x, y, f x, f y)",
    {- "ListG LitG Nothing"                                   : list of literals                                      -} "[1, 2, 6, 3]",
    {- "BopG VarG (AppG [EmptyG])"                            : binary op on a var and a function call                -} "x + f y",
    {- "LamG (LetG NonRec [EmptyG] EmptyG)"                   : lambda whose body is a nonrec let expr                -} "fun x -> (let ... in ...)",
    {- "LamG (AppG [EmptyG])"                                 : lambda whose body is a fun app                        -} "fun x = f x",
    {- "LetG NonRec ([CaseG EmptyG ([(Nothing,EmptyG)])])       nonrec let expr where bound exprs are case exprs and
                    (CaseG EmptyG ([(Nothing,EmptyG)]))"      : the body is another case expr                         -} "let {x = (match ... with ...)} in (match ... with ...)",
    {- "ConAppG (Just (TupleG ([VarG]))) Nothing"             : ???                                                   -} "todo: what is conapp?",
    {- "LamG (TupleG [EmptyG])"                               : lambda whose body is a tuple                          -} "fun x = (y, z, 100)",
    {- "AppG ([AppG [EmptyG],ListG EmptyG Nothing])"          : fun app on fun apps and lists                         -} "f (f x) [x, y] (z 100) []",
    {- "LetG NonRec ([BopG EmptyG EmptyG])                      nonrec let expr where bound exprs are arbitrary binops
                    (CaseG EmptyG ([(Nothing,EmptyG)]))"      : and the body is some case expr                        -} "let {x = _ * _; y = _ * _} in (match ... with ...)",
    {- "TupleG ([ListG EmptyG Nothing])"                      : tuple of lists                                        -} "([_, _], [], [_, _, _])",
    {- "ListG VarG Nothing"                                   : list of vars                                          -} "[x, y, z]",
    {- "LetG NonRec ([VarG]) (TupleG [EmptyG])"               : nonrec let expr binding vars and with body a tuple    -} "let {x = a; y = b} in (_, _)",
    {- "LetG NonRec ([LamG EmptyG]) (AppG [EmptyG])"          : nonrec let expr binding lambdas and body a fun app    -} "let {f = fun x -> _} in f x",
    {- "LetG NonRec ([LamG EmptyG]) (TupleG [EmptyG])"        : nonrec let expr binding lambdas and body a tuple      -} "let {f = fun x -> _} in (_, _)",
    {- "BopG (BopG EmptyG EmptyG) (AppG [EmptyG])"            : binop on binop and fun app                            -} "(_ * _) * f x",
    {- "LetG NonRec ([AppG [EmptyG]]) (AppG [EmptyG])"        : nonrec let expr binding fun app with body a fun app   -} "let {g = f x} in g z",
    {- "AppG ([ConAppG Nothing (Just (TApp \"unit\" []))])    : ???                                                   -} "todo: what is conapp?"
  ]
