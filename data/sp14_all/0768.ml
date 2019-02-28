
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildY ()) else buildCosine buildY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildX ()) else buildCosine (buildY ());;

*)

(* changed spans
(15,16)-(15,20)
VarX
ConAppG Nothing

(15,16)-(15,20)
fun () -> VarY
LamG (ConAppG Nothing)

(19,33)-(19,39)
buildX
VarG

(19,61)-(19,67)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
ConApp (Just (15,16)-(15,20)) "VarX" Nothing Nothing
Lam (Just (17,11)-(17,20)) (ConPat (Just (17,11)-(17,13)) "()" Nothing) (ConApp (Just (17,16)-(17,20)) "VarY" Nothing Nothing) Nothing
Var (Just (21,33)-(21,39)) "buildX"
App (Just (21,61)-(21,72)) (Var (Just (21,62)-(21,68)) "buildY") [ConApp (Just (21,69)-(21,71)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(15,16)-(15,20)
(17,11)-(17,20)
(21,33)-(21,39)
(21,61)-(21,72)
*)

(* correct types
expr
unit -> expr
unit -> expr
expr
*)

(* bad types
expr
expr
unit -> expr
unit -> expr
*)
