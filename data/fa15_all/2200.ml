
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) mod (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      let comb = (eval (e1, x, y)) +. (eval (e2, x, y)) in
      mod_float comb (eval (e3, x, y));;

*)

(* changed spans
(29,6)-(29,67)
let comb =
  eval (e1 , x , y) +. eval (e2 , x , y) in
mod_float comb
          (eval (e3 , x , y))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (29,6)-(30,38)) NonRec [(VarPat (Just (29,10)-(29,14)) "comb",Bop (Just (29,17)-(29,55)) FPlus (App (Just (29,17)-(29,34)) (Var (Just (29,18)-(29,22)) "eval") [Tuple (Just (29,23)-(29,33)) [Var (Just (29,24)-(29,26)) "e1",Var (Just (29,28)-(29,29)) "x",Var (Just (29,31)-(29,32)) "y"]]) (App (Just (29,38)-(29,55)) (Var (Just (29,39)-(29,43)) "eval") [Tuple (Just (29,44)-(29,54)) [Var (Just (29,45)-(29,47)) "e2",Var (Just (29,49)-(29,50)) "x",Var (Just (29,52)-(29,53)) "y"]]))] (App (Just (30,6)-(30,38)) (Var (Just (30,6)-(30,15)) "mod_float") [Var (Just (30,16)-(30,20)) "comb",App (Just (30,21)-(30,38)) (Var (Just (30,22)-(30,26)) "eval") [Tuple (Just (30,27)-(30,37)) [Var (Just (30,28)-(30,30)) "e3",Var (Just (30,32)-(30,33)) "x",Var (Just (30,35)-(30,36)) "y"]]])
*)

(* typed spans
(29,6)-(30,38)
*)

(* correct types
float
*)

(* bad types
int
*)
