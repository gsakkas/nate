
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
  match depth with
  | 0 ->
      let r = rand (0, 1) in if r = 0 then buildX else if r = 1 then buildY;;


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
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ();;

*)

(* changed spans
(18,7)-(18,76)
(18,24)-(18,25)
(18,44)-(18,50)
(18,56)-(18,76)
(18,59)-(18,60)
(18,59)-(18,64)
(18,63)-(18,64)
(18,70)-(18,76)
*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(18,56)-(18,76)
(18,56)-(18,76)
(18,56)-(18,76)
(18,70)-(18,76)
*)