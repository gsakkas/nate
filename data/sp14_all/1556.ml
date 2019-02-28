
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
  match rand depth with
  | (1,d) -> (d = (d - 1)) && (buildX ())
  | (2,d) -> (d = (d - 1)) && (buildY ());;


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
  match (rand, depth) with
  | (r,0) -> if (r (0, 1)) = 0 then buildX () else buildY ()
  | (r,depth) ->
      let r = rand (0, 7) in
      (match r with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (rand, (depth - 1)))
       | 3 -> buildCosine (build (rand, (depth - 1)))
       | 4 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(11,11)-(11,20)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(11,11)-(11,20)
fun e -> Cosine e
LamG (ConAppG (Just VarG))

(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(11,11)-(11,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(11,11)-(11,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(16,2)-(18,41)
match (rand , depth) with
| (r , 0) -> if r (0 , 1) = 0
             then buildX ()
             else buildY ()
| (r , depth) -> (let r =
                    rand (0 , 7) in
                  match r with
                  | 0 -> buildX ()
                  | 1 -> buildY ()
                  | 2 -> buildSine (build (rand , depth - 1))
                  | 3 -> buildCosine (build (rand , depth - 1))
                  | 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
                  | 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
                  | _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Lam (Just (11,18)-(11,43)) (TuplePat (Just (11,18)-(11,23)) [VarPat (Just (11,18)-(11,20)) "e1",VarPat (Just (11,21)-(11,23)) "e2"]) (ConApp (Just (11,27)-(11,43)) "Average" (Just (Tuple (Just (11,35)-(11,43)) [Var (Just (11,36)-(11,38)) "e1",Var (Just (11,40)-(11,42)) "e2"])) Nothing) Nothing
Lam (Just (13,16)-(13,28)) (VarPat (Just (13,16)-(13,17)) "e") (ConApp (Just (13,20)-(13,28)) "Cosine" (Just (Var (Just (13,27)-(13,28)) "e")) Nothing) Nothing
Lam (Just (15,14)-(15,24)) (VarPat (Just (15,14)-(15,15)) "e") (ConApp (Just (15,18)-(15,24)) "Sine" (Just (Var (Just (15,23)-(15,24)) "e")) Nothing) Nothing
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lam (Just (19,16)-(19,39)) (TuplePat (Just (19,16)-(19,21)) [VarPat (Just (19,16)-(19,18)) "e1",VarPat (Just (19,19)-(19,21)) "e2"]) (ConApp (Just (19,25)-(19,39)) "Times" (Just (Tuple (Just (19,31)-(19,39)) [Var (Just (19,32)-(19,34)) "e1",Var (Just (19,36)-(19,38)) "e2"])) Nothing) Nothing
Case (Just (26,2)-(44,73)) (Tuple (Just (26,8)-(26,21)) [Var (Just (26,9)-(26,13)) "rand",Var (Just (26,15)-(26,20)) "depth"]) [(TuplePat (Just (27,5)-(27,8)) [VarPat (Just (27,5)-(27,6)) "r",LitPat (Just (27,7)-(27,8)) (LI 0)],Nothing,Ite (Just (27,13)-(27,60)) (Bop (Just (27,16)-(27,30)) Eq (App (Just (27,16)-(27,26)) (Var (Just (27,17)-(27,18)) "r") [Tuple (Just (27,19)-(27,25)) [Lit (Just (27,20)-(27,21)) (LI 0),Lit (Just (27,23)-(27,24)) (LI 1)]]) (Lit (Just (27,29)-(27,30)) (LI 0))) (App (Just (27,36)-(27,45)) (Var (Just (27,36)-(27,42)) "buildX") [ConApp (Just (27,43)-(27,45)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (27,51)-(27,60)) (Var (Just (27,51)-(27,57)) "buildY") [ConApp (Just (27,58)-(27,60)) "()" Nothing (Just (TApp "unit" []))])),(TuplePat (Just (28,5)-(28,12)) [VarPat (Just (28,5)-(28,6)) "r",VarPat (Just (28,7)-(28,12)) "depth"],Nothing,Let (Just (29,6)-(44,73)) NonRec [(VarPat (Just (29,10)-(29,11)) "r",App (Just (29,14)-(29,25)) (Var (Just (29,14)-(29,18)) "rand") [Tuple (Just (29,19)-(29,25)) [Lit (Just (29,20)-(29,21)) (LI 0),Lit (Just (29,23)-(29,24)) (LI 7)]])] (Case (Just (30,6)-(44,73)) (Var (Just (30,13)-(30,14)) "r") [(LitPat (Just (31,9)-(31,10)) (LI 0),Nothing,App (Just (31,14)-(31,23)) (Var (Just (31,14)-(31,20)) "buildX") [ConApp (Just (31,21)-(31,23)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (32,9)-(32,10)) (LI 1),Nothing,App (Just (32,14)-(32,23)) (Var (Just (32,14)-(32,20)) "buildY") [ConApp (Just (32,21)-(32,23)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (33,9)-(33,10)) (LI 2),Nothing,App (Just (33,14)-(33,51)) (Var (Just (33,14)-(33,23)) "buildSine") [App (Just (33,24)-(33,51)) (Var (Just (33,25)-(33,30)) "build") [Tuple (Just (33,31)-(33,50)) [Var (Just (33,32)-(33,36)) "rand",Bop (Just (33,38)-(33,49)) Minus (Var (Just (33,39)-(33,44)) "depth") (Lit (Just (33,47)-(33,48)) (LI 1))]]]),(LitPat (Just (34,9)-(34,10)) (LI 3),Nothing,App (Just (34,14)-(34,53)) (Var (Just (34,14)-(34,25)) "buildCosine") [App (Just (34,26)-(34,53)) (Var (Just (34,27)-(34,32)) "build") [Tuple (Just (34,33)-(34,52)) [Var (Just (34,34)-(34,38)) "rand",Bop (Just (34,40)-(34,51)) Minus (Var (Just (34,41)-(34,46)) "depth") (Lit (Just (34,49)-(34,50)) (LI 1))]]]),(LitPat (Just (35,9)-(35,10)) (LI 4),Nothing,App (Just (36,11)-(37,71)) (Var (Just (36,11)-(36,23)) "buildAverage") [Tuple (Just (37,13)-(37,71)) [App (Just (37,14)-(37,41)) (Var (Just (37,15)-(37,20)) "build") [Tuple (Just (37,21)-(37,40)) [Var (Just (37,22)-(37,26)) "rand",Bop (Just (37,28)-(37,39)) Minus (Var (Just (37,29)-(37,34)) "depth") (Lit (Just (37,37)-(37,38)) (LI 1))]],App (Just (37,43)-(37,70)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]]]]),(LitPat (Just (38,9)-(38,10)) (LI 5),Nothing,App (Just (39,11)-(40,71)) (Var (Just (39,11)-(39,21)) "buildTimes") [Tuple (Just (40,13)-(40,71)) [App (Just (40,14)-(40,41)) (Var (Just (40,15)-(40,20)) "build") [Tuple (Just (40,21)-(40,40)) [Var (Just (40,22)-(40,26)) "rand",Bop (Just (40,28)-(40,39)) Minus (Var (Just (40,29)-(40,34)) "depth") (Lit (Just (40,37)-(40,38)) (LI 1))]],App (Just (40,43)-(40,70)) (Var (Just (40,44)-(40,49)) "build") [Tuple (Just (40,50)-(40,69)) [Var (Just (40,51)-(40,55)) "rand",Bop (Just (40,57)-(40,68)) Minus (Var (Just (40,58)-(40,63)) "depth") (Lit (Just (40,66)-(40,67)) (LI 1))]]]]),(WildPat (Just (41,9)-(41,10)),Nothing,App (Just (42,11)-(44,72)) (Var (Just (42,11)-(42,22)) "buildThresh") [Tuple (Just (43,13)-(44,72)) [App (Just (43,14)-(43,41)) (Var (Just (43,15)-(43,20)) "build") [Tuple (Just (43,21)-(43,40)) [Var (Just (43,22)-(43,26)) "rand",Bop (Just (43,28)-(43,39)) Minus (Var (Just (43,29)-(43,34)) "depth") (Lit (Just (43,37)-(43,38)) (LI 1))]],App (Just (43,43)-(43,70)) (Var (Just (43,44)-(43,49)) "build") [Tuple (Just (43,50)-(43,69)) [Var (Just (43,51)-(43,55)) "rand",Bop (Just (43,57)-(43,68)) Minus (Var (Just (43,58)-(43,63)) "depth") (Lit (Just (43,66)-(43,67)) (LI 1))]],App (Just (44,15)-(44,42)) (Var (Just (44,16)-(44,21)) "build") [Tuple (Just (44,22)-(44,41)) [Var (Just (44,23)-(44,27)) "rand",Bop (Just (44,29)-(44,40)) Minus (Var (Just (44,30)-(44,35)) "depth") (Lit (Just (44,38)-(44,39)) (LI 1))]],App (Just (44,44)-(44,71)) (Var (Just (44,45)-(44,50)) "build") [Tuple (Just (44,51)-(44,70)) [Var (Just (44,52)-(44,56)) "rand",Bop (Just (44,58)-(44,69)) Minus (Var (Just (44,59)-(44,64)) "depth") (Lit (Just (44,67)-(44,68)) (LI 1))]]]])]))]
*)

(* typed spans
(11,18)-(11,43)
(13,16)-(13,28)
(15,14)-(15,24)
(17,17)-(17,67)
(19,16)-(19,39)
(26,2)-(44,73)
*)

(* correct types
(expr * expr) -> expr
expr -> expr
expr -> expr
(expr * expr * expr * expr) -> expr
(expr * expr) -> expr
expr
*)

(* bad types
unit -> expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
bool
*)
