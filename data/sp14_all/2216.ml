
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 10) with
       | 1 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 2 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 3 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 4 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 5 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 6 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 7 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 8 -> buildX ()
       | 9 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 13) with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 -> buildSine (build (rand, (depth - 1)))
       | 4 -> buildCosine (build (rand, (depth - 1)))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 6 -> buildSine (build (rand, (depth - 1)))
       | 7 -> buildCosine (build (rand, (depth - 1)))
       | 8 -> buildSine (build (rand, (depth - 1)))
       | 9 -> buildCosine (build (rand, (depth - 1)))
       | 10 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 11 -> buildX ()
       | 12 -> buildY ());;

*)

(* changed spans
(21,9)-(21,12)
EMPTY
EmptyG

(21,9)-(21,26)
EMPTY
EmptyG

(21,16)-(21,26)
EMPTY
EmptyG

(21,17)-(21,21)
EMPTY
EmptyG

(21,22)-(21,25)
EMPTY
EmptyG

(27,6)-(39,24)
match rand (1 , 13) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildSine (build (rand , depth - 1))
| 4 -> buildCosine (build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSine (build (rand , depth - 1))
| 7 -> buildCosine (build (rand , depth - 1))
| 8 -> buildSine (build (rand , depth - 1))
| 9 -> buildCosine (build (rand , depth - 1))
| 10 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 11 -> buildX ()
| 12 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(27,22)-(27,24)
13
LitG

(28,24)-(28,59)
EMPTY
EmptyG

(28,25)-(28,27)
EMPTY
EmptyG

(29,26)-(29,61)
EMPTY
EmptyG

(29,27)-(29,29)
EMPTY
EmptyG

(30,24)-(30,59)
EMPTY
EmptyG

(30,25)-(30,27)
EMPTY
EmptyG

(31,26)-(31,61)
EMPTY
EmptyG

(31,27)-(31,29)
EMPTY
EmptyG

(32,14)-(32,23)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(32,24)-(32,59)
EMPTY
EmptyG

(32,25)-(32,27)
EMPTY
EmptyG

(33,26)-(33,61)
EMPTY
EmptyG

(33,27)-(33,29)
EMPTY
EmptyG

(35,11)-(35,22)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)
