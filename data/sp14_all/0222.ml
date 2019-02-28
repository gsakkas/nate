
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then VarX else VarY)
  else (let y = rand (2, 6) in if y = 2 then y);;


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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(11,15)-(14,47)
fun () -> VarX
LamG (ConAppG Nothing)

(11,15)-(14,47)
fun () -> VarY
LamG (ConAppG Nothing)

(13,44)-(13,48)
buildX ()
AppG (fromList [ConAppG Nothing])

(14,7)-(14,47)
buildY ()
AppG (fromList [ConAppG Nothing])

(14,31)-(14,46)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Lam (Just (11,11)-(11,20)) (ConPat (Just (11,11)-(11,13)) "()" Nothing) (ConApp (Just (11,16)-(11,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (13,11)-(13,20)) (ConPat (Just (13,11)-(13,13)) "()" Nothing) (ConApp (Just (13,16)-(13,20)) "VarY" Nothing Nothing) Nothing
App (Just (17,34)-(17,43)) (Var (Just (17,34)-(17,40)) "buildX") [ConApp (Just (17,41)-(17,43)) "()" Nothing (Just (TApp "unit" []))]
App (Just (17,49)-(17,58)) (Var (Just (17,49)-(17,55)) "buildY") [ConApp (Just (17,56)-(17,58)) "()" Nothing (Just (TApp "unit" []))]
App (Just (18,31)-(18,40)) (Var (Just (18,31)-(18,37)) "buildX") [ConApp (Just (18,38)-(18,40)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(11,11)-(11,20)
(13,11)-(13,20)
(17,34)-(17,43)
(17,49)-(17,58)
(18,31)-(18,40)
*)

(* correct types
unit -> expr
unit -> expr
expr
expr
expr
*)

(* bad types
((int * int) -> int * int) -> unit
((int * int) -> int * int) -> unit
expr
unit
unit
*)
