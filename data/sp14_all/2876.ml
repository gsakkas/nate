
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e -> sin (pi * (eval e));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, 0.0, 0.0)));;

*)

(* changed spans
(14,57)-(14,72)
pi *. eval (e , 0.0 , 0.0)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,18)-(17,46)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,45)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,44)) [Var (Just (17,32)-(17,33)) "e",Lit (Just (17,35)-(17,38)) (LD 0.0),Lit (Just (17,40)-(17,43)) (LD 0.0)]])
*)

(* typed spans
(17,18)-(17,46)
*)

(* correct types
float
*)

(* bad types
int
*)
