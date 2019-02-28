
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

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> if rand > 1 then buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;


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

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;

*)

(* changed spans
(20,9)-(20,63)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (20,9)-(20,46)) (Var (Just (20,9)-(20,18)) "buildSine") [App (Just (20,19)-(20,46)) (Var (Just (20,20)-(20,25)) "build") [Tuple (Just (20,26)-(20,45)) [Var (Just (20,27)-(20,31)) "rand",Bop (Just (20,33)-(20,44)) Minus (Var (Just (20,34)-(20,39)) "depth") (Lit (Just (20,42)-(20,43)) (LI 1))]]]
*)

(* typed spans
(20,9)-(20,46)
*)

(* correct types
expr
*)

(* bad types
unit
*)
