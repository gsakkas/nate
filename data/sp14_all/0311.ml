
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let e = build (rand, (depth - 1)) in
  if depth > 0
  then
    match rand 0 4 with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildTimes (e, e, e, e)
  else (match rand 0 1 with | 0 -> buildX () | 1 -> buildY ());;


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
(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(25,13)-(25,14)
1
LitG

(27,10)-(27,18)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,11)-(32,21)
buildThresh
VarG

(33,14)-(33,22)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lit (Just (27,13)-(27,14)) (LI 1)
App (Just (29,10)-(29,21)) (Var (Just (29,10)-(29,14)) "rand") [Tuple (Just (29,15)-(29,21)) [Lit (Just (29,16)-(29,17)) (LI 0),Lit (Just (29,19)-(29,20)) (LI 4)]]
Var (Just (34,11)-(34,22)) "buildThresh"
App (Just (35,14)-(35,25)) (Var (Just (35,14)-(35,18)) "rand") [Tuple (Just (35,19)-(35,25)) [Lit (Just (35,20)-(35,21)) (LI 0),Lit (Just (35,23)-(35,24)) (LI 1)]]
*)

(* typed spans
(17,17)-(17,67)
(27,13)-(27,14)
(29,10)-(29,21)
(34,11)-(34,22)
(35,14)-(35,25)
*)

(* correct types
(expr * expr * expr * expr) -> expr
int
int
(expr * expr * expr * expr) -> expr
int
*)

(* bad types
(expr * expr) -> expr
int
int
(expr * expr) -> expr
int
*)
