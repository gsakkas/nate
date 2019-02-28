
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX
  | 1 -> build (rand, (depth - (depth - 1)))
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
(13,16)-(13,39)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(19,9)-(19,15)
buildX ()
AppG (fromList [ConAppG Nothing])

(20,9)-(20,44)
()
ConAppG Nothing

(20,9)-(20,14)
buildSine
VarG

(20,9)-(20,14)
build (rand , depth - (depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (13,14)-(13,24)) (VarPat (Just (13,14)-(13,15)) "e") (ConApp (Just (13,18)-(13,24)) "Sine" (Just (Var (Just (13,23)-(13,24)) "e")) Nothing) Nothing
App (Just (21,9)-(21,18)) (Var (Just (21,9)-(21,15)) "buildX") [ConApp (Just (21,16)-(21,18)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (21,16)-(21,18)) "()" Nothing (Just (TApp "unit" []))
Var (Just (22,9)-(22,18)) "buildSine"
App (Just (22,19)-(22,56)) (Var (Just (22,20)-(22,25)) "build") [Tuple (Just (22,26)-(22,55)) [Var (Just (22,27)-(22,31)) "rand",Bop (Just (22,33)-(22,54)) Minus (Var (Just (22,34)-(22,39)) "depth") (Bop (Just (22,42)-(22,53)) Minus (Var (Just (22,43)-(22,48)) "depth") (Lit (Just (22,51)-(22,52)) (LI 1)))]]
*)

(* typed spans
(13,14)-(13,24)
(21,9)-(21,18)
(21,16)-(21,18)
(22,9)-(22,18)
(22,19)-(22,56)
*)

(* correct types
expr -> expr
expr
unit
expr -> expr
expr
*)

(* bad types
(expr * expr) -> expr
unit -> expr
expr
('a * int) -> expr
('a * int) -> expr
*)
