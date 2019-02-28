
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let r = rand (0, 26) in
    let d = depth - 1 in
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildSine (build (rand, d))
    | 3 -> buildSine (build (rand, d))
    | 4 -> buildSine (build (rand, d))
    | 5 -> buildSine (build (rand, d))
    | 6 -> buildCosine (build (rand, d))
    | 7 -> buildCosine (build (rand, d))
    | 8 -> buildCosine (build (rand, d))
    | 9 -> buildCosine (build (rand, d))
    | 10 -> buildCosine (build (rand, d))
    | 11 -> buildTimes (build (rand, d))
    | 12 -> buildTimes (build (rand, d))
    | 13 -> buildTimes (build (rand, d))
    | 14 -> buildTimes (build (rand, d))
    | 15 -> buildTimes (build (rand, d))
    | 16 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 17 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 18 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 19 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 20 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 21 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 22 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 23 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 24 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 25 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
  else
    (let r = rand (0, 1) in match r with | 0 -> buildX () | _ -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let r = rand (0, 26) in
    let d = depth - 1 in
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildSine (build (rand, d))
    | 3 -> buildSine (build (rand, d))
    | 4 -> buildSine (build (rand, d))
    | 5 -> buildSine (build (rand, d))
    | 6 -> buildCosine (build (rand, d))
    | 7 -> buildCosine (build (rand, d))
    | 8 -> buildCosine (build (rand, d))
    | 9 -> buildCosine (build (rand, d))
    | 10 -> buildCosine (build (rand, d))
    | 11 -> buildTimes ((buildX ()), (build (rand, d)))
    | 12 -> buildTimes ((buildX ()), (build (rand, d)))
    | 13 -> buildTimes ((buildX ()), (build (rand, d)))
    | 14 -> buildTimes ((buildX ()), (build (rand, d)))
    | 15 -> buildTimes ((buildX ()), (build (rand, d)))
    | 16 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 17 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 18 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 19 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 20 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 21 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 22 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 23 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 24 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 25 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
  else
    (let r = rand (0, 1) in match r with | 0 -> buildX () | _ -> buildY ());;

*)

(* changed spans
(42,23)-(42,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(43,23)-(43,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(43,24)-(43,29)
buildX
VarG

(43,24)-(43,29)
()
ConAppG Nothing

(43,24)-(43,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(44,23)-(44,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(44,24)-(44,29)
buildX
VarG

(44,24)-(44,29)
()
ConAppG Nothing

(44,24)-(44,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(45,23)-(45,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(45,24)-(45,29)
buildX
VarG

(45,24)-(45,29)
()
ConAppG Nothing

(45,24)-(45,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(46,23)-(46,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(46,24)-(46,29)
buildX
VarG

(46,24)-(46,29)
()
ConAppG Nothing

(46,24)-(46,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (42,23)-(42,55)) [App (Just (42,24)-(42,35)) (Var (Just (42,25)-(42,31)) "buildX") [ConApp (Just (42,32)-(42,34)) "()" Nothing (Just (TApp "unit" []))],App (Just (42,37)-(42,54)) (Var (Just (42,38)-(42,43)) "build") [Tuple (Just (42,44)-(42,53)) [Var (Just (42,45)-(42,49)) "rand",Var (Just (42,51)-(42,52)) "d"]]]
Tuple (Just (43,23)-(43,55)) [App (Just (43,24)-(43,35)) (Var (Just (43,25)-(43,31)) "buildX") [ConApp (Just (43,32)-(43,34)) "()" Nothing (Just (TApp "unit" []))],App (Just (43,37)-(43,54)) (Var (Just (43,38)-(43,43)) "build") [Tuple (Just (43,44)-(43,53)) [Var (Just (43,45)-(43,49)) "rand",Var (Just (43,51)-(43,52)) "d"]]]
Var (Just (43,25)-(43,31)) "buildX"
ConApp (Just (43,32)-(43,34)) "()" Nothing (Just (TApp "unit" []))
App (Just (43,37)-(43,54)) (Var (Just (43,38)-(43,43)) "build") [Tuple (Just (43,44)-(43,53)) [Var (Just (43,45)-(43,49)) "rand",Var (Just (43,51)-(43,52)) "d"]]
Tuple (Just (44,23)-(44,55)) [App (Just (44,24)-(44,35)) (Var (Just (44,25)-(44,31)) "buildX") [ConApp (Just (44,32)-(44,34)) "()" Nothing (Just (TApp "unit" []))],App (Just (44,37)-(44,54)) (Var (Just (44,38)-(44,43)) "build") [Tuple (Just (44,44)-(44,53)) [Var (Just (44,45)-(44,49)) "rand",Var (Just (44,51)-(44,52)) "d"]]]
Var (Just (44,25)-(44,31)) "buildX"
ConApp (Just (44,32)-(44,34)) "()" Nothing (Just (TApp "unit" []))
App (Just (44,37)-(44,54)) (Var (Just (44,38)-(44,43)) "build") [Tuple (Just (44,44)-(44,53)) [Var (Just (44,45)-(44,49)) "rand",Var (Just (44,51)-(44,52)) "d"]]
Tuple (Just (45,23)-(45,55)) [App (Just (45,24)-(45,35)) (Var (Just (45,25)-(45,31)) "buildX") [ConApp (Just (45,32)-(45,34)) "()" Nothing (Just (TApp "unit" []))],App (Just (45,37)-(45,54)) (Var (Just (45,38)-(45,43)) "build") [Tuple (Just (45,44)-(45,53)) [Var (Just (45,45)-(45,49)) "rand",Var (Just (45,51)-(45,52)) "d"]]]
Var (Just (45,25)-(45,31)) "buildX"
ConApp (Just (45,32)-(45,34)) "()" Nothing (Just (TApp "unit" []))
App (Just (45,37)-(45,54)) (Var (Just (45,38)-(45,43)) "build") [Tuple (Just (45,44)-(45,53)) [Var (Just (45,45)-(45,49)) "rand",Var (Just (45,51)-(45,52)) "d"]]
Tuple (Just (46,23)-(46,55)) [App (Just (46,24)-(46,35)) (Var (Just (46,25)-(46,31)) "buildX") [ConApp (Just (46,32)-(46,34)) "()" Nothing (Just (TApp "unit" []))],App (Just (46,37)-(46,54)) (Var (Just (46,38)-(46,43)) "build") [Tuple (Just (46,44)-(46,53)) [Var (Just (46,45)-(46,49)) "rand",Var (Just (46,51)-(46,52)) "d"]]]
Var (Just (46,25)-(46,31)) "buildX"
ConApp (Just (46,32)-(46,34)) "()" Nothing (Just (TApp "unit" []))
App (Just (46,37)-(46,54)) (Var (Just (46,38)-(46,43)) "build") [Tuple (Just (46,44)-(46,53)) [Var (Just (46,45)-(46,49)) "rand",Var (Just (46,51)-(46,52)) "d"]]
*)

(* typed spans
(42,23)-(42,55)
(43,23)-(43,55)
(43,25)-(43,31)
(43,32)-(43,34)
(43,37)-(43,54)
(44,23)-(44,55)
(44,25)-(44,31)
(44,32)-(44,34)
(44,37)-(44,54)
(45,23)-(45,55)
(45,25)-(45,31)
(45,32)-(45,34)
(45,37)-(45,54)
(46,23)-(46,55)
(46,25)-(46,31)
(46,32)-(46,34)
(46,37)-(46,54)
*)

(* correct types
(expr * expr)
(expr * expr)
unit -> expr
unit
expr
(expr * expr)
unit -> expr
unit
expr
(expr * expr)
unit -> expr
unit
expr
(expr * expr)
unit -> expr
unit
expr
*)

(* bad types
expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
((int * int) -> int * int) -> expr
*)
