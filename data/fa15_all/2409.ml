
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
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e,f) -> ((eval (e, x, y)) +. (eval (f, x, y))) / 2.0
  | Times (e,f) -> (eval (e, x, y)) * (eval (f, x, y))
  | Thresh (e,f,g,h) ->
      (match (eval (e, x, y)) < (eval (f, x, y)) with
       | true  -> eval (g, x, y)
       | false  -> eval (h, x, y));;


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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e,f) -> ((eval (e, x, y)) +. (eval (f, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (e,f,g,h) ->
      (match (eval (e, x, y)) < (eval (f, x, y)) with
       | true  -> eval (g, x, y)
       | false  -> eval (h, x, y));;

*)

(* changed spans
(17,21)-(17,65)
(eval (e , x , y) +. eval (f , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,19)-(18,54)
eval (e , x , y) *. eval (f , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,21)-(17,66)) FDiv (Bop (Just (17,21)-(17,59)) FPlus (App (Just (17,22)-(17,38)) (Var (Just (17,23)-(17,27)) "eval") [Tuple (Just (17,28)-(17,37)) [Var (Just (17,29)-(17,30)) "e",Var (Just (17,32)-(17,33)) "x",Var (Just (17,35)-(17,36)) "y"]]) (App (Just (17,42)-(17,58)) (Var (Just (17,43)-(17,47)) "eval") [Tuple (Just (17,48)-(17,57)) [Var (Just (17,49)-(17,50)) "f",Var (Just (17,52)-(17,53)) "x",Var (Just (17,55)-(17,56)) "y"]])) (Lit (Just (17,63)-(17,66)) (LD 2.0))
Bop (Just (18,19)-(18,55)) FTimes (App (Just (18,19)-(18,35)) (Var (Just (18,20)-(18,24)) "eval") [Tuple (Just (18,25)-(18,34)) [Var (Just (18,26)-(18,27)) "e",Var (Just (18,29)-(18,30)) "x",Var (Just (18,32)-(18,33)) "y"]]) (App (Just (18,39)-(18,55)) (Var (Just (18,40)-(18,44)) "eval") [Tuple (Just (18,45)-(18,54)) [Var (Just (18,46)-(18,47)) "f",Var (Just (18,49)-(18,50)) "x",Var (Just (18,52)-(18,53)) "y"]])
*)

(* typed spans
(17,21)-(17,66)
(18,19)-(18,55)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
