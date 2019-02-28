
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (7, 9) else (1, 7)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 -> buildECosSin (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 7 -> VarX
  | 8 -> VarY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (7, 9) else (1, 7)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 -> VarX
  | 8 -> VarY;;

*)

(* changed spans
(37,9)-(37,77)
buildECosSin (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (38,6)-(38,77)) (Var (Just (38,6)-(38,18)) "buildECosSin") [Tuple (Just (38,19)-(38,77)) [App (Just (38,20)-(38,47)) (Var (Just (38,21)-(38,26)) "build") [Tuple (Just (38,27)-(38,46)) [Var (Just (38,28)-(38,32)) "rand",Bop (Just (38,34)-(38,45)) Minus (Var (Just (38,35)-(38,40)) "depth") (Lit (Just (38,43)-(38,44)) (LI 1))]],App (Just (38,49)-(38,76)) (Var (Just (38,50)-(38,55)) "build") [Tuple (Just (38,56)-(38,75)) [Var (Just (38,57)-(38,61)) "rand",Bop (Just (38,63)-(38,74)) Minus (Var (Just (38,64)-(38,69)) "depth") (Lit (Just (38,72)-(38,73)) (LI 1))]]]]
*)

(* typed spans
(38,6)-(38,77)
*)

(* correct types
expr
*)

(* bad types
expr
*)
