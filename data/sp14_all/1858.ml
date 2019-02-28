
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
         buildAverage
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
(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(38,11)-(39,41)
buildThresh
VarG

(38,12)-(38,24)
(first_forced , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Var (Just (39,9)-(39,20)) "buildThresh"
Tuple (Just (40,11)-(41,70)) [Var (Just (40,12)-(40,24)) "first_forced",App (Just (40,26)-(40,53)) (Var (Just (40,27)-(40,32)) "build") [Tuple (Just (40,33)-(40,52)) [Var (Just (40,34)-(40,38)) "rand",Bop (Just (40,40)-(40,51)) Minus (Var (Just (40,41)-(40,46)) "depth") (Lit (Just (40,49)-(40,50)) (LI 1))]],App (Just (41,13)-(41,40)) (Var (Just (41,14)-(41,19)) "build") [Tuple (Just (41,20)-(41,39)) [Var (Just (41,21)-(41,25)) "rand",Bop (Just (41,27)-(41,38)) Minus (Var (Just (41,28)-(41,33)) "depth") (Lit (Just (41,36)-(41,37)) (LI 1))]],App (Just (41,42)-(41,69)) (Var (Just (41,43)-(41,48)) "build") [Tuple (Just (41,49)-(41,68)) [Var (Just (41,50)-(41,54)) "rand",Bop (Just (41,56)-(41,67)) Minus (Var (Just (41,57)-(41,62)) "depth") (Lit (Just (41,65)-(41,66)) (LI 1))]]]
*)

(* typed spans
(17,17)-(17,67)
(39,9)-(39,20)
(40,11)-(41,70)
*)

(* correct types
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr)
*)

(* bad types
(expr * expr) -> expr
(expr * expr * expr)
expr
*)
