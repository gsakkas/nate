
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
  match depth with
  | 0 -> if (rand mod 2) == 0 then buildX else buildY
  | n -> buildSine (build (rand, (depth - 1)));;


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

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(15,11)-(15,20)
EMPTY
EmptyG

(15,16)-(15,20)
EMPTY
EmptyG

(19,9)-(19,53)
EMPTY
EmptyG

(19,12)-(19,24)
EMPTY
EmptyG

(19,12)-(19,29)
EMPTY
EmptyG

(19,13)-(19,17)
EMPTY
EmptyG

(19,22)-(19,23)
EMPTY
EmptyG

(19,28)-(19,29)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(19,47)-(19,53)
()
ConAppG Nothing (Just (TApp "unit" []))

*)
