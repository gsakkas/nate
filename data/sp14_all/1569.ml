
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) = failwith "to be implemented";;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> buildX | VarY  -> buildY | Sine e -> build (pi * e);;


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
(20,2)-(20,77)
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
