
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
  let r = rand 0.4 in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildSine (build (rand, (d - 1)))
      else buildCosine build (rand, (d - 1));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(11,20)-(11,28)
EMPTY
EmptyG

(11,27)-(11,28)
EMPTY
EmptyG

(13,14)-(13,24)
EMPTY
EmptyG

(20,15)-(20,18)
(0 , depth)
TupleG (fromList [VarG,LitG])

(21,2)-(26,44)
depth
VarG

(22,31)-(22,37)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,43)-(22,49)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(24,6)-(26,44)
()
ConAppG Nothing (Just (TApp "unit" []))

(25,36)-(25,37)
depth
VarG

(26,11)-(26,22)
build (rand , d - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(26,11)-(26,44)
EMPTY
EmptyG

*)
