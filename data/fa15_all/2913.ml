
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Abs v -> abs (eval (v, x, y))
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then eval ((c * (-1)), x, y)
      else eval (c, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mid of expr* expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Mid (p,q) ->
      let diff =
        if ((eval (p, x, y)) -. (eval (q, x, y))) < 0.0
        then (eval (p, x, y)) -. ((eval (q, x, y)) *. (-1.0))
        else (eval (p, x, y)) -. (eval (q, x, y)) in
      diff /. 2.0
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then (eval (c, x, y)) *. (-1.0)
      else eval (c, x, y);;

*)

(* changed spans
(16,2)-(31,25)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(27,13)-(27,16)
eval
VarG

(27,13)-(27,33)
let diff =
  if (eval (p , x , y) -. eval (q , x , y)) < 0.0
  then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
  else eval (p , x , y) -. eval (q , x , y) in
diff /. 2.0
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (BopG EmptyG EmptyG)

(27,17)-(27,33)
(p , x , y)
TupleG (fromList [VarG])

(27,24)-(27,25)
q
VarG

(29,6)-(31,25)
eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

(30,11)-(30,34)
eval (c , x , y) *. (- 1.0)
BopG (AppG (fromList [EmptyG])) (UopG EmptyG)

(30,17)-(30,27)
EMPTY
EmptyG

(30,22)-(30,26)
EMPTY
EmptyG

(31,11)-(31,25)
(- 1.0)
UopG LitG

*)
