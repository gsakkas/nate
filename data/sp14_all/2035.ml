
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

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))),
             (buildAverage (build (rand, (depth - 1)))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(29,27)-(29,54)
build
VarG

(29,27)-(29,54)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(29,27)-(29,54)
rand
VarG

(29,27)-(29,54)
depth - 1
BopG VarG LitG

(29,27)-(29,54)
depth
VarG

(29,27)-(29,54)
1
LitG

*)

(* changed exprs
Var (Just (28,42)-(28,47)) "build"
Tuple (Just (28,48)-(28,67)) [Var (Just (28,49)-(28,53)) "rand",Bop (Just (28,55)-(28,66)) Minus (Var (Just (28,56)-(28,61)) "depth") (Lit (Just (28,64)-(28,65)) (LI 1))]
Var (Just (28,49)-(28,53)) "rand"
Bop (Just (28,55)-(28,66)) Minus (Var (Just (28,56)-(28,61)) "depth") (Lit (Just (28,64)-(28,65)) (LI 1))
Var (Just (28,56)-(28,61)) "depth"
Lit (Just (28,64)-(28,65)) (LI 1)
*)

(* typed spans
(28,42)-(28,47)
(28,48)-(28,67)
(28,49)-(28,53)
(28,55)-(28,66)
(28,56)-(28,61)
(28,64)-(28,65)
*)

(* correct types
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
*)

(* bad types
expr
expr
expr
expr
expr
expr
*)
