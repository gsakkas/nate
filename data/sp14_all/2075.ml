
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> ((exprToString Thresh a), b, c, d)
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
(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(19,11)-(19,20)
EMPTY
EmptyG

(19,16)-(19,20)
EMPTY
EmptyG

(21,11)-(21,20)
EMPTY
EmptyG

(21,16)-(21,20)
EMPTY
EmptyG

(25,24)-(25,58)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(25,25)-(25,48)
EMPTY
EmptyG

(25,26)-(25,38)
EMPTY
EmptyG

(25,39)-(25,45)
EMPTY
EmptyG

(26,19)-(26,49)
exprToString e'
AppG (fromList [VarG])

(26,32)-(26,42)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(27,21)-(27,53)
exprToString e'
AppG (fromList [VarG])

(27,34)-(27,46)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(28,16)-(28,42)
exprToString e'
AppG (fromList [VarG])

(28,29)-(28,40)
let e' = buildCosine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(29,14)-(29,38)
exprToString e'
AppG (fromList [VarG])

(29,27)-(29,36)
let e' = buildSine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(30,26)-(30,32)
e'
VarG

(31,26)-(31,32)
VarX
ConAppG Nothing Nothing

*)
