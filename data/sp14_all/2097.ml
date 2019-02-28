
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> VarX
  | 2 -> 22
  | 3 -> 33
  | 4 -> 44
  | 5 -> 55
  | 6 -> 66
  | 7 -> 77;;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;

*)

(* changed spans
(11,15)-(19,11)
fun () -> VarX
LamG (ConAppG Nothing)

(11,15)-(19,11)
fun () -> VarY
LamG (ConAppG Nothing)

(19,9)-(19,11)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Lam (Just (11,11)-(11,20)) (ConPat (Just (11,11)-(11,13)) "()" Nothing) (ConApp (Just (11,16)-(11,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (13,11)-(13,20)) (ConPat (Just (13,11)-(13,13)) "()" Nothing) (ConApp (Just (13,16)-(13,20)) "VarY" Nothing Nothing) Nothing
App (Just (17,9)-(17,18)) (Var (Just (17,9)-(17,15)) "buildX") [ConApp (Just (17,16)-(17,18)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(11,11)-(11,20)
(13,11)-(13,20)
(17,9)-(17,18)
*)

(* correct types
unit -> expr
unit -> expr
expr
*)

(* bad types
((int * int) -> int * 'a) -> expr
((int * int) -> int * 'a) -> expr
int
*)
