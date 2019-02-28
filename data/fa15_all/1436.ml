
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)));;


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
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(15,15)-(20,50)
fun () -> VarX
LamG (ConAppG Nothing)

(15,15)-(20,50)
fun () -> VarY
LamG (ConAppG Nothing)

(16,2)-(20,50)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (15,11)-(15,20)) (ConPat (Just (15,11)-(15,13)) "()" Nothing) (ConApp (Just (15,16)-(15,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (17,11)-(17,20)) (ConPat (Just (17,11)-(17,13)) "()" Nothing) (ConApp (Just (17,16)-(17,20)) "VarY" Nothing Nothing) Nothing
Case (Just (25,7)-(25,65)) (App (Just (25,14)-(25,25)) (Var (Just (25,14)-(25,18)) "rand") [Tuple (Just (25,19)-(25,25)) [Lit (Just (25,20)-(25,21)) (LI 0),Lit (Just (25,23)-(25,24)) (LI 1)]]) [(LitPat (Just (25,33)-(25,34)) (LI 0),Nothing,App (Just (25,38)-(25,47)) (Var (Just (25,38)-(25,44)) "buildX") [ConApp (Just (25,45)-(25,47)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (25,50)-(25,51)) (LI 1),Nothing,App (Just (25,55)-(25,64)) (Var (Just (25,55)-(25,61)) "buildY") [ConApp (Just (25,62)-(25,64)) "()" Nothing (Just (TApp "unit" []))])]
*)

(* typed spans
(15,11)-(15,20)
(17,11)-(17,20)
(25,7)-(25,65)
*)

(* correct types
unit -> expr
unit -> expr
expr
*)

(* bad types
((int * int) -> int * int) -> unit
((int * int) -> int * int) -> unit
unit
*)
