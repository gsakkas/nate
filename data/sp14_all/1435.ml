
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
  match depth with
  | 0 ->
      let r = rand (0, 1) in if r = 0 then buildX else if r = 1 then buildY;;


(* fix

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
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ();;

*)

(* changed spans
(18,23)-(18,24)
2
LitG

(18,43)-(18,49)
buildX ()
AppG (fromList [ConAppG Nothing])

(18,55)-(18,75)
()
ConAppG Nothing

(18,69)-(18,75)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Lit (Just (17,26)-(17,27)) (LI 2)
App (Just (17,46)-(17,55)) (Var (Just (17,46)-(17,52)) "buildX") [ConApp (Just (17,53)-(17,55)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (17,53)-(17,55)) "()" Nothing (Just (TApp "unit" []))
App (Just (17,61)-(17,70)) (Var (Just (17,61)-(17,67)) "buildY") [ConApp (Just (17,68)-(17,70)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(17,26)-(17,27)
(17,46)-(17,55)
(17,53)-(17,55)
(17,61)-(17,70)
*)

(* correct types
int
expr
unit
expr
*)

(* bad types
int
unit -> expr
unit
unit -> expr
*)
