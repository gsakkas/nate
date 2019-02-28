
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareCosine e' -> sqrt (abs_float cos (pi *. (eval (e', x, y))))
  | SquareSinCos (e1,e2,e3) ->
      sqrt
        (abs_float sin
           (((cos (pi *. (eval (e1, x, y)))) *.
               (cos (pi *. (eval (e2, x, y)))))
              *. (cos (pi *. (eval (e3, x, y))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareCosine e' -> sqrt (abs_float (cos (pi *. (eval (e', x, y)))))
  | SquareSinCos (e1,e2,e3) ->
      sqrt
        (abs_float
           (sin
              (((cos (pi *. (eval (e1, x, y)))) *.
                  (cos (pi *. (eval (e2, x, y)))))
                 *. (cos (pi *. (eval (e3, x, y)))))));;

*)

(* changed spans
(27,28)-(27,69)
abs_float (cos (pi *. eval (e' , x , y)))
AppG (fromList [AppG (fromList [EmptyG])])

(30,8)-(33,50)
abs_float (sin ((cos (pi *. eval (e1 , x , y)) *. cos (pi *. eval (e2 , x , y))) *. cos (pi *. eval (e3 , x , y))))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (27,28)-(27,71)) (Var (Just (27,29)-(27,38)) "abs_float") [App (Just (27,39)-(27,70)) (Var (Just (27,40)-(27,43)) "cos") [Bop (Just (27,44)-(27,69)) FTimes (Var (Just (27,45)-(27,47)) "pi") (App (Just (27,51)-(27,68)) (Var (Just (27,52)-(27,56)) "eval") [Tuple (Just (27,57)-(27,67)) [Var (Just (27,58)-(27,60)) "e'",Var (Just (27,62)-(27,63)) "x",Var (Just (27,65)-(27,66)) "y"]])]]
App (Just (30,8)-(34,54)) (Var (Just (30,9)-(30,18)) "abs_float") [App (Just (31,11)-(34,53)) (Var (Just (31,12)-(31,15)) "sin") [Bop (Just (32,14)-(34,52)) FTimes (Bop (Just (32,15)-(33,50)) FTimes (App (Just (32,16)-(32,47)) (Var (Just (32,17)-(32,20)) "cos") [Bop (Just (32,21)-(32,46)) FTimes (Var (Just (32,22)-(32,24)) "pi") (App (Just (32,28)-(32,45)) (Var (Just (32,29)-(32,33)) "eval") [Tuple (Just (32,34)-(32,44)) [Var (Just (32,35)-(32,37)) "e1",Var (Just (32,39)-(32,40)) "x",Var (Just (32,42)-(32,43)) "y"]])]) (App (Just (33,18)-(33,49)) (Var (Just (33,19)-(33,22)) "cos") [Bop (Just (33,23)-(33,48)) FTimes (Var (Just (33,24)-(33,26)) "pi") (App (Just (33,30)-(33,47)) (Var (Just (33,31)-(33,35)) "eval") [Tuple (Just (33,36)-(33,46)) [Var (Just (33,37)-(33,39)) "e2",Var (Just (33,41)-(33,42)) "x",Var (Just (33,44)-(33,45)) "y"]])])) (App (Just (34,20)-(34,51)) (Var (Just (34,21)-(34,24)) "cos") [Bop (Just (34,25)-(34,50)) FTimes (Var (Just (34,26)-(34,28)) "pi") (App (Just (34,32)-(34,49)) (Var (Just (34,33)-(34,37)) "eval") [Tuple (Just (34,38)-(34,48)) [Var (Just (34,39)-(34,41)) "e3",Var (Just (34,43)-(34,44)) "x",Var (Just (34,46)-(34,47)) "y"]])])]]
*)

(* typed spans
(27,28)-(27,71)
(30,8)-(34,54)
*)

(* correct types
float
float
*)

(* bad types
float
float
*)
