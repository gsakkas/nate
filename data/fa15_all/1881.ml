
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
  | 0 -> if (rand mod 2) == 0 then buildX () () else buildY () ()
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

(19,9)-(19,65)
buildX ()
AppG (fromList [ConAppG Nothing])

(19,45)-(19,47)
EMPTY
EmptyG

*)

(* typed spans
(17,9)-(17,18)
*)

(* typed spans
expr
*)

(* typed spans
expr
*)
