
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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand, (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX;;


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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(32,52)-(32,58)
buildY ()
AppG (fromList [ConAppG Nothing])

(33,54)-(33,60)
buildY ()
AppG (fromList [ConAppG Nothing])

(35,8)-(37,40)
()
ConAppG Nothing

(36,11)-(36,17)
buildX ()
AppG (fromList [ConAppG Nothing])

(36,19)-(36,25)
()
ConAppG Nothing

(36,19)-(36,25)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,27)-(36,54)
()
ConAppG Nothing

(38,7)-(38,13)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
App (Just (32,52)-(32,63)) (Var (Just (32,53)-(32,59)) "buildY") [ConApp (Just (32,60)-(32,62)) "()" Nothing (Just (TApp "unit" []))]
App (Just (33,54)-(33,65)) (Var (Just (33,55)-(33,61)) "buildY") [ConApp (Just (33,62)-(33,64)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (33,62)-(33,64)) "()" Nothing (Just (TApp "unit" []))
App (Just (36,11)-(36,22)) (Var (Just (36,12)-(36,18)) "buildX") [ConApp (Just (36,19)-(36,21)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (36,19)-(36,21)) "()" Nothing (Just (TApp "unit" []))
App (Just (36,24)-(36,35)) (Var (Just (36,25)-(36,31)) "buildY") [ConApp (Just (36,32)-(36,34)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (36,32)-(36,34)) "()" Nothing (Just (TApp "unit" []))
App (Just (38,7)-(38,16)) (Var (Just (38,7)-(38,13)) "buildX") [ConApp (Just (38,14)-(38,16)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(32,52)-(32,63)
(33,54)-(33,65)
(33,62)-(33,64)
(36,11)-(36,22)
(36,19)-(36,21)
(36,24)-(36,35)
(36,32)-(36,34)
(38,7)-(38,16)
*)

(* correct types
expr
expr
unit
expr
unit
expr
unit
expr
*)

(* bad types
unit -> expr
unit -> expr
expr
unit -> expr
unit -> expr
unit -> expr
expr
unit -> expr
*)
