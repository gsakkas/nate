
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
  | 0 -> if rand mod 2 then buildX () else buildY ()
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

(19,9)-(19,52)
EMPTY
EmptyG

(19,12)-(19,16)
EMPTY
EmptyG

(19,12)-(19,22)
EMPTY
EmptyG

(19,21)-(19,22)
EMPTY
EmptyG

(19,43)-(19,49)
EMPTY
EmptyG

(19,50)-(19,52)
EMPTY
EmptyG

(20,9)-(20,46)
EMPTY
EmptyG

*)
