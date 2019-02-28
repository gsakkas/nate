
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3,e4) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 8) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 10) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(25,16)-(25,49)
fun (e1 , e2 , e3) ->
  Weird (e1 , e2 , e3)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(35,20)-(35,21)
10
LitG

*)

(* changed exprs
Lam (Just (25,16)-(25,46)) (TuplePat (Just (25,16)-(25,24)) [VarPat (Just (25,16)-(25,18)) "e1",VarPat (Just (25,19)-(25,21)) "e2",VarPat (Just (25,22)-(25,24)) "e3"]) (ConApp (Just (25,28)-(25,46)) "Weird" (Just (Tuple (Just (25,34)-(25,46)) [Var (Just (25,35)-(25,37)) "e1",Var (Just (25,39)-(25,41)) "e2",Var (Just (25,43)-(25,45)) "e3"])) Nothing) Nothing
Lit (Just (35,20)-(35,22)) (LI 10)
*)

(* typed spans
(25,16)-(25,46)
(35,20)-(35,22)
*)

(* correct types
(expr * expr * expr) -> expr
int
*)

(* bad types
(expr * expr * expr * 'a) -> expr
int
*)
