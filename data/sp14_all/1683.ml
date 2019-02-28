
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

let rec build (rand,depth) =
  if depth > 0
  then
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth));;


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
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
    | 3 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
    | 4 ->
        buildThresh
          ((build (rand, depth)), (build (rand, depth)),
            (build (rand, depth)), (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(21,15)-(30,44)
fun () -> VarX
LamG (ConAppG Nothing)

(21,15)-(30,44)
fun () -> VarY
LamG (ConAppG Nothing)

(28,24)-(28,45)
(build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

(29,11)-(29,21)
build
VarG

(29,11)-(29,21)
(rand , depth)
TupleG (fromList [VarG])

(29,11)-(29,21)
buildTimes (build (rand , depth) , build (rand , depth))
AppG (fromList [TupleG (fromList [EmptyG])])

(29,22)-(29,43)
(build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

(30,11)-(30,22)
build
VarG

(30,11)-(30,22)
(rand , depth)
TupleG (fromList [VarG])

(30,11)-(30,22)
buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
AppG (fromList [TupleG (fromList [EmptyG])])

(30,23)-(30,44)
(build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

(22,2)-(30,44)
build (rand , depth)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,2)-(30,44)
build (rand , depth)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,2)-(30,44)
build (rand , depth)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,2)-(30,44)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (21,11)-(21,20)) (ConPat (Just (21,11)-(21,13)) "()" Nothing) (ConApp (Just (21,16)-(21,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (23,11)-(23,20)) (ConPat (Just (23,11)-(23,13)) "()" Nothing) (ConApp (Just (23,16)-(23,20)) "VarY" Nothing Nothing) Nothing
Tuple (Just (32,24)-(32,70)) [App (Just (32,25)-(32,46)) (Var (Just (32,26)-(32,31)) "build") [Tuple (Just (32,32)-(32,45)) [Var (Just (32,33)-(32,37)) "rand",Var (Just (32,39)-(32,44)) "depth"]],App (Just (32,48)-(32,69)) (Var (Just (32,49)-(32,54)) "build") [Tuple (Just (32,55)-(32,68)) [Var (Just (32,56)-(32,60)) "rand",Var (Just (32,62)-(32,67)) "depth"]]]
Var (Just (32,49)-(32,54)) "build"
Tuple (Just (32,55)-(32,68)) [Var (Just (32,56)-(32,60)) "rand",Var (Just (32,62)-(32,67)) "depth"]
App (Just (33,11)-(33,68)) (Var (Just (33,11)-(33,21)) "buildTimes") [Tuple (Just (33,22)-(33,68)) [App (Just (33,23)-(33,44)) (Var (Just (33,24)-(33,29)) "build") [Tuple (Just (33,30)-(33,43)) [Var (Just (33,31)-(33,35)) "rand",Var (Just (33,37)-(33,42)) "depth"]],App (Just (33,46)-(33,67)) (Var (Just (33,47)-(33,52)) "build") [Tuple (Just (33,53)-(33,66)) [Var (Just (33,54)-(33,58)) "rand",Var (Just (33,60)-(33,65)) "depth"]]]]
Tuple (Just (33,22)-(33,68)) [App (Just (33,23)-(33,44)) (Var (Just (33,24)-(33,29)) "build") [Tuple (Just (33,30)-(33,43)) [Var (Just (33,31)-(33,35)) "rand",Var (Just (33,37)-(33,42)) "depth"]],App (Just (33,46)-(33,67)) (Var (Just (33,47)-(33,52)) "build") [Tuple (Just (33,53)-(33,66)) [Var (Just (33,54)-(33,58)) "rand",Var (Just (33,60)-(33,65)) "depth"]]]
Var (Just (33,47)-(33,52)) "build"
Tuple (Just (33,53)-(33,66)) [Var (Just (33,54)-(33,58)) "rand",Var (Just (33,60)-(33,65)) "depth"]
App (Just (35,8)-(37,57)) (Var (Just (35,8)-(35,19)) "buildThresh") [Tuple (Just (36,10)-(37,57)) [App (Just (36,11)-(36,32)) (Var (Just (36,12)-(36,17)) "build") [Tuple (Just (36,18)-(36,31)) [Var (Just (36,19)-(36,23)) "rand",Var (Just (36,25)-(36,30)) "depth"]],App (Just (36,34)-(36,55)) (Var (Just (36,35)-(36,40)) "build") [Tuple (Just (36,41)-(36,54)) [Var (Just (36,42)-(36,46)) "rand",Var (Just (36,48)-(36,53)) "depth"]],App (Just (37,12)-(37,33)) (Var (Just (37,13)-(37,18)) "build") [Tuple (Just (37,19)-(37,32)) [Var (Just (37,20)-(37,24)) "rand",Var (Just (37,26)-(37,31)) "depth"]],App (Just (37,35)-(37,56)) (Var (Just (37,36)-(37,41)) "build") [Tuple (Just (37,42)-(37,55)) [Var (Just (37,43)-(37,47)) "rand",Var (Just (37,49)-(37,54)) "depth"]]]]
Tuple (Just (36,10)-(37,57)) [App (Just (36,11)-(36,32)) (Var (Just (36,12)-(36,17)) "build") [Tuple (Just (36,18)-(36,31)) [Var (Just (36,19)-(36,23)) "rand",Var (Just (36,25)-(36,30)) "depth"]],App (Just (36,34)-(36,55)) (Var (Just (36,35)-(36,40)) "build") [Tuple (Just (36,41)-(36,54)) [Var (Just (36,42)-(36,46)) "rand",Var (Just (36,48)-(36,53)) "depth"]],App (Just (37,12)-(37,33)) (Var (Just (37,13)-(37,18)) "build") [Tuple (Just (37,19)-(37,32)) [Var (Just (37,20)-(37,24)) "rand",Var (Just (37,26)-(37,31)) "depth"]],App (Just (37,35)-(37,56)) (Var (Just (37,36)-(37,41)) "build") [Tuple (Just (37,42)-(37,55)) [Var (Just (37,43)-(37,47)) "rand",Var (Just (37,49)-(37,54)) "depth"]]]
App (Just (36,34)-(36,55)) (Var (Just (36,35)-(36,40)) "build") [Tuple (Just (36,41)-(36,54)) [Var (Just (36,42)-(36,46)) "rand",Var (Just (36,48)-(36,53)) "depth"]]
App (Just (37,12)-(37,33)) (Var (Just (37,13)-(37,18)) "build") [Tuple (Just (37,19)-(37,32)) [Var (Just (37,20)-(37,24)) "rand",Var (Just (37,26)-(37,31)) "depth"]]
App (Just (37,35)-(37,56)) (Var (Just (37,36)-(37,41)) "build") [Tuple (Just (37,42)-(37,55)) [Var (Just (37,43)-(37,47)) "rand",Var (Just (37,49)-(37,54)) "depth"]]
Case (Just (38,7)-(38,65)) (App (Just (38,14)-(38,25)) (Var (Just (38,14)-(38,18)) "rand") [Tuple (Just (38,19)-(38,25)) [Lit (Just (38,20)-(38,21)) (LI 0),Lit (Just (38,23)-(38,24)) (LI 1)]]) [(LitPat (Just (38,33)-(38,34)) (LI 0),Nothing,App (Just (38,38)-(38,47)) (Var (Just (38,38)-(38,44)) "buildX") [ConApp (Just (38,45)-(38,47)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (38,50)-(38,51)) (LI 1),Nothing,App (Just (38,55)-(38,64)) (Var (Just (38,55)-(38,61)) "buildY") [ConApp (Just (38,62)-(38,64)) "()" Nothing (Just (TApp "unit" []))])]
*)

(* typed spans
(21,11)-(21,20)
(23,11)-(23,20)
(32,24)-(32,70)
(32,49)-(32,54)
(32,55)-(32,68)
(33,11)-(33,68)
(33,22)-(33,68)
(33,47)-(33,52)
(33,53)-(33,66)
(35,8)-(37,57)
(36,10)-(37,57)
(36,34)-(36,55)
(37,12)-(37,33)
(37,35)-(37,56)
(38,7)-(38,65)
*)

(* correct types
unit -> expr
unit -> expr
(expr * expr)
((int * int) -> int * int) -> expr
((int * int) -> int * int)
expr
(expr * expr)
((int * int) -> int * int) -> expr
((int * int) -> int * int)
expr
(expr * expr * expr * expr)
expr
expr
expr
expr
*)

(* bad types
((int * int) -> int * int) -> unit
((int * int) -> int * int) -> unit
expr
(expr * expr) -> expr
(expr * expr) -> expr
(expr * expr) -> expr
expr
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr) -> expr
expr
unit
unit
unit
unit
*)
