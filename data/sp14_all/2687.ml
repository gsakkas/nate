
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Cube a ->
      "(" ^
        ((exprToString a) ^
           ("*" ^ ((exprToString a) ^ ("*" ^ ((exprToString a) ^ ")")))))
  | Addition (a,b) ->
      "(" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")")));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((exprToString a) * (exprToString a)) * (exprToString a);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval (a, x, y)) *. (eval (a, x, y))) *. (eval (a, x, y));;

*)

(* changed spans
(50,14)-(50,70)
(eval (a , x , y) *. eval (a , x , y)) *. eval (a , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (27,14)-(27,72)) FTimes (Bop (Just (27,14)-(27,52)) FTimes (App (Just (27,15)-(27,31)) (Var (Just (27,16)-(27,20)) "eval") [Tuple (Just (27,21)-(27,30)) [Var (Just (27,22)-(27,23)) "a",Var (Just (27,25)-(27,26)) "x",Var (Just (27,28)-(27,29)) "y"]]) (App (Just (27,35)-(27,51)) (Var (Just (27,36)-(27,40)) "eval") [Tuple (Just (27,41)-(27,50)) [Var (Just (27,42)-(27,43)) "a",Var (Just (27,45)-(27,46)) "x",Var (Just (27,48)-(27,49)) "y"]])) (App (Just (27,56)-(27,72)) (Var (Just (27,57)-(27,61)) "eval") [Tuple (Just (27,62)-(27,71)) [Var (Just (27,63)-(27,64)) "a",Var (Just (27,66)-(27,67)) "x",Var (Just (27,69)-(27,70)) "y"]])
*)

(* typed spans
(27,14)-(27,72)
*)

(* correct types
float
*)

(* bad types
int
*)
