
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Average (x',y') -> ((eval x' y) + (eval x y')) / 2;;


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
(12,2)-(15,54)
match e with
| Average (x' , y') -> (x +. y) /. 2.0
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (11,23)-(11,72)) (Var (Just (11,29)-(11,30)) "e") [(ConPat (Just (11,38)-(11,52)) "Average" (Just (TuplePat (Just (11,47)-(11,52)) [VarPat (Just (11,47)-(11,49)) "x'",VarPat (Just (11,50)-(11,52)) "y'"])),Nothing,Bop (Just (11,57)-(11,72)) FDiv (Bop (Just (11,57)-(11,65)) FPlus (Var (Just (11,58)-(11,59)) "x") (Var (Just (11,63)-(11,64)) "y")) (Lit (Just (11,69)-(11,72)) (LD 2.0)))]
*)

(* typed spans
(11,23)-(11,72)
*)

(* correct types
float
*)

(* bad types
expr
*)
