
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
  | (a,b) ->
      let rdm = rand (0, 7) in
      (match rdm with
       | 0 -> buildY ()
       | 1 -> buildX ()
       | 2 -> Cosine (build (rand, (depth - 1)))
       | 3 -> Sine (build (rand, (depth - 1)))
       | 4 ->
           Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 6 ->
           Thresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
(18,2)-(33,73)
let rdm = rand (0 , 7) in
match rdm with
| 0 -> buildY ()
| 1 -> buildX ()
| 2 -> Cosine (build (rand , depth - 1))
| 3 -> Sine (build (rand , depth - 1))
| 4 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> Thresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (18,2)-(29,67)) NonRec [(VarPat (Just (18,6)-(18,9)) "rdm",App (Just (18,12)-(18,23)) (Var (Just (18,12)-(18,16)) "rand") [Tuple (Just (18,17)-(18,23)) [Lit (Just (18,18)-(18,19)) (LI 0),Lit (Just (18,21)-(18,22)) (LI 7)]])] (Case (Just (19,2)-(29,67)) (Var (Just (19,8)-(19,11)) "rdm") [(LitPat (Just (20,4)-(20,5)) (LI 0),Nothing,App (Just (20,9)-(20,18)) (Var (Just (20,9)-(20,15)) "buildY") [ConApp (Just (20,16)-(20,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (21,4)-(21,5)) (LI 1),Nothing,App (Just (21,9)-(21,18)) (Var (Just (21,9)-(21,15)) "buildX") [ConApp (Just (21,16)-(21,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (22,4)-(22,5)) (LI 2),Nothing,ConApp (Just (22,9)-(22,43)) "Cosine" (Just (App (Just (22,16)-(22,43)) (Var (Just (22,17)-(22,22)) "build") [Tuple (Just (22,23)-(22,42)) [Var (Just (22,24)-(22,28)) "rand",Bop (Just (22,30)-(22,41)) Minus (Var (Just (22,31)-(22,36)) "depth") (Lit (Just (22,39)-(22,40)) (LI 1))]])) Nothing),(LitPat (Just (23,4)-(23,5)) (LI 3),Nothing,ConApp (Just (23,9)-(23,41)) "Sine" (Just (App (Just (23,14)-(23,41)) (Var (Just (23,15)-(23,20)) "build") [Tuple (Just (23,21)-(23,40)) [Var (Just (23,22)-(23,26)) "rand",Bop (Just (23,28)-(23,39)) Minus (Var (Just (23,29)-(23,34)) "depth") (Lit (Just (23,37)-(23,38)) (LI 1))]])) Nothing),(LitPat (Just (24,4)-(24,5)) (LI 4),Nothing,ConApp (Just (24,9)-(24,75)) "Average" (Just (Tuple (Just (24,17)-(24,75)) [App (Just (24,18)-(24,45)) (Var (Just (24,19)-(24,24)) "build") [Tuple (Just (24,25)-(24,44)) [Var (Just (24,26)-(24,30)) "rand",Bop (Just (24,32)-(24,43)) Minus (Var (Just (24,33)-(24,38)) "depth") (Lit (Just (24,41)-(24,42)) (LI 1))]],App (Just (24,47)-(24,74)) (Var (Just (24,48)-(24,53)) "build") [Tuple (Just (24,54)-(24,73)) [Var (Just (24,55)-(24,59)) "rand",Bop (Just (24,61)-(24,72)) Minus (Var (Just (24,62)-(24,67)) "depth") (Lit (Just (24,70)-(24,71)) (LI 1))]]])) Nothing),(LitPat (Just (25,4)-(25,5)) (LI 5),Nothing,ConApp (Just (25,9)-(25,73)) "Times" (Just (Tuple (Just (25,15)-(25,73)) [App (Just (25,16)-(25,43)) (Var (Just (25,17)-(25,22)) "build") [Tuple (Just (25,23)-(25,42)) [Var (Just (25,24)-(25,28)) "rand",Bop (Just (25,30)-(25,41)) Minus (Var (Just (25,31)-(25,36)) "depth") (Lit (Just (25,39)-(25,40)) (LI 1))]],App (Just (25,45)-(25,72)) (Var (Just (25,46)-(25,51)) "build") [Tuple (Just (25,52)-(25,71)) [Var (Just (25,53)-(25,57)) "rand",Bop (Just (25,59)-(25,70)) Minus (Var (Just (25,60)-(25,65)) "depth") (Lit (Just (25,68)-(25,69)) (LI 1))]]])) Nothing),(LitPat (Just (26,4)-(26,5)) (LI 6),Nothing,ConApp (Just (27,6)-(29,67)) "Thresh" (Just (Tuple (Just (28,8)-(29,67)) [App (Just (28,9)-(28,36)) (Var (Just (28,10)-(28,15)) "build") [Tuple (Just (28,16)-(28,35)) [Var (Just (28,17)-(28,21)) "rand",Bop (Just (28,23)-(28,34)) Minus (Var (Just (28,24)-(28,29)) "depth") (Lit (Just (28,32)-(28,33)) (LI 1))]],App (Just (28,38)-(28,65)) (Var (Just (28,39)-(28,44)) "build") [Tuple (Just (28,45)-(28,64)) [Var (Just (28,46)-(28,50)) "rand",Bop (Just (28,52)-(28,63)) Minus (Var (Just (28,53)-(28,58)) "depth") (Lit (Just (28,61)-(28,62)) (LI 1))]],App (Just (29,10)-(29,37)) (Var (Just (29,11)-(29,16)) "build") [Tuple (Just (29,17)-(29,36)) [Var (Just (29,18)-(29,22)) "rand",Bop (Just (29,24)-(29,35)) Minus (Var (Just (29,25)-(29,30)) "depth") (Lit (Just (29,33)-(29,34)) (LI 1))]],App (Just (29,39)-(29,66)) (Var (Just (29,40)-(29,45)) "build") [Tuple (Just (29,46)-(29,65)) [Var (Just (29,47)-(29,51)) "rand",Bop (Just (29,53)-(29,64)) Minus (Var (Just (29,54)-(29,59)) "depth") (Lit (Just (29,62)-(29,63)) (LI 1))]]])) Nothing)])
*)

(* typed spans
(18,2)-(29,67)
*)

(* correct types
expr
*)

(* bad types
expr
*)
