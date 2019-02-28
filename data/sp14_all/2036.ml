
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
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval m));;


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
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval (m, x, y))) | _ -> x;;

*)

(* changed spans
(14,2)-(14,60)
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (14,2)-(14,77)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (14,17)-(14,21)) "VarX" Nothing,Nothing,Var (Just (14,26)-(14,27)) "x"),(ConPat (Just (14,30)-(14,36)) "Sine" (Just (VarPat (Just (14,35)-(14,36)) "m")),Nothing,App (Just (14,40)-(14,68)) (Var (Just (14,40)-(14,43)) "sin") [Bop (Just (14,44)-(14,68)) FTimes (Var (Just (14,45)-(14,47)) "pi") (App (Just (14,51)-(14,67)) (Var (Just (14,52)-(14,56)) "eval") [Tuple (Just (14,57)-(14,66)) [Var (Just (14,58)-(14,59)) "m",Var (Just (14,61)-(14,62)) "x",Var (Just (14,64)-(14,65)) "y"]])]),(WildPat (Just (14,71)-(14,72)),Nothing,Var (Just (14,76)-(14,77)) "x")]
*)

(* typed spans
(14,2)-(14,77)
*)

(* correct types
float
*)

(* bad types
float
*)
