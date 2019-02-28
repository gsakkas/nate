
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | TimesMod (w,t,u) ->
      ((eval (w, x, y)) *. (eval (t, x, y))) /.
        (mod_float ((eval (w, x, y)) *. (eval (t, x, y))) eval (u, x, y))
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) +. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | TimesMod (w,t,u) ->
      ((eval (w, x, y)) *. (eval (t, x, y))) /.
        (mod_float ((eval (w, x, y)) *. (eval (t, x, y))) (eval (u, x, y)))
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) +. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(23,8)-(23,73)
mod_float (eval (w , x , y) *. eval (t , x , y))
          (eval (u , x , y))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (23,8)-(23,75)) (Var (Just (23,9)-(23,18)) "mod_float") [Bop (Just (23,19)-(23,57)) FTimes (App (Just (23,20)-(23,36)) (Var (Just (23,21)-(23,25)) "eval") [Tuple (Just (23,26)-(23,35)) [Var (Just (23,27)-(23,28)) "w",Var (Just (23,30)-(23,31)) "x",Var (Just (23,33)-(23,34)) "y"]]) (App (Just (23,40)-(23,56)) (Var (Just (23,41)-(23,45)) "eval") [Tuple (Just (23,46)-(23,55)) [Var (Just (23,47)-(23,48)) "t",Var (Just (23,50)-(23,51)) "x",Var (Just (23,53)-(23,54)) "y"]]),App (Just (23,58)-(23,74)) (Var (Just (23,59)-(23,63)) "eval") [Tuple (Just (23,64)-(23,73)) [Var (Just (23,65)-(23,66)) "u",Var (Just (23,68)-(23,69)) "x",Var (Just (23,71)-(23,72)) "y"]]]
*)

(* typed spans
(23,8)-(23,75)
*)

(* correct types
float
*)

(* bad types
float
*)
