
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num (a,b) = rand in match num with | 0 -> VarX | _ -> VarY
  else
    (let num (a,b) = rand in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;

*)

(* changed spans
(13,16)-(13,27)
rand (0 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(15,14)-(15,25)
rand (0 , 5)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (13,17)-(13,28)) (Var (Just (13,17)-(13,21)) "rand") [Tuple (Just (13,22)-(13,28)) [Lit (Just (13,23)-(13,24)) (LI 0),Lit (Just (13,26)-(13,27)) (LI 2)]]
App (Just (15,15)-(15,26)) (Var (Just (15,15)-(15,19)) "rand") [Tuple (Just (15,20)-(15,26)) [Lit (Just (15,21)-(15,22)) (LI 0),Lit (Just (15,24)-(15,25)) (LI 5)]]
*)

(* typed spans
(13,17)-(13,28)
(15,15)-(15,26)
*)

(* correct types
int
int
*)

(* bad types
('a * 'b) -> 'c
('a * 'b) -> 'c
*)
