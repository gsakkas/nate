
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let y = rand (2, 6) in
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else if y = 2 then y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(16,2)-(19,22)
EMPTY
EmptyG

(16,10)-(16,14)
EMPTY
EmptyG

(16,10)-(16,21)
EMPTY
EmptyG

(16,15)-(16,21)
EMPTY
EmptyG

(16,16)-(16,17)
EMPTY
EmptyG

(16,19)-(16,20)
EMPTY
EmptyG

(19,7)-(19,22)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(19,10)-(19,11)
let y = rand (2 , 6) in
buildX ()
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(19,10)-(19,15)
EMPTY
EmptyG

(19,14)-(19,15)
rand (2 , 6)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,21)-(19,22)
6
LitG

*)
