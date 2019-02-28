
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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> let a = buildThresh (a, b, c, d) in exprToString a
  | Times (a,b) -> exprToString buildTimes (a, b)
  | Average (a,b) -> exprToString buildAverage (a, b)
  | Cosine a -> exprToString buildCosine a
  | Sine a -> exprToString buildSine a
  | VarY  -> exprToString buildY
  | VarX  -> exprToString buildX;;


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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> let e' = buildThresh (a, b, c, d) in exprToString e'
  | Times (a,b) -> let e' = buildTimes (a, b) in exprToString e'
  | Average (a,b) -> let e' = buildAverage (a, b) in exprToString e'
  | Cosine a -> let e' = buildCosine a in exprToString e'
  | Sine a -> let e' = buildSine a in exprToString e'
  | VarY  -> exprToString VarX
  | VarX  -> exprToString VarY;;

*)

(* changed spans
(27,24)-(27,74)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(28,19)-(28,31)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(29,21)-(29,53)
exprToString e'
AppG (fromList [VarG])

(29,21)-(29,33)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(30,16)-(30,42)
exprToString e'
AppG (fromList [VarG])

(30,16)-(30,28)
let e' = buildCosine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(31,14)-(31,38)
exprToString e'
AppG (fromList [VarG])

(31,14)-(31,26)
let e' = buildSine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(32,26)-(32,32)
e'
VarG

(33,26)-(33,32)
VarX
ConAppG Nothing

(33,26)-(33,32)
exprToString VarY
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Let (Just (23,24)-(23,76)) NonRec [(VarPat (Just (23,28)-(23,30)) "e'",App (Just (23,33)-(23,57)) (Var (Just (23,33)-(23,44)) "buildThresh") [Tuple (Just (23,45)-(23,57)) [Var (Just (23,46)-(23,47)) "a",Var (Just (23,49)-(23,50)) "b",Var (Just (23,52)-(23,53)) "c",Var (Just (23,55)-(23,56)) "d"]])] (App (Just (23,61)-(23,76)) (Var (Just (23,61)-(23,73)) "exprToString") [Var (Just (23,74)-(23,76)) "e'"])
Let (Just (24,19)-(24,64)) NonRec [(VarPat (Just (24,23)-(24,25)) "e'",App (Just (24,28)-(24,45)) (Var (Just (24,28)-(24,38)) "buildTimes") [Tuple (Just (24,39)-(24,45)) [Var (Just (24,40)-(24,41)) "a",Var (Just (24,43)-(24,44)) "b"]])] (App (Just (24,49)-(24,64)) (Var (Just (24,49)-(24,61)) "exprToString") [Var (Just (24,62)-(24,64)) "e'"])
App (Just (24,49)-(24,64)) (Var (Just (24,49)-(24,61)) "exprToString") [Var (Just (24,62)-(24,64)) "e'"]
Let (Just (25,21)-(25,68)) NonRec [(VarPat (Just (25,25)-(25,27)) "e'",App (Just (25,30)-(25,49)) (Var (Just (25,30)-(25,42)) "buildAverage") [Tuple (Just (25,43)-(25,49)) [Var (Just (25,44)-(25,45)) "a",Var (Just (25,47)-(25,48)) "b"]])] (App (Just (25,53)-(25,68)) (Var (Just (25,53)-(25,65)) "exprToString") [Var (Just (25,66)-(25,68)) "e'"])
App (Just (25,53)-(25,68)) (Var (Just (25,53)-(25,65)) "exprToString") [Var (Just (25,66)-(25,68)) "e'"]
Let (Just (26,16)-(26,57)) NonRec [(VarPat (Just (26,20)-(26,22)) "e'",App (Just (26,25)-(26,38)) (Var (Just (26,25)-(26,36)) "buildCosine") [Var (Just (26,37)-(26,38)) "a"])] (App (Just (26,42)-(26,57)) (Var (Just (26,42)-(26,54)) "exprToString") [Var (Just (26,55)-(26,57)) "e'"])
App (Just (26,42)-(26,57)) (Var (Just (26,42)-(26,54)) "exprToString") [Var (Just (26,55)-(26,57)) "e'"]
Let (Just (27,14)-(27,53)) NonRec [(VarPat (Just (27,18)-(27,20)) "e'",App (Just (27,23)-(27,34)) (Var (Just (27,23)-(27,32)) "buildSine") [Var (Just (27,33)-(27,34)) "a"])] (App (Just (27,38)-(27,53)) (Var (Just (27,38)-(27,50)) "exprToString") [Var (Just (27,51)-(27,53)) "e'"])
Var (Just (27,51)-(27,53)) "e'"
ConApp (Just (28,26)-(28,30)) "VarX" Nothing Nothing
App (Just (29,13)-(29,30)) (Var (Just (29,13)-(29,25)) "exprToString") [ConApp (Just (29,26)-(29,30)) "VarY" Nothing Nothing]
*)

(* typed spans
(23,24)-(23,76)
(24,19)-(24,64)
(24,49)-(24,64)
(25,21)-(25,68)
(25,53)-(25,68)
(26,16)-(26,57)
(26,42)-(26,57)
(27,14)-(27,53)
(27,51)-(27,53)
(28,26)-(28,30)
(29,13)-(29,30)
*)

(* correct types
'a
'a
'a
'a
'a
'a
'a
'a
expr
expr
'a
*)

(* bad types
'a
expr -> 'a
'a
expr -> 'a
'a
expr -> 'a
'a
expr -> 'a
unit -> expr
unit -> expr
unit -> expr
*)
