
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

let rec eval (e,x,y) =
  match e with | VarX  -> buildX | VarY  -> buildY | Sine e1 -> buildSine e1;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x;;

*)

(* changed spans
(18,3)-(18,77)
match e with
| VarX -> x
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(18,3)-(18,77)
(18,27)-(18,33)
(18,65)-(18,74)
(18,65)-(18,77)
*)
