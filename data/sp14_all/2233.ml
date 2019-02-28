
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build rand (depth - 1))
    | 3 -> buildCosine (build rand (depth - 1))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(25,21)-(25,45)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(26,23)-(26,47)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (25,21)-(25,48)) (Var (Just (25,22)-(25,27)) "build") [Tuple (Just (25,28)-(25,47)) [Var (Just (25,29)-(25,33)) "rand",Bop (Just (25,35)-(25,46)) Minus (Var (Just (25,36)-(25,41)) "depth") (Lit (Just (25,44)-(25,45)) (LI 1))]]
App (Just (26,23)-(26,50)) (Var (Just (26,24)-(26,29)) "build") [Tuple (Just (26,30)-(26,49)) [Var (Just (26,31)-(26,35)) "rand",Bop (Just (26,37)-(26,48)) Minus (Var (Just (26,38)-(26,43)) "depth") (Lit (Just (26,46)-(26,47)) (LI 1))]]
*)

(* typed spans
(25,21)-(25,48)
(26,23)-(26,50)
*)

(* correct types
expr
expr
*)

(* bad types
expr
expr
*)
