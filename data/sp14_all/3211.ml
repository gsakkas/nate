
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let case = 0 in
  if depth = 0
  then case = (rand (0, 1))
  else
    (let case = rand (0, 6) in
     match case with
     | 0 -> buildX
     | 1 -> buildY
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
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
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let case = rand (0, 6) in
  match case with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(27,2)-(45,71)
rand (0 , 6)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,2)-(45,71)
match case with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(27,2)-(45,71)
case
VarG

(27,2)-(45,71)
buildX ()
AppG (fromList [ConAppG Nothing])

(33,12)-(33,18)
buildY ()
AppG (fromList [ConAppG Nothing])

(34,12)-(34,49)
()
ConAppG Nothing

*)

(* changed exprs
App (Just (26,13)-(26,24)) (Var (Just (26,13)-(26,17)) "rand") [Tuple (Just (26,18)-(26,24)) [Lit (Just (26,19)-(26,20)) (LI 0),Lit (Just (26,22)-(26,23)) (LI 6)]]
Case (Just (27,2)-(39,67)) (Var (Just (27,8)-(27,12)) "case") [(LitPat (Just (28,4)-(28,5)) (LI 0),Nothing,App (Just (28,9)-(28,18)) (Var (Just (28,9)-(28,15)) "buildX") [ConApp (Just (28,16)-(28,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (29,4)-(29,5)) (LI 1),Nothing,App (Just (29,9)-(29,18)) (Var (Just (29,9)-(29,15)) "buildY") [ConApp (Just (29,16)-(29,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (30,4)-(30,5)) (LI 2),Nothing,App (Just (30,9)-(30,46)) (Var (Just (30,9)-(30,18)) "buildSine") [App (Just (30,19)-(30,46)) (Var (Just (30,20)-(30,25)) "build") [Tuple (Just (30,26)-(30,45)) [Var (Just (30,27)-(30,31)) "rand",Bop (Just (30,33)-(30,44)) Minus (Var (Just (30,34)-(30,39)) "depth") (Lit (Just (30,42)-(30,43)) (LI 1))]]]),(LitPat (Just (31,4)-(31,5)) (LI 3),Nothing,App (Just (31,9)-(31,48)) (Var (Just (31,9)-(31,20)) "buildCosine") [App (Just (31,21)-(31,48)) (Var (Just (31,22)-(31,27)) "build") [Tuple (Just (31,28)-(31,47)) [Var (Just (31,29)-(31,33)) "rand",Bop (Just (31,35)-(31,46)) Minus (Var (Just (31,36)-(31,41)) "depth") (Lit (Just (31,44)-(31,45)) (LI 1))]]]),(LitPat (Just (32,4)-(32,5)) (LI 4),Nothing,App (Just (33,6)-(33,77)) (Var (Just (33,6)-(33,18)) "buildAverage") [Tuple (Just (33,19)-(33,77)) [App (Just (33,20)-(33,47)) (Var (Just (33,21)-(33,26)) "build") [Tuple (Just (33,27)-(33,46)) [Var (Just (33,28)-(33,32)) "rand",Bop (Just (33,34)-(33,45)) Minus (Var (Just (33,35)-(33,40)) "depth") (Lit (Just (33,43)-(33,44)) (LI 1))]],App (Just (33,49)-(33,76)) (Var (Just (33,50)-(33,55)) "build") [Tuple (Just (33,56)-(33,75)) [Var (Just (33,57)-(33,61)) "rand",Bop (Just (33,63)-(33,74)) Minus (Var (Just (33,64)-(33,69)) "depth") (Lit (Just (33,72)-(33,73)) (LI 1))]]]]),(LitPat (Just (34,4)-(34,5)) (LI 5),Nothing,App (Just (35,6)-(35,75)) (Var (Just (35,6)-(35,16)) "buildTimes") [Tuple (Just (35,17)-(35,75)) [App (Just (35,18)-(35,45)) (Var (Just (35,19)-(35,24)) "build") [Tuple (Just (35,25)-(35,44)) [Var (Just (35,26)-(35,30)) "rand",Bop (Just (35,32)-(35,43)) Minus (Var (Just (35,33)-(35,38)) "depth") (Lit (Just (35,41)-(35,42)) (LI 1))]],App (Just (35,47)-(35,74)) (Var (Just (35,48)-(35,53)) "build") [Tuple (Just (35,54)-(35,73)) [Var (Just (35,55)-(35,59)) "rand",Bop (Just (35,61)-(35,72)) Minus (Var (Just (35,62)-(35,67)) "depth") (Lit (Just (35,70)-(35,71)) (LI 1))]]]]),(LitPat (Just (36,4)-(36,5)) (LI 6),Nothing,App (Just (37,6)-(39,67)) (Var (Just (37,6)-(37,17)) "buildThresh") [Tuple (Just (38,8)-(39,67)) [App (Just (38,9)-(38,36)) (Var (Just (38,10)-(38,15)) "build") [Tuple (Just (38,16)-(38,35)) [Var (Just (38,17)-(38,21)) "rand",Bop (Just (38,23)-(38,34)) Minus (Var (Just (38,24)-(38,29)) "depth") (Lit (Just (38,32)-(38,33)) (LI 1))]],App (Just (38,38)-(38,65)) (Var (Just (38,39)-(38,44)) "build") [Tuple (Just (38,45)-(38,64)) [Var (Just (38,46)-(38,50)) "rand",Bop (Just (38,52)-(38,63)) Minus (Var (Just (38,53)-(38,58)) "depth") (Lit (Just (38,61)-(38,62)) (LI 1))]],App (Just (39,10)-(39,37)) (Var (Just (39,11)-(39,16)) "build") [Tuple (Just (39,17)-(39,36)) [Var (Just (39,18)-(39,22)) "rand",Bop (Just (39,24)-(39,35)) Minus (Var (Just (39,25)-(39,30)) "depth") (Lit (Just (39,33)-(39,34)) (LI 1))]],App (Just (39,39)-(39,66)) (Var (Just (39,40)-(39,45)) "build") [Tuple (Just (39,46)-(39,65)) [Var (Just (39,47)-(39,51)) "rand",Bop (Just (39,53)-(39,64)) Minus (Var (Just (39,54)-(39,59)) "depth") (Lit (Just (39,62)-(39,63)) (LI 1))]]]])]
Var (Just (27,8)-(27,12)) "case"
App (Just (28,9)-(28,18)) (Var (Just (28,9)-(28,15)) "buildX") [ConApp (Just (28,16)-(28,18)) "()" Nothing (Just (TApp "unit" []))]
App (Just (29,9)-(29,18)) (Var (Just (29,9)-(29,15)) "buildY") [ConApp (Just (29,16)-(29,18)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (29,16)-(29,18)) "()" Nothing (Just (TApp "unit" []))
*)

(* typed spans
(26,13)-(26,24)
(27,2)-(39,67)
(27,8)-(27,12)
(28,9)-(28,18)
(29,9)-(29,18)
(29,16)-(29,18)
*)

(* correct types
int
expr
int
expr
expr
unit
*)

(* bad types
unit -> expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
expr
*)
