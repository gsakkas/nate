
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
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 5) in
     match recurse with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (rand, (depth - 1))
         else buildSine (rand, (depth - 1)));;


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
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 5) in
     match recurse with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;

*)

(* changed spans
(50,26)-(50,45)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(51,24)-(51,43)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (50,26)-(50,53)) (Var (Just (50,27)-(50,32)) "build") [Tuple (Just (50,33)-(50,52)) [Var (Just (50,34)-(50,38)) "rand",Bop (Just (50,40)-(50,51)) Minus (Var (Just (50,41)-(50,46)) "depth") (Lit (Just (50,49)-(50,50)) (LI 1))]]
App (Just (51,24)-(51,51)) (Var (Just (51,25)-(51,30)) "build") [Tuple (Just (51,31)-(51,50)) [Var (Just (51,32)-(51,36)) "rand",Bop (Just (51,38)-(51,49)) Minus (Var (Just (51,39)-(51,44)) "depth") (Lit (Just (51,47)-(51,48)) (LI 1))]]
*)

(* typed spans
(50,26)-(50,53)
(51,24)-(51,51)
*)

(* correct types
expr
expr
*)

(* bad types
((int * int) -> int * int)
((int * int) -> int * int)
*)
