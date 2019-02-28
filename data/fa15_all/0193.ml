
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

let rec build (rand,depth) =
  let r = ((rand 1), 6) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
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
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | _ ->
      let r = rand (1, 6) in
      (match r with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(21,15)-(33,67)
fun () -> VarX
LamG (ConAppG Nothing)

(21,15)-(33,67)
fun () -> VarY
LamG (ConAppG Nothing)

(22,2)-(33,67)
match depth with
| 0 -> buildX ()
| 1 -> buildY ()
| _ -> (let r =
          rand (1 , 6) in
        match r with
        | 1 -> buildSine (build (rand , depth - 1))
        | 2 -> buildCosine (build (rand , depth - 1))
        | 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
        | 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
        | 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(22,10)-(22,23)
rand (1 , 6)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,10)-(22,23)
rand
VarG

(22,10)-(22,23)
(1 , 6)
TupleG (fromList [LitG])

*)

(* changed exprs
Lam (Just (21,11)-(21,20)) (ConPat (Just (21,11)-(21,13)) "()" Nothing) (ConApp (Just (21,16)-(21,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (23,11)-(23,20)) (ConPat (Just (23,11)-(23,13)) "()" Nothing) (ConApp (Just (23,16)-(23,20)) "VarY" Nothing Nothing) Nothing
Case (Just (26,2)-(43,73)) (Var (Just (26,8)-(26,13)) "depth") [(LitPat (Just (27,4)-(27,5)) (LI 0),Nothing,App (Just (27,9)-(27,18)) (Var (Just (27,9)-(27,15)) "buildX") [ConApp (Just (27,16)-(27,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (28,4)-(28,5)) (LI 1),Nothing,App (Just (28,9)-(28,18)) (Var (Just (28,9)-(28,15)) "buildY") [ConApp (Just (28,16)-(28,18)) "()" Nothing (Just (TApp "unit" []))]),(WildPat (Just (29,4)-(29,5)),Nothing,Let (Just (30,6)-(43,73)) NonRec [(VarPat (Just (30,10)-(30,11)) "r",App (Just (30,14)-(30,25)) (Var (Just (30,14)-(30,18)) "rand") [Tuple (Just (30,19)-(30,25)) [Lit (Just (30,20)-(30,21)) (LI 1),Lit (Just (30,23)-(30,24)) (LI 6)]])] (Case (Just (31,6)-(43,73)) (Var (Just (31,13)-(31,14)) "r") [(LitPat (Just (32,9)-(32,10)) (LI 1),Nothing,App (Just (32,14)-(32,51)) (Var (Just (32,14)-(32,23)) "buildSine") [App (Just (32,24)-(32,51)) (Var (Just (32,25)-(32,30)) "build") [Tuple (Just (32,31)-(32,50)) [Var (Just (32,32)-(32,36)) "rand",Bop (Just (32,38)-(32,49)) Minus (Var (Just (32,39)-(32,44)) "depth") (Lit (Just (32,47)-(32,48)) (LI 1))]]]),(LitPat (Just (33,9)-(33,10)) (LI 2),Nothing,App (Just (33,14)-(33,53)) (Var (Just (33,14)-(33,25)) "buildCosine") [App (Just (33,26)-(33,53)) (Var (Just (33,27)-(33,32)) "build") [Tuple (Just (33,33)-(33,52)) [Var (Just (33,34)-(33,38)) "rand",Bop (Just (33,40)-(33,51)) Minus (Var (Just (33,41)-(33,46)) "depth") (Lit (Just (33,49)-(33,50)) (LI 1))]]]),(LitPat (Just (34,9)-(34,10)) (LI 3),Nothing,App (Just (35,11)-(36,71)) (Var (Just (35,11)-(35,23)) "buildAverage") [Tuple (Just (36,13)-(36,71)) [App (Just (36,14)-(36,41)) (Var (Just (36,15)-(36,20)) "build") [Tuple (Just (36,21)-(36,40)) [Var (Just (36,22)-(36,26)) "rand",Bop (Just (36,28)-(36,39)) Minus (Var (Just (36,29)-(36,34)) "depth") (Lit (Just (36,37)-(36,38)) (LI 1))]],App (Just (36,43)-(36,70)) (Var (Just (36,44)-(36,49)) "build") [Tuple (Just (36,50)-(36,69)) [Var (Just (36,51)-(36,55)) "rand",Bop (Just (36,57)-(36,68)) Minus (Var (Just (36,58)-(36,63)) "depth") (Lit (Just (36,66)-(36,67)) (LI 1))]]]]),(LitPat (Just (37,9)-(37,10)) (LI 4),Nothing,App (Just (38,11)-(39,71)) (Var (Just (38,11)-(38,21)) "buildTimes") [Tuple (Just (39,13)-(39,71)) [App (Just (39,14)-(39,41)) (Var (Just (39,15)-(39,20)) "build") [Tuple (Just (39,21)-(39,40)) [Var (Just (39,22)-(39,26)) "rand",Bop (Just (39,28)-(39,39)) Minus (Var (Just (39,29)-(39,34)) "depth") (Lit (Just (39,37)-(39,38)) (LI 1))]],App (Just (39,43)-(39,70)) (Var (Just (39,44)-(39,49)) "build") [Tuple (Just (39,50)-(39,69)) [Var (Just (39,51)-(39,55)) "rand",Bop (Just (39,57)-(39,68)) Minus (Var (Just (39,58)-(39,63)) "depth") (Lit (Just (39,66)-(39,67)) (LI 1))]]]]),(LitPat (Just (40,9)-(40,10)) (LI 5),Nothing,App (Just (41,11)-(43,72)) (Var (Just (41,11)-(41,22)) "buildThresh") [Tuple (Just (42,13)-(43,72)) [App (Just (42,14)-(42,41)) (Var (Just (42,15)-(42,20)) "build") [Tuple (Just (42,21)-(42,40)) [Var (Just (42,22)-(42,26)) "rand",Bop (Just (42,28)-(42,39)) Minus (Var (Just (42,29)-(42,34)) "depth") (Lit (Just (42,37)-(42,38)) (LI 1))]],App (Just (42,43)-(42,70)) (Var (Just (42,44)-(42,49)) "build") [Tuple (Just (42,50)-(42,69)) [Var (Just (42,51)-(42,55)) "rand",Bop (Just (42,57)-(42,68)) Minus (Var (Just (42,58)-(42,63)) "depth") (Lit (Just (42,66)-(42,67)) (LI 1))]],App (Just (43,15)-(43,42)) (Var (Just (43,16)-(43,21)) "build") [Tuple (Just (43,22)-(43,41)) [Var (Just (43,23)-(43,27)) "rand",Bop (Just (43,29)-(43,40)) Minus (Var (Just (43,30)-(43,35)) "depth") (Lit (Just (43,38)-(43,39)) (LI 1))]],App (Just (43,44)-(43,71)) (Var (Just (43,45)-(43,50)) "build") [Tuple (Just (43,51)-(43,70)) [Var (Just (43,52)-(43,56)) "rand",Bop (Just (43,58)-(43,69)) Minus (Var (Just (43,59)-(43,64)) "depth") (Lit (Just (43,67)-(43,68)) (LI 1))]]]])]))]
App (Just (30,14)-(30,25)) (Var (Just (30,14)-(30,18)) "rand") [Tuple (Just (30,19)-(30,25)) [Lit (Just (30,20)-(30,21)) (LI 1),Lit (Just (30,23)-(30,24)) (LI 6)]]
Var (Just (30,14)-(30,18)) "rand"
Tuple (Just (30,19)-(30,25)) [Lit (Just (30,20)-(30,21)) (LI 1),Lit (Just (30,23)-(30,24)) (LI 6)]
*)

(* typed spans
(21,11)-(21,20)
(23,11)-(23,20)
(26,2)-(43,73)
(30,14)-(30,25)
(30,14)-(30,18)
(30,19)-(30,25)
*)

(* correct types
unit -> expr
unit -> expr
expr
int
(int * int) -> int
(int * int)
*)

(* bad types
(int -> 'a * int) -> expr
(int -> 'a * int) -> expr
expr
('a * int)
('a * int)
('a * int)
*)
