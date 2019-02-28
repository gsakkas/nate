
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
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) / 2
  | Times (v,w) -> (eval (v, x, y)) * (eval (w, x, y))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;


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
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y));;

*)

(* changed spans
(29,2)-(40,69)
let pi = 3.142 in
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)
LetG NonRec (fromList [LitG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (12,2)-(19,55)) NonRec [(VarPat (Just (12,6)-(12,8)) "pi",Lit (Just (12,11)-(12,16)) (LD 3.142))] (Case (Just (13,2)-(19,55)) (Var (Just (13,8)-(13,9)) "e") [(ConPat (Just (14,4)-(14,8)) "VarX" Nothing,Nothing,Var (Just (14,13)-(14,14)) "x"),(ConPat (Just (15,4)-(15,8)) "VarY" Nothing,Nothing,Var (Just (15,13)-(15,14)) "y"),(ConPat (Just (16,4)-(16,10)) "Sine" (Just (VarPat (Just (16,9)-(16,10)) "v")),Nothing,App (Just (16,14)-(16,42)) (Var (Just (16,14)-(16,17)) "sin") [Bop (Just (16,18)-(16,42)) FTimes (Var (Just (16,19)-(16,21)) "pi") (App (Just (16,25)-(16,41)) (Var (Just (16,26)-(16,30)) "eval") [Tuple (Just (16,31)-(16,40)) [Var (Just (16,32)-(16,33)) "v",Var (Just (16,35)-(16,36)) "x",Var (Just (16,38)-(16,39)) "y"]])]),(ConPat (Just (17,4)-(17,12)) "Cosine" (Just (VarPat (Just (17,11)-(17,12)) "v")),Nothing,App (Just (17,16)-(17,44)) (Var (Just (17,16)-(17,19)) "cos") [Bop (Just (17,20)-(17,44)) FTimes (Var (Just (17,21)-(17,23)) "pi") (App (Just (17,27)-(17,43)) (Var (Just (17,28)-(17,32)) "eval") [Tuple (Just (17,33)-(17,42)) [Var (Just (17,34)-(17,35)) "v",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]])]),(ConPat (Just (18,4)-(18,16)) "Average" (Just (TuplePat (Just (18,13)-(18,16)) [VarPat (Just (18,13)-(18,14)) "v",VarPat (Just (18,15)-(18,16)) "w"])),Nothing,Bop (Just (18,21)-(18,66)) FDiv (Bop (Just (18,21)-(18,59)) FPlus (App (Just (18,22)-(18,38)) (Var (Just (18,23)-(18,27)) "eval") [Tuple (Just (18,28)-(18,37)) [Var (Just (18,29)-(18,30)) "v",Var (Just (18,32)-(18,33)) "x",Var (Just (18,35)-(18,36)) "y"]]) (App (Just (18,42)-(18,58)) (Var (Just (18,43)-(18,47)) "eval") [Tuple (Just (18,48)-(18,57)) [Var (Just (18,49)-(18,50)) "w",Var (Just (18,52)-(18,53)) "x",Var (Just (18,55)-(18,56)) "y"]])) (Lit (Just (18,63)-(18,66)) (LD 2.0))),(ConPat (Just (19,4)-(19,14)) "Times" (Just (TuplePat (Just (19,11)-(19,14)) [VarPat (Just (19,11)-(19,12)) "v",VarPat (Just (19,13)-(19,14)) "w"])),Nothing,Bop (Just (19,19)-(19,55)) FTimes (App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,24)) "eval") [Tuple (Just (19,25)-(19,34)) [Var (Just (19,26)-(19,27)) "v",Var (Just (19,29)-(19,30)) "x",Var (Just (19,32)-(19,33)) "y"]]) (App (Just (19,39)-(19,55)) (Var (Just (19,40)-(19,44)) "eval") [Tuple (Just (19,45)-(19,54)) [Var (Just (19,46)-(19,47)) "w",Var (Just (19,49)-(19,50)) "x",Var (Just (19,52)-(19,53)) "y"]]))])
*)

(* typed spans
(12,2)-(19,55)
*)

(* correct types
float
*)

(* bad types
int
*)
