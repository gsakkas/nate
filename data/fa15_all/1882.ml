
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
  match depth with
  | 0 -> if (rand mod 2) == 0 then buildX else buildY
  | n -> buildSine (build (rand, (depth - 1)));;


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

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(19,9)-(19,53)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
App (Just (17,9)-(17,18)) (Var (Just (17,9)-(17,15)) "buildX") [ConApp (Just (17,16)-(17,18)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(17,9)-(17,18)
*)

(* correct types
expr
*)

(* bad types
unit -> expr
*)
