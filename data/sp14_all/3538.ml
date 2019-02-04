
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
  let rdm = rand in
  match rdm with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  let rdm = rand (0, 7) in
  match rdm with
  | 0 -> buildY ()
  | 1 -> buildX ()
  | 2 -> Cosine (build (rand, (depth - 1)))
  | 3 -> Sine (build (rand, (depth - 1)))
  | 4 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,12)-(18,16)
EMPTY
EmptyG

(19,2)-(32,67)
EMPTY
EmptyG

(19,8)-(19,11)
EMPTY
EmptyG

(21,6)-(21,75)
EMPTY
EmptyG

(21,27)-(21,28)
EMPTY
EmptyG

(21,33)-(21,75)
EMPTY
EmptyG

(21,36)-(21,41)
EMPTY
EmptyG

(21,36)-(21,45)
EMPTY
EmptyG

(21,44)-(21,45)
7
LitG

(21,51)-(21,60)
match rdm with
| 0 -> buildY ()
| 1 -> buildX ()
| 2 -> Cosine (build (rand , depth - 1))
| 3 -> Sine (build (rand , depth - 1))
| 4 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> Thresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ConAppG (Just EmptyG) Nothing)])

(23,6)-(26,43)
EMPTY
EmptyG

(23,18)-(23,22)
EMPTY
EmptyG

(23,18)-(23,29)
EMPTY
EmptyG

(23,23)-(23,29)
EMPTY
EmptyG

(23,24)-(23,25)
EMPTY
EmptyG

(23,27)-(23,28)
EMPTY
EmptyG

(24,6)-(26,43)
EMPTY
EmptyG

(24,9)-(24,14)
EMPTY
EmptyG

(24,9)-(24,18)
EMPTY
EmptyG

(24,17)-(24,18)
EMPTY
EmptyG

*)
