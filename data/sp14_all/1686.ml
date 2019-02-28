
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
            (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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
(36,10)-(37,34)
(build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (36,10)-(37,57)) [App (Just (36,11)-(36,32)) (Var (Just (36,12)-(36,17)) "build") [Tuple (Just (36,18)-(36,31)) [Var (Just (36,19)-(36,23)) "rand",Var (Just (36,25)-(36,30)) "depth"]],App (Just (36,34)-(36,55)) (Var (Just (36,35)-(36,40)) "build") [Tuple (Just (36,41)-(36,54)) [Var (Just (36,42)-(36,46)) "rand",Var (Just (36,48)-(36,53)) "depth"]],App (Just (37,12)-(37,33)) (Var (Just (37,13)-(37,18)) "build") [Tuple (Just (37,19)-(37,32)) [Var (Just (37,20)-(37,24)) "rand",Var (Just (37,26)-(37,31)) "depth"]],App (Just (37,35)-(37,56)) (Var (Just (37,36)-(37,41)) "build") [Tuple (Just (37,42)-(37,55)) [Var (Just (37,43)-(37,47)) "rand",Var (Just (37,49)-(37,54)) "depth"]]]
*)

(* typed spans
(36,10)-(37,57)
*)

(* correct types
(expr * expr * expr * expr)
*)

(* bad types
(expr * expr * expr)
*)
