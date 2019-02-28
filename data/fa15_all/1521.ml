
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
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;


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
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(38,10)-(39,40)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (38,10)-(39,69)) [App (Just (38,11)-(38,38)) (Var (Just (38,12)-(38,17)) "build") [Tuple (Just (38,18)-(38,37)) [Var (Just (38,19)-(38,23)) "rand",Bop (Just (38,25)-(38,36)) Minus (Var (Just (38,26)-(38,31)) "depth") (Lit (Just (38,34)-(38,35)) (LI 1))]],App (Just (38,40)-(38,67)) (Var (Just (38,41)-(38,46)) "build") [Tuple (Just (38,47)-(38,66)) [Var (Just (38,48)-(38,52)) "rand",Bop (Just (38,54)-(38,65)) Minus (Var (Just (38,55)-(38,60)) "depth") (Lit (Just (38,63)-(38,64)) (LI 1))]],App (Just (39,12)-(39,39)) (Var (Just (39,13)-(39,18)) "build") [Tuple (Just (39,19)-(39,38)) [Var (Just (39,20)-(39,24)) "rand",Bop (Just (39,26)-(39,37)) Minus (Var (Just (39,27)-(39,32)) "depth") (Lit (Just (39,35)-(39,36)) (LI 1))]],App (Just (39,41)-(39,68)) (Var (Just (39,42)-(39,47)) "build") [Tuple (Just (39,48)-(39,67)) [Var (Just (39,49)-(39,53)) "rand",Bop (Just (39,55)-(39,66)) Minus (Var (Just (39,56)-(39,61)) "depth") (Lit (Just (39,64)-(39,65)) (LI 1))]]]
*)

(* typed spans
(38,10)-(39,69)
*)

(* correct types
(expr * expr * expr * expr)
*)

(* bad types
(expr * expr * expr)
*)
