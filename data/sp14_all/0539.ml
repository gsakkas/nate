
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      let max' a b = if a < b then b else a in
      max' -
        (1.0
           (min 1.0
              ((2.71 **
                  (((sin (pi *. (eval (a, x, y)))) +.
                      (cos (pi *. (eval (b, x, y)))))
                     -. 1.0))
                 -. 1.0)))
  | SinLog (a',b',c) -> 1.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      let max' a b = if a < b then b else a in
      max' (0.0 -. 1.0)
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) -> 1.0;;

*)

(* changed spans
(29,6)-(36,26)
max' (0.0 -. 1.0) (min 1.0
                       ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (29,6)-(35,22)) (Var (Just (29,6)-(29,10)) "max'") [Bop (Just (29,11)-(29,23)) FMinus (Lit (Just (29,12)-(29,15)) (LD 0.0)) (Lit (Just (29,19)-(29,22)) (LD 1.0)),App (Just (30,8)-(35,22)) (Var (Just (30,9)-(30,12)) "min") [Lit (Just (30,13)-(30,16)) (LD 1.0),Bop (Just (31,11)-(35,21)) FMinus (App (Just (31,12)-(34,26)) (Var (Just (31,18)-(31,20)) "**") [Lit (Just (31,13)-(31,17)) (LD 2.71),Bop (Just (32,15)-(34,25)) FMinus (Bop (Just (32,16)-(33,50)) FPlus (App (Just (32,17)-(32,47)) (Var (Just (32,18)-(32,21)) "sin") [Bop (Just (32,22)-(32,46)) FTimes (Var (Just (32,23)-(32,25)) "pi") (App (Just (32,29)-(32,45)) (Var (Just (32,30)-(32,34)) "eval") [Tuple (Just (32,35)-(32,44)) [Var (Just (32,36)-(32,37)) "a",Var (Just (32,39)-(32,40)) "x",Var (Just (32,42)-(32,43)) "y"]])]) (App (Just (33,19)-(33,49)) (Var (Just (33,20)-(33,23)) "cos") [Bop (Just (33,24)-(33,48)) FTimes (Var (Just (33,25)-(33,27)) "pi") (App (Just (33,31)-(33,47)) (Var (Just (33,32)-(33,36)) "eval") [Tuple (Just (33,37)-(33,46)) [Var (Just (33,38)-(33,39)) "b",Var (Just (33,41)-(33,42)) "x",Var (Just (33,44)-(33,45)) "y"]])])) (Lit (Just (34,21)-(34,24)) (LD 1.0))]) (Lit (Just (35,17)-(35,20)) (LD 1.0))]]
*)

(* typed spans
(29,6)-(35,22)
*)

(* correct types
float
*)

(* bad types
int
*)
