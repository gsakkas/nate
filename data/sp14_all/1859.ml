
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
  if depth <= 0
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;


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
  if depth <= 0
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(40,11)-(41,41)
(first_forced , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (40,11)-(41,70)) [Var (Just (40,12)-(40,24)) "first_forced",App (Just (40,26)-(40,53)) (Var (Just (40,27)-(40,32)) "build") [Tuple (Just (40,33)-(40,52)) [Var (Just (40,34)-(40,38)) "rand",Bop (Just (40,40)-(40,51)) Minus (Var (Just (40,41)-(40,46)) "depth") (Lit (Just (40,49)-(40,50)) (LI 1))]],App (Just (41,13)-(41,40)) (Var (Just (41,14)-(41,19)) "build") [Tuple (Just (41,20)-(41,39)) [Var (Just (41,21)-(41,25)) "rand",Bop (Just (41,27)-(41,38)) Minus (Var (Just (41,28)-(41,33)) "depth") (Lit (Just (41,36)-(41,37)) (LI 1))]],App (Just (41,42)-(41,69)) (Var (Just (41,43)-(41,48)) "build") [Tuple (Just (41,49)-(41,68)) [Var (Just (41,50)-(41,54)) "rand",Bop (Just (41,56)-(41,67)) Minus (Var (Just (41,57)-(41,62)) "depth") (Lit (Just (41,65)-(41,66)) (LI 1))]]]
*)

(* typed spans
(40,11)-(41,70)
*)

(* correct types
(expr * expr * expr * expr)
*)

(* bad types
(expr * expr * expr)
*)
