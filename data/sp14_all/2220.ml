
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x1,x2) ->
      "((" ^ ((exprToString x1) ^ ("+" ^ ((exprToString x2) ^ ")/2)")))
  | Times (x1,x2) -> (exprToString x1) ^ ("*" ^ (exprToString x2))
  | Thresh (x1,x2,x3,x4) ->
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))));;


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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y);;

*)

(* changed spans
(39,6)-(44,79)
if eval (x1 , x , y) < eval (x2 , x , y)
then eval (x3 , x , y)
else eval (x4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (22,6)-(24,26)) (Bop (Just (22,9)-(22,46)) Lt (App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "x1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]]) (App (Just (22,29)-(22,46)) (Var (Just (22,30)-(22,34)) "eval") [Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "x2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]])) (App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "x3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]) (App (Just (24,11)-(24,26)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "x4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]])
*)

(* typed spans
(22,6)-(24,26)
*)

(* correct types
float
*)

(* bad types
string
*)
