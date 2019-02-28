
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rnd = rand 0 100 in
    (if (rnd mod 5) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 5) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 5) = 2
         then buildAverage ((buildX ()), (buildY ()))
         else
           if (rnd mod 5) = 3
           then buildTimes ((buildX ()), (buildY ()))
           else
             buildThresh
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand 0 100 in
     if (rand mod 2) = 0
     then buildAverage ((buildX ()), (buildY ()))
     else buildTimes ((buildX ()), (buildY ())));;


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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rnd = rand (0, 100) in
    (if (rnd mod 5) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 5) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 5) = 2
         then buildAverage ((buildX ()), (buildY ()))
         else
           if (rnd mod 5) = 3
           then buildTimes ((buildX ()), (buildY ()))
           else
             buildThresh
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand (0, 100) in
     if (rnd mod 2) = 0
     then buildAverage ((buildX ()), (buildY ()))
     else buildTimes ((buildX ()), (buildY ())));;

*)

(* changed spans
(28,14)-(28,24)
rand (0 , 100)
AppG (fromList [TupleG (fromList [EmptyG])])

(45,15)-(45,25)
rand (0 , 100)
AppG (fromList [TupleG (fromList [EmptyG])])

(46,9)-(46,13)
rnd
VarG

*)

(* changed exprs
App (Just (28,14)-(28,27)) (Var (Just (28,14)-(28,18)) "rand") [Tuple (Just (28,19)-(28,27)) [Lit (Just (28,20)-(28,21)) (LI 0),Lit (Just (28,23)-(28,26)) (LI 100)]]
App (Just (45,15)-(45,28)) (Var (Just (45,15)-(45,19)) "rand") [Tuple (Just (45,20)-(45,28)) [Lit (Just (45,21)-(45,22)) (LI 0),Lit (Just (45,24)-(45,27)) (LI 100)]]
Var (Just (46,9)-(46,12)) "rnd"
*)

(* typed spans
(28,14)-(28,27)
(45,15)-(45,28)
(46,9)-(46,12)
*)

(* correct types
int
int
int
*)

(* bad types
int
int
int -> int -> int
*)
