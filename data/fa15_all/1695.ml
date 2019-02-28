
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
  match depth with
  | 0 -> if ((rand ()) mod 2) = 0 then buildX () else buildY ()
  | _ ->
      (match rand with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,12)-(27,29)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,39)-(27,48)
0
LitG

(29,13)-(29,17)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,14)-(30,51)
(0 , 4)
TupleG (fromList [LitG])

*)

(* changed exprs
App (Just (27,12)-(27,25)) (Var (Just (27,13)-(27,17)) "rand") [Tuple (Just (27,18)-(27,24)) [Lit (Just (27,19)-(27,20)) (LI 0),Lit (Just (27,22)-(27,23)) (LI 1)]]
Lit (Just (27,28)-(27,29)) (LI 0)
App (Just (29,13)-(29,24)) (Var (Just (29,13)-(29,17)) "rand") [Tuple (Just (29,18)-(29,24)) [Lit (Just (29,19)-(29,20)) (LI 0),Lit (Just (29,22)-(29,23)) (LI 4)]]
Tuple (Just (29,18)-(29,24)) [Lit (Just (29,19)-(29,20)) (LI 0),Lit (Just (29,22)-(29,23)) (LI 4)]
*)

(* typed spans
(27,12)-(27,25)
(27,28)-(27,29)
(29,13)-(29,24)
(29,18)-(29,24)
*)

(* correct types
int
int
int
(int * int)
*)

(* bad types
int
expr
unit -> int
expr
*)
