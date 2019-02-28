
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(11,57)-(11,69)
(x +. y) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (11,57)-(11,72)) FDiv (Bop (Just (11,57)-(11,65)) FPlus (Var (Just (11,58)-(11,59)) "x") (Var (Just (11,63)-(11,64)) "y")) (Lit (Just (11,69)-(11,72)) (LD 2.0))
*)

(* typed spans
(11,57)-(11,72)
*)

(* correct types
float
*)

(* bad types
int
*)
