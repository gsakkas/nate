
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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX else buildY)
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine buildX
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,34)-(27,40)
buildX ()
AppG (fromList [ConAppG Nothing])

(27,46)-(27,52)
buildY ()
AppG (fromList [ConAppG Nothing])

(29,4)-(42,71)
()
ConAppG Nothing

(32,12)-(32,51)
build
VarG

(32,12)-(32,51)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(32,12)-(32,51)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (27,34)-(27,43)) (Var (Just (27,34)-(27,40)) "buildX") [ConApp (Just (27,41)-(27,43)) "()" Nothing (Just (TApp "unit" []))]
App (Just (27,49)-(27,58)) (Var (Just (27,49)-(27,55)) "buildY") [ConApp (Just (27,56)-(27,58)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (27,56)-(27,58)) "()" Nothing (Just (TApp "unit" []))
Var (Just (31,23)-(31,28)) "build"
Tuple (Just (31,29)-(31,48)) [Var (Just (31,30)-(31,34)) "rand",Bop (Just (31,36)-(31,47)) Minus (Var (Just (31,37)-(31,42)) "depth") (Lit (Just (31,45)-(31,46)) (LI 1))]
App (Just (32,12)-(32,51)) (Var (Just (32,12)-(32,23)) "buildCosine") [App (Just (32,24)-(32,51)) (Var (Just (32,25)-(32,30)) "build") [Tuple (Just (32,31)-(32,50)) [Var (Just (32,32)-(32,36)) "rand",Bop (Just (32,38)-(32,49)) Minus (Var (Just (32,39)-(32,44)) "depth") (Lit (Just (32,47)-(32,48)) (LI 1))]]]
*)

(* typed spans
(27,34)-(27,43)
(27,49)-(27,58)
(27,56)-(27,58)
(31,23)-(31,28)
(31,29)-(31,48)
(32,12)-(32,51)
*)

(* correct types
expr
expr
unit
((int * int) -> int * int) -> expr
((int * int) -> int * int)
expr
*)

(* bad types
unit -> expr
unit -> expr
expr
expr
expr
expr
*)
