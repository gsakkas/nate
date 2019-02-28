
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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> eval (VarX, a1, a2);;


(* fix

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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,23)-(15,42)
eval (VarX , x , y) +. eval (VarY , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (15,23)-(15,65)) FPlus (App (Just (15,23)-(15,42)) (Var (Just (15,24)-(15,28)) "eval") [Tuple (Just (15,29)-(15,41)) [ConApp (Just (15,30)-(15,34)) "VarX" Nothing Nothing,Var (Just (15,36)-(15,37)) "x",Var (Just (15,39)-(15,40)) "y"]]) (App (Just (15,46)-(15,65)) (Var (Just (15,47)-(15,51)) "eval") [Tuple (Just (15,52)-(15,64)) [ConApp (Just (15,53)-(15,57)) "VarY" Nothing Nothing,Var (Just (15,59)-(15,60)) "x",Var (Just (15,62)-(15,63)) "y"]])
*)

(* typed spans
(15,23)-(15,65)
*)

(* correct types
float
*)

(* bad types
float
*)
