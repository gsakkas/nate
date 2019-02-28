
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Logx of expr
  | TripMult of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Logx a -> log (eval a)
  | TripMult (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | _ -> 0.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TripMult of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | TripMult (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | _ -> 0.0;;

*)

(* changed spans
(16,2)-(30,12)
match e with
| VarX -> x
| VarY -> y
| Sine b -> sin (pi *. eval (b , x , y))
| Cosine b -> cos (pi *. eval (b , x , y))
| Average (a , b) -> (eval (a , x , y) +. eval (b , x , y)) /. 2.0
| Times (a , b) -> eval (a , x , y) *. eval (b , x , y)
| Thresh (a , b , c , d) -> if eval (a , x , y) < eval (b , x , y)
                            then eval (c , x , y)
                            else eval (d , x , y)
| TripMult (a , b , c) -> (eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)
| _ -> 0.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (15,2)-(28,12)) (Var (Just (15,8)-(15,9)) "e") [(ConPat (Just (16,4)-(16,8)) "VarX" Nothing,Nothing,Var (Just (16,13)-(16,14)) "x"),(ConPat (Just (17,4)-(17,8)) "VarY" Nothing,Nothing,Var (Just (17,13)-(17,14)) "y"),(ConPat (Just (18,4)-(18,10)) "Sine" (Just (VarPat (Just (18,9)-(18,10)) "b")),Nothing,App (Just (18,14)-(18,42)) (Var (Just (18,14)-(18,17)) "sin") [Bop (Just (18,18)-(18,42)) FTimes (Var (Just (18,19)-(18,21)) "pi") (App (Just (18,25)-(18,41)) (Var (Just (18,26)-(18,30)) "eval") [Tuple (Just (18,31)-(18,40)) [Var (Just (18,32)-(18,33)) "b",Var (Just (18,35)-(18,36)) "x",Var (Just (18,38)-(18,39)) "y"]])]),(ConPat (Just (19,4)-(19,12)) "Cosine" (Just (VarPat (Just (19,11)-(19,12)) "b")),Nothing,App (Just (19,16)-(19,44)) (Var (Just (19,16)-(19,19)) "cos") [Bop (Just (19,20)-(19,44)) FTimes (Var (Just (19,21)-(19,23)) "pi") (App (Just (19,27)-(19,43)) (Var (Just (19,28)-(19,32)) "eval") [Tuple (Just (19,33)-(19,42)) [Var (Just (19,34)-(19,35)) "b",Var (Just (19,37)-(19,38)) "x",Var (Just (19,40)-(19,41)) "y"]])]),(ConPat (Just (20,4)-(20,16)) "Average" (Just (TuplePat (Just (20,13)-(20,16)) [VarPat (Just (20,13)-(20,14)) "a",VarPat (Just (20,15)-(20,16)) "b"])),Nothing,Bop (Just (20,21)-(20,66)) FDiv (Bop (Just (20,21)-(20,59)) FPlus (App (Just (20,22)-(20,38)) (Var (Just (20,23)-(20,27)) "eval") [Tuple (Just (20,28)-(20,37)) [Var (Just (20,29)-(20,30)) "a",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,58)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,57)) [Var (Just (20,49)-(20,50)) "b",Var (Just (20,52)-(20,53)) "x",Var (Just (20,55)-(20,56)) "y"]])) (Lit (Just (20,63)-(20,66)) (LD 2.0))),(ConPat (Just (21,4)-(21,14)) "Times" (Just (TuplePat (Just (21,11)-(21,14)) [VarPat (Just (21,11)-(21,12)) "a",VarPat (Just (21,13)-(21,14)) "b"])),Nothing,Bop (Just (21,19)-(21,55)) FTimes (App (Just (21,19)-(21,35)) (Var (Just (21,20)-(21,24)) "eval") [Tuple (Just (21,25)-(21,34)) [Var (Just (21,26)-(21,27)) "a",Var (Just (21,29)-(21,30)) "x",Var (Just (21,32)-(21,33)) "y"]]) (App (Just (21,39)-(21,55)) (Var (Just (21,40)-(21,44)) "eval") [Tuple (Just (21,45)-(21,54)) [Var (Just (21,46)-(21,47)) "b",Var (Just (21,49)-(21,50)) "x",Var (Just (21,52)-(21,53)) "y"]])),(ConPat (Just (22,4)-(22,19)) "Thresh" (Just (TuplePat (Just (22,12)-(22,19)) [VarPat (Just (22,12)-(22,13)) "a",VarPat (Just (22,14)-(22,15)) "b",VarPat (Just (22,16)-(22,17)) "c",VarPat (Just (22,18)-(22,19)) "d"])),Nothing,Ite (Just (23,6)-(25,25)) (Bop (Just (23,9)-(23,44)) Lt (App (Just (23,9)-(23,25)) (Var (Just (23,10)-(23,14)) "eval") [Tuple (Just (23,15)-(23,24)) [Var (Just (23,16)-(23,17)) "a",Var (Just (23,19)-(23,20)) "x",Var (Just (23,22)-(23,23)) "y"]]) (App (Just (23,28)-(23,44)) (Var (Just (23,29)-(23,33)) "eval") [Tuple (Just (23,34)-(23,43)) [Var (Just (23,35)-(23,36)) "b",Var (Just (23,38)-(23,39)) "x",Var (Just (23,41)-(23,42)) "y"]])) (App (Just (24,11)-(24,25)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,25)) [Var (Just (24,17)-(24,18)) "c",Var (Just (24,20)-(24,21)) "x",Var (Just (24,23)-(24,24)) "y"]]) (App (Just (25,11)-(25,25)) (Var (Just (25,11)-(25,15)) "eval") [Tuple (Just (25,16)-(25,25)) [Var (Just (25,17)-(25,18)) "d",Var (Just (25,20)-(25,21)) "x",Var (Just (25,23)-(25,24)) "y"]])),(ConPat (Just (26,4)-(26,19)) "TripMult" (Just (TuplePat (Just (26,14)-(26,19)) [VarPat (Just (26,14)-(26,15)) "a",VarPat (Just (26,16)-(26,17)) "b",VarPat (Just (26,18)-(26,19)) "c"])),Nothing,Bop (Just (27,6)-(27,64)) FTimes (Bop (Just (27,6)-(27,44)) FTimes (App (Just (27,7)-(27,23)) (Var (Just (27,8)-(27,12)) "eval") [Tuple (Just (27,13)-(27,22)) [Var (Just (27,14)-(27,15)) "a",Var (Just (27,17)-(27,18)) "x",Var (Just (27,20)-(27,21)) "y"]]) (App (Just (27,27)-(27,43)) (Var (Just (27,28)-(27,32)) "eval") [Tuple (Just (27,33)-(27,42)) [Var (Just (27,34)-(27,35)) "b",Var (Just (27,37)-(27,38)) "x",Var (Just (27,40)-(27,41)) "y"]])) (App (Just (27,48)-(27,64)) (Var (Just (27,49)-(27,53)) "eval") [Tuple (Just (27,54)-(27,63)) [Var (Just (27,55)-(27,56)) "c",Var (Just (27,58)-(27,59)) "x",Var (Just (27,61)-(27,62)) "y"]])),(WildPat (Just (28,4)-(28,5)),Nothing,Lit (Just (28,9)-(28,12)) (LD 0.0))]
*)

(* typed spans
(15,2)-(28,12)
*)

(* correct types
float
*)

(* bad types
float
*)
