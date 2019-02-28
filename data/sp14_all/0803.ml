
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
  | Sine e' -> sin (eval (e', x, y))
  | Cosine e' -> cos (eval (e', x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | _ -> failwith "we are seriously writing a lisp compiler god save us all";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

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
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Gauss (e1,e2,e3) ->
      2.0 *.
        (exp
           (-.
              ((((eval (e1, x, y)) -. (eval (e2, x, y))) ** 2.0) /.
                 (eval (e3, x, y)))));;

*)

(* changed spans
(11,14)-(23,76)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(12,2)-(23,76)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Cosine e' -> cos (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
| Sqrt e -> sqrt (abs_float (eval (e , x , y)))
| Gauss (e1 , e2 , e3) -> 2.0 *. exp (-. (((eval (e1 , x , y) -. eval (e2 , x , y)) ** 2.0) /. eval (e3 , x , y)))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Bop (Just (14,9)-(14,26)) FTimes (Lit (Just (14,9)-(14,12)) (LD 4.0)) (App (Just (14,16)-(14,26)) (Var (Just (14,17)-(14,21)) "atan") [Lit (Just (14,22)-(14,25)) (LD 1.0)])
Case (Just (17,2)-(34,37)) (Var (Just (17,8)-(17,9)) "e") [(ConPat (Just (18,4)-(18,8)) "VarX" Nothing,Nothing,Var (Just (18,13)-(18,14)) "x"),(ConPat (Just (19,4)-(19,8)) "VarY" Nothing,Nothing,Var (Just (19,13)-(19,14)) "y"),(ConPat (Just (20,4)-(20,11)) "Sine" (Just (VarPat (Just (20,9)-(20,11)) "e'")),Nothing,App (Just (20,15)-(20,44)) (Var (Just (20,15)-(20,18)) "sin") [Bop (Just (20,19)-(20,44)) FTimes (Var (Just (20,20)-(20,22)) "pi") (App (Just (20,26)-(20,43)) (Var (Just (20,27)-(20,31)) "eval") [Tuple (Just (20,32)-(20,42)) [Var (Just (20,33)-(20,35)) "e'",Var (Just (20,37)-(20,38)) "x",Var (Just (20,40)-(20,41)) "y"]])]),(ConPat (Just (21,4)-(21,13)) "Cosine" (Just (VarPat (Just (21,11)-(21,13)) "e'")),Nothing,App (Just (21,17)-(21,46)) (Var (Just (21,17)-(21,20)) "cos") [Bop (Just (21,21)-(21,46)) FTimes (Var (Just (21,22)-(21,24)) "pi") (App (Just (21,28)-(21,45)) (Var (Just (21,29)-(21,33)) "eval") [Tuple (Just (21,34)-(21,44)) [Var (Just (21,35)-(21,37)) "e'",Var (Just (21,39)-(21,40)) "x",Var (Just (21,42)-(21,43)) "y"]])]),(ConPat (Just (22,4)-(22,18)) "Average" (Just (TuplePat (Just (22,13)-(22,18)) [VarPat (Just (22,13)-(22,15)) "e1",VarPat (Just (22,16)-(22,18)) "e2"])),Nothing,Bop (Just (22,23)-(22,70)) FDiv (Bop (Just (22,23)-(22,63)) FPlus (App (Just (22,24)-(22,41)) (Var (Just (22,25)-(22,29)) "eval") [Tuple (Just (22,30)-(22,40)) [Var (Just (22,31)-(22,33)) "e1",Var (Just (22,35)-(22,36)) "x",Var (Just (22,38)-(22,39)) "y"]]) (App (Just (22,45)-(22,62)) (Var (Just (22,46)-(22,50)) "eval") [Tuple (Just (22,51)-(22,61)) [Var (Just (22,52)-(22,54)) "e2",Var (Just (22,56)-(22,57)) "x",Var (Just (22,59)-(22,60)) "y"]])) (Lit (Just (22,67)-(22,70)) (LD 2.0))),(ConPat (Just (23,4)-(23,16)) "Times" (Just (TuplePat (Just (23,11)-(23,16)) [VarPat (Just (23,11)-(23,13)) "e1",VarPat (Just (23,14)-(23,16)) "e2"])),Nothing,Bop (Just (23,21)-(23,59)) FTimes (App (Just (23,21)-(23,38)) (Var (Just (23,22)-(23,26)) "eval") [Tuple (Just (23,27)-(23,37)) [Var (Just (23,28)-(23,30)) "e1",Var (Just (23,32)-(23,33)) "x",Var (Just (23,35)-(23,36)) "y"]]) (App (Just (23,42)-(23,59)) (Var (Just (23,43)-(23,47)) "eval") [Tuple (Just (23,48)-(23,58)) [Var (Just (23,49)-(23,51)) "e2",Var (Just (23,53)-(23,54)) "x",Var (Just (23,56)-(23,57)) "y"]])),(ConPat (Just (24,4)-(24,23)) "Thresh" (Just (TuplePat (Just (24,12)-(24,23)) [VarPat (Just (24,12)-(24,14)) "e1",VarPat (Just (24,15)-(24,17)) "e2",VarPat (Just (24,18)-(24,20)) "e3",VarPat (Just (24,21)-(24,23)) "e4"])),Nothing,Ite (Just (25,6)-(27,26)) (Bop (Just (25,9)-(25,46)) Lt (App (Just (25,9)-(25,26)) (Var (Just (25,10)-(25,14)) "eval") [Tuple (Just (25,15)-(25,25)) [Var (Just (25,16)-(25,18)) "e1",Var (Just (25,20)-(25,21)) "x",Var (Just (25,23)-(25,24)) "y"]]) (App (Just (25,29)-(25,46)) (Var (Just (25,30)-(25,34)) "eval") [Tuple (Just (25,35)-(25,45)) [Var (Just (25,36)-(25,38)) "e2",Var (Just (25,40)-(25,41)) "x",Var (Just (25,43)-(25,44)) "y"]])) (App (Just (26,11)-(26,26)) (Var (Just (26,11)-(26,15)) "eval") [Tuple (Just (26,16)-(26,26)) [Var (Just (26,17)-(26,19)) "e3",Var (Just (26,21)-(26,22)) "x",Var (Just (26,24)-(26,25)) "y"]]) (App (Just (27,11)-(27,26)) (Var (Just (27,11)-(27,15)) "eval") [Tuple (Just (27,16)-(27,26)) [Var (Just (27,17)-(27,19)) "e4",Var (Just (27,21)-(27,22)) "x",Var (Just (27,24)-(27,25)) "y"]])),(ConPat (Just (28,4)-(28,10)) "Sqrt" (Just (VarPat (Just (28,9)-(28,10)) "e")),Nothing,App (Just (28,14)-(28,47)) (Var (Just (28,14)-(28,18)) "sqrt") [App (Just (28,19)-(28,47)) (Var (Just (28,20)-(28,29)) "abs_float") [App (Just (28,30)-(28,46)) (Var (Just (28,31)-(28,35)) "eval") [Tuple (Just (28,36)-(28,45)) [Var (Just (28,37)-(28,38)) "e",Var (Just (28,40)-(28,41)) "x",Var (Just (28,43)-(28,44)) "y"]]]]),(ConPat (Just (29,4)-(29,19)) "Gauss" (Just (TuplePat (Just (29,11)-(29,19)) [VarPat (Just (29,11)-(29,13)) "e1",VarPat (Just (29,14)-(29,16)) "e2",VarPat (Just (29,17)-(29,19)) "e3"])),Nothing,Bop (Just (30,6)-(34,37)) FTimes (Lit (Just (30,6)-(30,9)) (LD 2.0)) (App (Just (31,8)-(34,37)) (Var (Just (31,9)-(31,12)) "exp") [Uop (Just (32,11)-(34,36)) FNeg (Bop (Just (33,14)-(34,35)) FDiv (App (Just (33,15)-(33,64)) (Var (Just (33,57)-(33,59)) "**") [Bop (Just (33,16)-(33,56)) FMinus (App (Just (33,17)-(33,34)) (Var (Just (33,18)-(33,22)) "eval") [Tuple (Just (33,23)-(33,33)) [Var (Just (33,24)-(33,26)) "e1",Var (Just (33,28)-(33,29)) "x",Var (Just (33,31)-(33,32)) "y"]]) (App (Just (33,38)-(33,55)) (Var (Just (33,39)-(33,43)) "eval") [Tuple (Just (33,44)-(33,54)) [Var (Just (33,45)-(33,47)) "e2",Var (Just (33,49)-(33,50)) "x",Var (Just (33,52)-(33,53)) "y"]]),Lit (Just (33,60)-(33,63)) (LD 2.0)]) (App (Just (34,17)-(34,34)) (Var (Just (34,18)-(34,22)) "eval") [Tuple (Just (34,23)-(34,33)) [Var (Just (34,24)-(34,26)) "e3",Var (Just (34,28)-(34,29)) "x",Var (Just (34,31)-(34,32)) "y"]]))]))]
*)

(* typed spans
(14,9)-(14,26)
(17,2)-(34,37)
*)

(* correct types
float
float
*)

(* bad types
(expr * float * float) -> float
float
*)
