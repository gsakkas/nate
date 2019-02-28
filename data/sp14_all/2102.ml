
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
  match rand (1, 7) with
  | _ -> rand (1, 7)
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;

*)

(* changed spans
(26,2)-(48,71)
match rand (1 , 7) with
| 1 -> buildX ()
| 2 -> buildY ()
| 3 -> buildSine (if depth = 0
                  then buildX ()
                  else build (rand , depth - 1))
| 4 -> buildCosine (if depth = 0
                    then buildY ()
                    else build (rand , depth - 1))
| 5 -> buildAverage (if depth = 0
                     then buildX ()
                     else build (rand , depth - 1) , if depth = 0
                                                     then buildY ()
                                                     else build (rand , depth - 1))
| 6 -> buildTimes (if depth = 0
                   then buildX ()
                   else build (rand , depth - 1) , if depth = 0
                                                   then buildY ()
                                                   else build (rand , depth - 1))
| 7 -> buildThresh (if depth = 0
                    then buildX ()
                    else build (rand , depth - 1) , if depth = 0
                                                    then buildY ()
                                                    else build (rand , depth - 1) , if depth = 0
                                                                                    then buildX ()
                                                                                    else build (rand , depth - 1) , if depth = 0
                                                                                                                    then buildY ()
                                                                                                                    else build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (26,2)-(47,71)) (App (Just (26,8)-(26,19)) (Var (Just (26,8)-(26,12)) "rand") [Tuple (Just (26,13)-(26,19)) [Lit (Just (26,14)-(26,15)) (LI 1),Lit (Just (26,17)-(26,18)) (LI 7)]]) [(LitPat (Just (27,4)-(27,5)) (LI 1),Nothing,App (Just (27,9)-(27,18)) (Var (Just (27,9)-(27,15)) "buildX") [ConApp (Just (27,16)-(27,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (28,4)-(28,5)) (LI 2),Nothing,App (Just (28,9)-(28,18)) (Var (Just (28,9)-(28,15)) "buildY") [ConApp (Just (28,16)-(28,18)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (29,4)-(29,5)) (LI 3),Nothing,App (Just (30,6)-(30,76)) (Var (Just (30,6)-(30,15)) "buildSine") [Ite (Just (30,16)-(30,76)) (Bop (Just (30,20)-(30,29)) Eq (Var (Just (30,20)-(30,25)) "depth") (Lit (Just (30,28)-(30,29)) (LI 0))) (App (Just (30,35)-(30,44)) (Var (Just (30,35)-(30,41)) "buildX") [ConApp (Just (30,42)-(30,44)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (30,50)-(30,75)) (Var (Just (30,50)-(30,55)) "build") [Tuple (Just (30,56)-(30,75)) [Var (Just (30,57)-(30,61)) "rand",Bop (Just (30,63)-(30,74)) Minus (Var (Just (30,64)-(30,69)) "depth") (Lit (Just (30,72)-(30,73)) (LI 1))]])]),(LitPat (Just (31,4)-(31,5)) (LI 4),Nothing,App (Just (32,6)-(33,68)) (Var (Just (32,6)-(32,17)) "buildCosine") [Ite (Just (33,8)-(33,68)) (Bop (Just (33,12)-(33,21)) Eq (Var (Just (33,12)-(33,17)) "depth") (Lit (Just (33,20)-(33,21)) (LI 0))) (App (Just (33,27)-(33,36)) (Var (Just (33,27)-(33,33)) "buildY") [ConApp (Just (33,34)-(33,36)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (33,42)-(33,67)) (Var (Just (33,42)-(33,47)) "build") [Tuple (Just (33,48)-(33,67)) [Var (Just (33,49)-(33,53)) "rand",Bop (Just (33,55)-(33,66)) Minus (Var (Just (33,56)-(33,61)) "depth") (Lit (Just (33,64)-(33,65)) (LI 1))]])]),(LitPat (Just (34,4)-(34,5)) (LI 5),Nothing,App (Just (35,6)-(37,71)) (Var (Just (35,6)-(35,18)) "buildAverage") [Tuple (Just (36,8)-(37,71)) [Ite (Just (36,9)-(36,69)) (Bop (Just (36,13)-(36,22)) Eq (Var (Just (36,13)-(36,18)) "depth") (Lit (Just (36,21)-(36,22)) (LI 0))) (App (Just (36,28)-(36,37)) (Var (Just (36,28)-(36,34)) "buildX") [ConApp (Just (36,35)-(36,37)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (36,43)-(36,68)) (Var (Just (36,43)-(36,48)) "build") [Tuple (Just (36,49)-(36,68)) [Var (Just (36,50)-(36,54)) "rand",Bop (Just (36,56)-(36,67)) Minus (Var (Just (36,57)-(36,62)) "depth") (Lit (Just (36,65)-(36,66)) (LI 1))]]),Ite (Just (37,10)-(37,70)) (Bop (Just (37,14)-(37,23)) Eq (Var (Just (37,14)-(37,19)) "depth") (Lit (Just (37,22)-(37,23)) (LI 0))) (App (Just (37,29)-(37,38)) (Var (Just (37,29)-(37,35)) "buildY") [ConApp (Just (37,36)-(37,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (37,44)-(37,69)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]])]]),(LitPat (Just (38,4)-(38,5)) (LI 6),Nothing,App (Just (39,6)-(41,71)) (Var (Just (39,6)-(39,16)) "buildTimes") [Tuple (Just (40,8)-(41,71)) [Ite (Just (40,9)-(40,69)) (Bop (Just (40,13)-(40,22)) Eq (Var (Just (40,13)-(40,18)) "depth") (Lit (Just (40,21)-(40,22)) (LI 0))) (App (Just (40,28)-(40,37)) (Var (Just (40,28)-(40,34)) "buildX") [ConApp (Just (40,35)-(40,37)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (40,43)-(40,68)) (Var (Just (40,43)-(40,48)) "build") [Tuple (Just (40,49)-(40,68)) [Var (Just (40,50)-(40,54)) "rand",Bop (Just (40,56)-(40,67)) Minus (Var (Just (40,57)-(40,62)) "depth") (Lit (Just (40,65)-(40,66)) (LI 1))]]),Ite (Just (41,10)-(41,70)) (Bop (Just (41,14)-(41,23)) Eq (Var (Just (41,14)-(41,19)) "depth") (Lit (Just (41,22)-(41,23)) (LI 0))) (App (Just (41,29)-(41,38)) (Var (Just (41,29)-(41,35)) "buildY") [ConApp (Just (41,36)-(41,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (41,44)-(41,69)) (Var (Just (41,44)-(41,49)) "build") [Tuple (Just (41,50)-(41,69)) [Var (Just (41,51)-(41,55)) "rand",Bop (Just (41,57)-(41,68)) Minus (Var (Just (41,58)-(41,63)) "depth") (Lit (Just (41,66)-(41,67)) (LI 1))]])]]),(LitPat (Just (42,4)-(42,5)) (LI 7),Nothing,App (Just (43,6)-(47,71)) (Var (Just (43,6)-(43,17)) "buildThresh") [Tuple (Just (44,8)-(47,71)) [Ite (Just (44,9)-(44,69)) (Bop (Just (44,13)-(44,22)) Eq (Var (Just (44,13)-(44,18)) "depth") (Lit (Just (44,21)-(44,22)) (LI 0))) (App (Just (44,28)-(44,37)) (Var (Just (44,28)-(44,34)) "buildX") [ConApp (Just (44,35)-(44,37)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (44,43)-(44,68)) (Var (Just (44,43)-(44,48)) "build") [Tuple (Just (44,49)-(44,68)) [Var (Just (44,50)-(44,54)) "rand",Bop (Just (44,56)-(44,67)) Minus (Var (Just (44,57)-(44,62)) "depth") (Lit (Just (44,65)-(44,66)) (LI 1))]]),Ite (Just (45,10)-(45,70)) (Bop (Just (45,14)-(45,23)) Eq (Var (Just (45,14)-(45,19)) "depth") (Lit (Just (45,22)-(45,23)) (LI 0))) (App (Just (45,29)-(45,38)) (Var (Just (45,29)-(45,35)) "buildY") [ConApp (Just (45,36)-(45,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (45,44)-(45,69)) (Var (Just (45,44)-(45,49)) "build") [Tuple (Just (45,50)-(45,69)) [Var (Just (45,51)-(45,55)) "rand",Bop (Just (45,57)-(45,68)) Minus (Var (Just (45,58)-(45,63)) "depth") (Lit (Just (45,66)-(45,67)) (LI 1))]]),Ite (Just (46,10)-(46,70)) (Bop (Just (46,14)-(46,23)) Eq (Var (Just (46,14)-(46,19)) "depth") (Lit (Just (46,22)-(46,23)) (LI 0))) (App (Just (46,29)-(46,38)) (Var (Just (46,29)-(46,35)) "buildX") [ConApp (Just (46,36)-(46,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (46,44)-(46,69)) (Var (Just (46,44)-(46,49)) "build") [Tuple (Just (46,50)-(46,69)) [Var (Just (46,51)-(46,55)) "rand",Bop (Just (46,57)-(46,68)) Minus (Var (Just (46,58)-(46,63)) "depth") (Lit (Just (46,66)-(46,67)) (LI 1))]]),Ite (Just (47,10)-(47,70)) (Bop (Just (47,14)-(47,23)) Eq (Var (Just (47,14)-(47,19)) "depth") (Lit (Just (47,22)-(47,23)) (LI 0))) (App (Just (47,29)-(47,38)) (Var (Just (47,29)-(47,35)) "buildY") [ConApp (Just (47,36)-(47,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (47,44)-(47,69)) (Var (Just (47,44)-(47,49)) "build") [Tuple (Just (47,50)-(47,69)) [Var (Just (47,51)-(47,55)) "rand",Bop (Just (47,57)-(47,68)) Minus (Var (Just (47,58)-(47,63)) "depth") (Lit (Just (47,66)-(47,67)) (LI 1))]])]])]
*)

(* typed spans
(26,2)-(47,71)
*)

(* correct types
expr
*)

(* bad types
int
*)
