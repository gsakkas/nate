
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
  let newRand = rand (0, 4) in
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (newRand, (depth - 1)))
      else Sine (build (newRand, (depth - 1)))
  | 2 ->
      Average
        ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))))
  | 3 ->
      Times ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))));;


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
(18,2)-(31,76)
match depth with
| 0 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then buildY ()
        else buildX ())
| 1 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then Cosine (build (rand , depth - 1))
        else Sine (build (rand , depth - 1)))
| 2 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,ConAppG (Just EmptyG))])

*)

(* changed exprs
Case (Just (18,2)-(27,73)) (Var (Just (18,8)-(18,13)) "depth") [(LitPat (Just (19,4)-(19,5)) (LI 0),Nothing,Let (Just (20,6)-(20,75)) NonRec [(VarPat (Just (20,10)-(20,15)) "halff",App (Just (20,18)-(20,29)) (Var (Just (20,18)-(20,22)) "rand") [Tuple (Just (20,23)-(20,29)) [Lit (Just (20,24)-(20,25)) (LI 0),Lit (Just (20,27)-(20,28)) (LI 2)]])] (Ite (Just (20,33)-(20,75)) (Bop (Just (20,36)-(20,45)) Eq (Var (Just (20,36)-(20,41)) "halff") (Lit (Just (20,44)-(20,45)) (LI 0))) (App (Just (20,51)-(20,60)) (Var (Just (20,51)-(20,57)) "buildY") [ConApp (Just (20,58)-(20,60)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (20,66)-(20,75)) (Var (Just (20,66)-(20,72)) "buildX") [ConApp (Just (20,73)-(20,75)) "()" Nothing (Just (TApp "unit" []))]))),(LitPat (Just (21,4)-(21,5)) (LI 1),Nothing,Let (Just (22,6)-(25,43)) NonRec [(VarPat (Just (22,10)-(22,15)) "halff",App (Just (22,18)-(22,29)) (Var (Just (22,18)-(22,22)) "rand") [Tuple (Just (22,23)-(22,29)) [Lit (Just (22,24)-(22,25)) (LI 0),Lit (Just (22,27)-(22,28)) (LI 2)]])] (Ite (Just (23,6)-(25,43)) (Bop (Just (23,9)-(23,18)) Eq (Var (Just (23,9)-(23,14)) "halff") (Lit (Just (23,17)-(23,18)) (LI 0))) (ConApp (Just (24,11)-(24,45)) "Cosine" (Just (App (Just (24,18)-(24,45)) (Var (Just (24,19)-(24,24)) "build") [Tuple (Just (24,25)-(24,44)) [Var (Just (24,26)-(24,30)) "rand",Bop (Just (24,32)-(24,43)) Minus (Var (Just (24,33)-(24,38)) "depth") (Lit (Just (24,41)-(24,42)) (LI 1))]])) Nothing) (ConApp (Just (25,11)-(25,43)) "Sine" (Just (App (Just (25,16)-(25,43)) (Var (Just (25,17)-(25,22)) "build") [Tuple (Just (25,23)-(25,42)) [Var (Just (25,24)-(25,28)) "rand",Bop (Just (25,30)-(25,41)) Minus (Var (Just (25,31)-(25,36)) "depth") (Lit (Just (25,39)-(25,40)) (LI 1))]])) Nothing))),(LitPat (Just (26,4)-(26,5)) (LI 2),Nothing,ConApp (Just (26,9)-(26,75)) "Average" (Just (Tuple (Just (26,17)-(26,75)) [App (Just (26,18)-(26,45)) (Var (Just (26,19)-(26,24)) "build") [Tuple (Just (26,25)-(26,44)) [Var (Just (26,26)-(26,30)) "rand",Bop (Just (26,32)-(26,43)) Minus (Var (Just (26,33)-(26,38)) "depth") (Lit (Just (26,41)-(26,42)) (LI 1))]],App (Just (26,47)-(26,74)) (Var (Just (26,48)-(26,53)) "build") [Tuple (Just (26,54)-(26,73)) [Var (Just (26,55)-(26,59)) "rand",Bop (Just (26,61)-(26,72)) Minus (Var (Just (26,62)-(26,67)) "depth") (Lit (Just (26,70)-(26,71)) (LI 1))]]])) Nothing),(LitPat (Just (27,4)-(27,5)) (LI 3),Nothing,ConApp (Just (27,9)-(27,73)) "Times" (Just (Tuple (Just (27,15)-(27,73)) [App (Just (27,16)-(27,43)) (Var (Just (27,17)-(27,22)) "build") [Tuple (Just (27,23)-(27,42)) [Var (Just (27,24)-(27,28)) "rand",Bop (Just (27,30)-(27,41)) Minus (Var (Just (27,31)-(27,36)) "depth") (Lit (Just (27,39)-(27,40)) (LI 1))]],App (Just (27,45)-(27,72)) (Var (Just (27,46)-(27,51)) "build") [Tuple (Just (27,52)-(27,71)) [Var (Just (27,53)-(27,57)) "rand",Bop (Just (27,59)-(27,70)) Minus (Var (Just (27,60)-(27,65)) "depth") (Lit (Just (27,68)-(27,69)) (LI 1))]]])) Nothing)]
*)

(* typed spans
(18,2)-(27,73)
*)

(* correct types
expr
*)

(* bad types
expr
*)
