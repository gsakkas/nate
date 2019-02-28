
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval (buildThresh (x7, x8, x9, x0));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval ((buildThresh (x7, x8, x9, x0)), x, y);;

*)

(* changed spans
(29,33)-(29,63)
(buildThresh (x7 , x8 , x9 , x0) , x , y)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (29,33)-(29,71)) [App (Just (29,34)-(29,64)) (Var (Just (29,35)-(29,46)) "buildThresh") [Tuple (Just (29,47)-(29,63)) [Var (Just (29,48)-(29,50)) "x7",Var (Just (29,52)-(29,54)) "x8",Var (Just (29,56)-(29,58)) "x9",Var (Just (29,60)-(29,62)) "x0"]],Var (Just (29,66)-(29,67)) "x",Var (Just (29,69)-(29,70)) "y"]
*)

(* typed spans
(29,33)-(29,71)
*)

(* correct types
(expr * 'a * 'a)
*)

(* bad types
expr
*)
