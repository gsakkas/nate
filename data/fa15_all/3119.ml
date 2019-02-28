
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildOp2 (e1,e2,e3) = Op2 (e1, e2, e3);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 ->
         buildOp2
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildOp1 (build (rand, d))
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildOp2 (e1,e2,e3) = Op2 (e1, e2, e3);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 ->
         buildOp2 ((build (rand, d)), (build (rand, d)), (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildOp1 (build (rand, d))
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;

*)

(* changed spans
(48,11)-(49,31)
(build (rand , d) , build (rand , d) , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (47,18)-(47,75)) [App (Just (47,19)-(47,36)) (Var (Just (47,20)-(47,25)) "build") [Tuple (Just (47,26)-(47,35)) [Var (Just (47,27)-(47,31)) "rand",Var (Just (47,33)-(47,34)) "d"]],App (Just (47,38)-(47,55)) (Var (Just (47,39)-(47,44)) "build") [Tuple (Just (47,45)-(47,54)) [Var (Just (47,46)-(47,50)) "rand",Var (Just (47,52)-(47,53)) "d"]],App (Just (47,57)-(47,74)) (Var (Just (47,58)-(47,63)) "build") [Tuple (Just (47,64)-(47,73)) [Var (Just (47,65)-(47,69)) "rand",Var (Just (47,71)-(47,72)) "d"]]]
*)

(* typed spans
(47,18)-(47,75)
*)

(* correct types
(expr * expr * expr)
*)

(* bad types
(expr * expr * expr * expr)
*)
