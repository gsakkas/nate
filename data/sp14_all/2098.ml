
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> buildX (buildY ())
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> buildSine (buildX ())
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;

*)

(* changed spans
(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(17,9)-(17,15)
buildSine
VarG

(17,17)-(17,23)
buildX
VarG

*)

(* changed exprs
Lam (Just (11,14)-(11,24)) (VarPat (Just (11,14)-(11,15)) "e") (ConApp (Just (11,18)-(11,24)) "Sine" (Just (Var (Just (11,23)-(11,24)) "e")) Nothing) Nothing
Var (Just (19,9)-(19,18)) "buildSine"
Var (Just (19,20)-(19,26)) "buildX"
*)

(* typed spans
(11,14)-(11,24)
(19,9)-(19,18)
(19,20)-(19,26)
*)

(* correct types
expr -> expr
expr -> expr
unit -> expr
*)

(* bad types
unit -> expr
unit -> expr
unit -> expr
*)
