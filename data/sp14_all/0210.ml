
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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2 then buildSine (build (rand, (depth - 1)));;


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> let y = rand (2, 6) in build (rand, (y - 1));;

*)

(* changed spans
(22,6)-(22,57)
build (rand , y - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (18,32)-(18,53)) (Var (Just (18,32)-(18,37)) "build") [Tuple (Just (18,38)-(18,53)) [Var (Just (18,39)-(18,43)) "rand",Bop (Just (18,45)-(18,52)) Minus (Var (Just (18,46)-(18,47)) "y") (Lit (Just (18,50)-(18,51)) (LI 1))]]
*)

(* typed spans
(18,32)-(18,53)
*)

(* correct types
expr
*)

(* bad types
unit
*)
