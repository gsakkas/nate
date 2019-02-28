
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
    let rand' = rand (1, 5) in
    match rand with
    | 1 -> buildSine build (rand', (depth - 1))
    | 2 -> buildCosine build (rand', (depth - 1))
    | 3 -> buildTimes ((build (rand', (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand', (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand', (depth - 1))),
            (build (rand', (depth - 1))))
  else buildX;;


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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(30,11)-(30,47)
rand'
VarG

(30,11)-(30,20)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(30,21)-(30,26)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,28)-(30,33)
rand
VarG

(31,11)-(31,49)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(32,31)-(32,36)
rand
VarG

(32,53)-(32,59)
buildY ()
AppG (fromList [ConAppG Nothing])

(33,11)-(33,62)
()
ConAppG Nothing

(33,33)-(33,38)
rand
VarG

(33,55)-(33,61)
buildY ()
AppG (fromList [ConAppG Nothing])

(35,8)-(37,41)
()
ConAppG Nothing

(36,11)-(36,17)
buildX ()
AppG (fromList [ConAppG Nothing])

(36,19)-(36,25)
()
ConAppG Nothing

(36,19)-(36,25)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,27)-(36,55)
()
ConAppG Nothing

(36,35)-(36,40)
rand
VarG

(37,20)-(37,25)
rand
VarG

(38,7)-(38,13)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Var (Just (29,10)-(29,15)) "rand'"
App (Just (30,11)-(30,48)) (Var (Just (30,11)-(30,20)) "buildSine") [App (Just (30,21)-(30,48)) (Var (Just (30,22)-(30,27)) "build") [Tuple (Just (30,28)-(30,47)) [Var (Just (30,29)-(30,33)) "rand",Bop (Just (30,35)-(30,46)) Minus (Var (Just (30,36)-(30,41)) "depth") (Lit (Just (30,44)-(30,45)) (LI 1))]]]
App (Just (30,21)-(30,48)) (Var (Just (30,22)-(30,27)) "build") [Tuple (Just (30,28)-(30,47)) [Var (Just (30,29)-(30,33)) "rand",Bop (Just (30,35)-(30,46)) Minus (Var (Just (30,36)-(30,41)) "depth") (Lit (Just (30,44)-(30,45)) (LI 1))]]
Var (Just (30,29)-(30,33)) "rand"
App (Just (31,11)-(31,50)) (Var (Just (31,11)-(31,22)) "buildCosine") [App (Just (31,23)-(31,50)) (Var (Just (31,24)-(31,29)) "build") [Tuple (Just (31,30)-(31,49)) [Var (Just (31,31)-(31,35)) "rand",Bop (Just (31,37)-(31,48)) Minus (Var (Just (31,38)-(31,43)) "depth") (Lit (Just (31,46)-(31,47)) (LI 1))]]]
Var (Just (32,31)-(32,35)) "rand"
App (Just (32,52)-(32,63)) (Var (Just (32,53)-(32,59)) "buildY") [ConApp (Just (32,60)-(32,62)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (32,60)-(32,62)) "()" Nothing (Just (TApp "unit" []))
Var (Just (33,33)-(33,37)) "rand"
App (Just (33,54)-(33,65)) (Var (Just (33,55)-(33,61)) "buildY") [ConApp (Just (33,62)-(33,64)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (33,62)-(33,64)) "()" Nothing (Just (TApp "unit" []))
App (Just (36,11)-(36,22)) (Var (Just (36,12)-(36,18)) "buildX") [ConApp (Just (36,19)-(36,21)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (36,19)-(36,21)) "()" Nothing (Just (TApp "unit" []))
App (Just (36,24)-(36,35)) (Var (Just (36,25)-(36,31)) "buildY") [ConApp (Just (36,32)-(36,34)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (36,32)-(36,34)) "()" Nothing (Just (TApp "unit" []))
Var (Just (36,45)-(36,49)) "rand"
Var (Just (37,20)-(37,24)) "rand"
App (Just (38,7)-(38,16)) (Var (Just (38,7)-(38,13)) "buildX") [ConApp (Just (38,14)-(38,16)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(29,10)-(29,15)
(30,11)-(30,48)
(30,21)-(30,48)
(30,29)-(30,33)
(31,11)-(31,50)
(32,31)-(32,35)
(32,52)-(32,63)
(32,60)-(32,62)
(33,33)-(33,37)
(33,54)-(33,65)
(33,62)-(33,64)
(36,11)-(36,22)
(36,19)-(36,21)
(36,24)-(36,35)
(36,32)-(36,34)
(36,45)-(36,49)
(37,20)-(37,24)
(38,7)-(38,16)
*)

(* correct types
int
expr
expr
(int * int) -> int
expr
(int * int) -> int
expr
unit
(int * int) -> int
expr
unit
expr
unit
expr
unit
(int * int) -> int
(int * int) -> int
expr
*)

(* bad types
unit -> expr
expr -> expr
expr
'a
unit -> expr
'a
unit -> expr
unit -> expr
'a
unit -> expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
'a
'a
'a
unit -> expr
*)
