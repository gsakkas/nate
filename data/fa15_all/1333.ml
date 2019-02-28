
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
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY
  else
    (match rand (0, 7) with
     | 0 -> buildX
     | 1 -> buildY
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
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
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ()
  else
    (match rand (0, 7) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,54)-(27,60)
buildY ()
AppG (fromList [ConAppG Nothing])

(30,12)-(30,18)
buildX ()
AppG (fromList [ConAppG Nothing])

(31,12)-(31,18)
()
ConAppG Nothing

(31,12)-(31,18)
buildY ()
AppG (fromList [ConAppG Nothing])

(32,12)-(32,49)
()
ConAppG Nothing

*)

(* changed exprs
App (Just (27,54)-(27,63)) (Var (Just (27,54)-(27,60)) "buildY") [ConApp (Just (27,61)-(27,63)) "()" Nothing (Just (TApp "unit" []))]
App (Just (30,12)-(30,21)) (Var (Just (30,12)-(30,18)) "buildX") [ConApp (Just (30,19)-(30,21)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (30,19)-(30,21)) "()" Nothing (Just (TApp "unit" []))
App (Just (31,12)-(31,21)) (Var (Just (31,12)-(31,18)) "buildY") [ConApp (Just (31,19)-(31,21)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (31,19)-(31,21)) "()" Nothing (Just (TApp "unit" []))
*)

(* typed spans
(27,54)-(27,63)
(30,12)-(30,21)
(30,19)-(30,21)
(31,12)-(31,21)
(31,19)-(31,21)
*)

(* correct types
expr
expr
unit
expr
unit
*)

(* bad types
unit -> expr
unit -> expr
unit -> expr
unit -> expr
expr
*)
