
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Sine e -> sin (pi *. e)
  | Cosine e -> cos (pi *. e)
  | Average (x,y) -> (x +. y) /. 2.0
  | Times (x,y) -> x *. y
  | Thresh (e,f,g,h) -> failwith "sad";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(19,38)
match e with
| VarX -> x
| VarY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(15,14)-(15,27)
y
VarG

(15,25)-(15,26)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(16,16)-(16,29)
y
VarG

(16,27)-(16,28)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(17,21)-(17,36)
y
VarG

(17,22)-(17,23)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(17,33)-(17,36)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,19)-(18,20)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,24)-(19,32)
EMPTY
EmptyG

(19,33)-(19,38)
eval
VarG

*)
