
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand with
  | 0 -> let halff = rand in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,8)-(18,12)
depth
VarG

(19,21)-(19,25)
rand (0 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,29)-(19,71)
(0 , 2)
TupleG (fromList [LitG])

*)

(* changed exprs
Var (Just (18,8)-(18,13)) "depth"
App (Just (20,18)-(20,29)) (Var (Just (20,18)-(20,22)) "rand") [Tuple (Just (20,23)-(20,29)) [Lit (Just (20,24)-(20,25)) (LI 0),Lit (Just (20,27)-(20,28)) (LI 2)]]
Tuple (Just (20,23)-(20,29)) [Lit (Just (20,24)-(20,25)) (LI 0),Lit (Just (20,27)-(20,28)) (LI 2)]
*)

(* typed spans
(18,8)-(18,13)
(20,18)-(20,29)
(20,23)-(20,29)
*)

(* correct types
int
int
(int * int)
*)

(* bad types
int
int
expr
*)
