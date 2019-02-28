
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;


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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n > 0) && ((x mod 5) = 0) ->
      buildSine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 1) ->
      buildCosine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 2) ->
      buildAverage ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 3) ->
      buildTimes ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 4) ->
      buildThresh
        ((build (rand, (n - 1))), (build (rand, (n - 1))),
          (build (rand, (n - 1))), (build (rand, (n - 1))));;

*)

(* changed spans
(11,16)-(11,28)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(15,11)-(15,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(15,11)-(15,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(20,2)-(24,64)
match (rand (243 , 98723) , depth) with
| (x , 0) when (x mod 2) = 0 -> buildY ()
| (x , 0) when (x mod 2) = 1 -> buildX ()
| (x , n) when (n > 0) && ((x mod 5) = 0) -> buildSine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 1) -> buildCosine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 2) -> buildAverage (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 3) -> buildTimes (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 4) -> buildThresh (build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1))
CaseG (TupleG (fromList [EmptyG])) (fromList [(Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (11,18)-(11,43)) (TuplePat (Just (11,18)-(11,23)) [VarPat (Just (11,18)-(11,20)) "e1",VarPat (Just (11,21)-(11,23)) "e2"]) (ConApp (Just (11,27)-(11,43)) "Average" (Just (Tuple (Just (11,35)-(11,43)) [Var (Just (11,36)-(11,38)) "e1",Var (Just (11,40)-(11,42)) "e2"])) Nothing) Nothing
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lam (Just (19,16)-(19,39)) (TuplePat (Just (19,16)-(19,21)) [VarPat (Just (19,16)-(19,18)) "e1",VarPat (Just (19,19)-(19,21)) "e2"]) (ConApp (Just (19,25)-(19,39)) "Times" (Just (Tuple (Just (19,31)-(19,39)) [Var (Just (19,32)-(19,34)) "e1",Var (Just (19,36)-(19,38)) "e2"])) Nothing) Nothing
Case (Just (26,2)-(40,59)) (Tuple (Just (26,8)-(26,36)) [App (Just (26,9)-(26,28)) (Var (Just (26,10)-(26,14)) "rand") [Tuple (Just (26,15)-(26,27)) [Lit (Just (26,16)-(26,19)) (LI 243),Lit (Just (26,21)-(26,26)) (LI 98723)]],Var (Just (26,30)-(26,35)) "depth"]) [(TuplePat (Just (27,5)-(27,8)) [VarPat (Just (27,5)-(27,6)) "x",LitPat (Just (27,7)-(27,8)) (LI 0)],Just (Bop (Just (27,15)-(27,28)) Eq (Bop (Just (27,15)-(27,24)) Mod (Var (Just (27,16)-(27,17)) "x") (Lit (Just (27,22)-(27,23)) (LI 2))) (Lit (Just (27,27)-(27,28)) (LI 0))),App (Just (27,32)-(27,41)) (Var (Just (27,32)-(27,38)) "buildY") [ConApp (Just (27,39)-(27,41)) "()" Nothing (Just (TApp "unit" []))]),(TuplePat (Just (28,5)-(28,8)) [VarPat (Just (28,5)-(28,6)) "x",LitPat (Just (28,7)-(28,8)) (LI 0)],Just (Bop (Just (28,15)-(28,28)) Eq (Bop (Just (28,15)-(28,24)) Mod (Var (Just (28,16)-(28,17)) "x") (Lit (Just (28,22)-(28,23)) (LI 2))) (Lit (Just (28,27)-(28,28)) (LI 1))),App (Just (28,32)-(28,41)) (Var (Just (28,32)-(28,38)) "buildX") [ConApp (Just (28,39)-(28,41)) "()" Nothing (Just (TApp "unit" []))]),(TuplePat (Just (29,5)-(29,8)) [VarPat (Just (29,5)-(29,6)) "x",VarPat (Just (29,7)-(29,8)) "n"],Just (Bop (Just (29,15)-(29,41)) And (Bop (Just (29,15)-(29,22)) Gt (Var (Just (29,16)-(29,17)) "n") (Lit (Just (29,20)-(29,21)) (LI 0))) (Bop (Just (29,26)-(29,41)) Eq (Bop (Just (29,27)-(29,36)) Mod (Var (Just (29,28)-(29,29)) "x") (Lit (Just (29,34)-(29,35)) (LI 5))) (Lit (Just (29,39)-(29,40)) (LI 0)))),App (Just (30,6)-(30,39)) (Var (Just (30,6)-(30,15)) "buildSine") [App (Just (30,16)-(30,39)) (Var (Just (30,17)-(30,22)) "build") [Tuple (Just (30,23)-(30,38)) [Var (Just (30,24)-(30,28)) "rand",Bop (Just (30,30)-(30,37)) Minus (Var (Just (30,31)-(30,32)) "n") (Lit (Just (30,35)-(30,36)) (LI 1))]]]),(TuplePat (Just (31,5)-(31,8)) [VarPat (Just (31,5)-(31,6)) "x",VarPat (Just (31,7)-(31,8)) "n"],Just (Bop (Just (31,15)-(31,41)) And (Bop (Just (31,15)-(31,22)) Gt (Var (Just (31,16)-(31,17)) "n") (Lit (Just (31,20)-(31,21)) (LI 0))) (Bop (Just (31,26)-(31,41)) Eq (Bop (Just (31,27)-(31,36)) Mod (Var (Just (31,28)-(31,29)) "x") (Lit (Just (31,34)-(31,35)) (LI 5))) (Lit (Just (31,39)-(31,40)) (LI 1)))),App (Just (32,6)-(32,41)) (Var (Just (32,6)-(32,17)) "buildCosine") [App (Just (32,18)-(32,41)) (Var (Just (32,19)-(32,24)) "build") [Tuple (Just (32,25)-(32,40)) [Var (Just (32,26)-(32,30)) "rand",Bop (Just (32,32)-(32,39)) Minus (Var (Just (32,33)-(32,34)) "n") (Lit (Just (32,37)-(32,38)) (LI 1))]]]),(TuplePat (Just (33,5)-(33,8)) [VarPat (Just (33,5)-(33,6)) "x",VarPat (Just (33,7)-(33,8)) "n"],Just (Bop (Just (33,15)-(33,41)) And (Bop (Just (33,15)-(33,22)) Gt (Var (Just (33,16)-(33,17)) "n") (Lit (Just (33,20)-(33,21)) (LI 0))) (Bop (Just (33,26)-(33,41)) Eq (Bop (Just (33,27)-(33,36)) Mod (Var (Just (33,28)-(33,29)) "x") (Lit (Just (33,34)-(33,35)) (LI 5))) (Lit (Just (33,39)-(33,40)) (LI 2)))),App (Just (34,6)-(34,69)) (Var (Just (34,6)-(34,18)) "buildAverage") [Tuple (Just (34,19)-(34,69)) [App (Just (34,20)-(34,43)) (Var (Just (34,21)-(34,26)) "build") [Tuple (Just (34,27)-(34,42)) [Var (Just (34,28)-(34,32)) "rand",Bop (Just (34,34)-(34,41)) Minus (Var (Just (34,35)-(34,36)) "n") (Lit (Just (34,39)-(34,40)) (LI 1))]],App (Just (34,45)-(34,68)) (Var (Just (34,46)-(34,51)) "build") [Tuple (Just (34,52)-(34,67)) [Var (Just (34,53)-(34,57)) "rand",Bop (Just (34,59)-(34,66)) Minus (Var (Just (34,60)-(34,61)) "n") (Lit (Just (34,64)-(34,65)) (LI 1))]]]]),(TuplePat (Just (35,5)-(35,8)) [VarPat (Just (35,5)-(35,6)) "x",VarPat (Just (35,7)-(35,8)) "n"],Just (Bop (Just (35,15)-(35,41)) And (Bop (Just (35,15)-(35,22)) Gt (Var (Just (35,16)-(35,17)) "n") (Lit (Just (35,20)-(35,21)) (LI 0))) (Bop (Just (35,26)-(35,41)) Eq (Bop (Just (35,27)-(35,36)) Mod (Var (Just (35,28)-(35,29)) "x") (Lit (Just (35,34)-(35,35)) (LI 5))) (Lit (Just (35,39)-(35,40)) (LI 3)))),App (Just (36,6)-(36,67)) (Var (Just (36,6)-(36,16)) "buildTimes") [Tuple (Just (36,17)-(36,67)) [App (Just (36,18)-(36,41)) (Var (Just (36,19)-(36,24)) "build") [Tuple (Just (36,25)-(36,40)) [Var (Just (36,26)-(36,30)) "rand",Bop (Just (36,32)-(36,39)) Minus (Var (Just (36,33)-(36,34)) "n") (Lit (Just (36,37)-(36,38)) (LI 1))]],App (Just (36,43)-(36,66)) (Var (Just (36,44)-(36,49)) "build") [Tuple (Just (36,50)-(36,65)) [Var (Just (36,51)-(36,55)) "rand",Bop (Just (36,57)-(36,64)) Minus (Var (Just (36,58)-(36,59)) "n") (Lit (Just (36,62)-(36,63)) (LI 1))]]]]),(TuplePat (Just (37,5)-(37,8)) [VarPat (Just (37,5)-(37,6)) "x",VarPat (Just (37,7)-(37,8)) "n"],Just (Bop (Just (37,15)-(37,41)) And (Bop (Just (37,15)-(37,22)) Gt (Var (Just (37,16)-(37,17)) "n") (Lit (Just (37,20)-(37,21)) (LI 0))) (Bop (Just (37,26)-(37,41)) Eq (Bop (Just (37,27)-(37,36)) Mod (Var (Just (37,28)-(37,29)) "x") (Lit (Just (37,34)-(37,35)) (LI 5))) (Lit (Just (37,39)-(37,40)) (LI 4)))),App (Just (38,6)-(40,59)) (Var (Just (38,6)-(38,17)) "buildThresh") [Tuple (Just (39,8)-(40,59)) [App (Just (39,9)-(39,32)) (Var (Just (39,10)-(39,15)) "build") [Tuple (Just (39,16)-(39,31)) [Var (Just (39,17)-(39,21)) "rand",Bop (Just (39,23)-(39,30)) Minus (Var (Just (39,24)-(39,25)) "n") (Lit (Just (39,28)-(39,29)) (LI 1))]],App (Just (39,34)-(39,57)) (Var (Just (39,35)-(39,40)) "build") [Tuple (Just (39,41)-(39,56)) [Var (Just (39,42)-(39,46)) "rand",Bop (Just (39,48)-(39,55)) Minus (Var (Just (39,49)-(39,50)) "n") (Lit (Just (39,53)-(39,54)) (LI 1))]],App (Just (40,10)-(40,33)) (Var (Just (40,11)-(40,16)) "build") [Tuple (Just (40,17)-(40,32)) [Var (Just (40,18)-(40,22)) "rand",Bop (Just (40,24)-(40,31)) Minus (Var (Just (40,25)-(40,26)) "n") (Lit (Just (40,29)-(40,30)) (LI 1))]],App (Just (40,35)-(40,58)) (Var (Just (40,36)-(40,41)) "build") [Tuple (Just (40,42)-(40,57)) [Var (Just (40,43)-(40,47)) "rand",Bop (Just (40,49)-(40,56)) Minus (Var (Just (40,50)-(40,51)) "n") (Lit (Just (40,54)-(40,55)) (LI 1))]]]])]
*)

(* typed spans
(11,18)-(11,43)
(17,17)-(17,67)
(19,16)-(19,39)
(26,2)-(40,59)
*)

(* correct types
(expr * expr) -> expr
(expr * expr * expr * expr) -> expr
(expr * expr) -> expr
expr
*)

(* bad types
expr -> expr
unit -> expr
unit -> expr
expr
*)
