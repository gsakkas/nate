
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

let rec eval (e,x,y) =
  match e with | VarX  -> buildX | VarY  -> buildY | Sine  -> buildSine e;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x;;

*)

(* changed spans
(18,2)-(18,73)
match e with
| VarX -> x
CaseG VarG (fromList [(Nothing,VarG)])

*)

(* changed exprs
Case (Just (11,23)-(11,48)) (Var (Just (11,29)-(11,30)) "e") [(ConPat (Just (11,38)-(11,42)) "VarX" Nothing,Nothing,Var (Just (11,47)-(11,48)) "x")]
*)

(* typed spans
(11,23)-(11,48)
*)

(* correct types
'a
*)

(* bad types
unit -> expr
*)
