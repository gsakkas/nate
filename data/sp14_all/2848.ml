
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;

*)

(* changed spans
(21,9)-(21,15)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
App (Just (21,9)-(21,18)) (Var (Just (21,9)-(21,15)) "buildX") [ConApp (Just (21,16)-(21,18)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(21,9)-(21,18)
*)

(* correct types
expr
*)

(* bad types
unit -> expr
*)
