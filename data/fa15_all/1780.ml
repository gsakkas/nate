
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
  if depth = 0
  then (if (rand 0 1) = 0 then buildX () else buildY ())
  else
    (let x = rand 0 6 in
     match x with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> []);;


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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else
    (let x = rand (0, 6) in
     match x with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(27,11)-(27,21)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(29,13)-(29,21)
rand (0 , 6)
AppG (fromList [TupleG (fromList [EmptyG])])

(45,12)-(45,14)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
App (Just (27,11)-(27,24)) (Var (Just (27,12)-(27,16)) "rand") [Tuple (Just (27,17)-(27,23)) [Lit (Just (27,18)-(27,19)) (LI 0),Lit (Just (27,21)-(27,22)) (LI 1)]]
App (Just (29,13)-(29,24)) (Var (Just (29,13)-(29,17)) "rand") [Tuple (Just (29,18)-(29,24)) [Lit (Just (29,19)-(29,20)) (LI 0),Lit (Just (29,22)-(29,23)) (LI 6)]]
App (Just (45,12)-(45,21)) (Var (Just (45,12)-(45,18)) "buildX") [ConApp (Just (45,19)-(45,21)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(27,11)-(27,24)
(29,13)-(29,24)
(45,12)-(45,21)
*)

(* correct types
int
int
expr
*)

(* bad types
int
int
'a list
*)
