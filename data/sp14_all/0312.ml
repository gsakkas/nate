
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
  let e = build (rand, (depth - 1)) in
  if depth > 1
  then
    match rand (0 4) with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildThresh (e, e, e, e)
  else (match rand (0 1) with | 0 -> buildX () | 1 -> buildY ());;


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
  let e = build (rand, (depth - 1)) in
  if depth > 1
  then
    match rand (0, 4) with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildThresh (e, e, e, e)
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(29,15)-(29,20)
(0 , 4)
TupleG (fromList [LitG])

(35,19)-(35,24)
(0 , 1)
TupleG (fromList [LitG])

*)

(* changed exprs
Tuple (Just (29,15)-(29,21)) [Lit (Just (29,16)-(29,17)) (LI 0),Lit (Just (29,19)-(29,20)) (LI 4)]
Tuple (Just (35,19)-(35,25)) [Lit (Just (35,20)-(35,21)) (LI 0),Lit (Just (35,23)-(35,24)) (LI 1)]
*)

(* typed spans
(29,15)-(29,21)
(35,19)-(35,25)
*)

(* correct types
(int * int)
(int * int)
*)

(* bad types
'a
'a
*)
