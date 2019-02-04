
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | [] -> []
  | h::e' ->
      (match h with
       | VarX  -> "x" ^ (exprToString e')
       | VarY  -> "y" ^ (exprToString e')
       | Sine  -> "sin(pi*" ^ ((exprToString e') ^ ")")
       | Cosine  -> "cos(pi*" ^ ((exprToString e') ^ ")")
       | Average  ->
           let (e1,e2) = h in
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times  ->
           let (e1,e2) = h in
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh  ->
           let (e1,e2,e3,e4) = h in
           "(" ^
             ((exprToString e1) ^
                ("<" ^
                   ((exprToString e2) ^
                      ("?" ^
                         ((exprToString e3) ^
                            (":" ^
                               ((exprToString e4) ^ (")" ^ (exprToString e'))))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(38,85)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(13,10)-(13,12)
EMPTY
EmptyG

(15,6)-(38,85)
EMPTY
EmptyG

(15,13)-(15,14)
EMPTY
EmptyG

(16,18)-(16,41)
EMPTY
EmptyG

(16,22)-(16,23)
EMPTY
EmptyG

(16,24)-(16,41)
EMPTY
EmptyG

(16,25)-(16,37)
EMPTY
EmptyG

(16,38)-(16,40)
EMPTY
EmptyG

(17,18)-(17,41)
EMPTY
EmptyG

(17,22)-(17,23)
EMPTY
EmptyG

(17,24)-(17,41)
EMPTY
EmptyG

(17,25)-(17,37)
EMPTY
EmptyG

(17,38)-(17,40)
EMPTY
EmptyG

(18,45)-(18,47)
e1
VarG

(19,47)-(19,49)
e1
VarG

(21,11)-(24,75)
EMPTY
EmptyG

(21,25)-(21,26)
EMPTY
EmptyG

(24,44)-(24,72)
EMPTY
EmptyG

(24,52)-(24,53)
EMPTY
EmptyG

(24,54)-(24,71)
EMPTY
EmptyG

(24,55)-(24,67)
EMPTY
EmptyG

(24,68)-(24,70)
EMPTY
EmptyG

(26,11)-(28,60)
EMPTY
EmptyG

(26,25)-(26,26)
EMPTY
EmptyG

(28,20)-(28,59)
EMPTY
EmptyG

(28,39)-(28,40)
EMPTY
EmptyG

(28,41)-(28,58)
EMPTY
EmptyG

(28,42)-(28,54)
EMPTY
EmptyG

(28,55)-(28,57)
EMPTY
EmptyG

(30,11)-(38,84)
EMPTY
EmptyG

(30,31)-(30,32)
EMPTY
EmptyG

(38,52)-(38,77)
EMPTY
EmptyG

(38,57)-(38,58)
EMPTY
EmptyG

(38,59)-(38,76)
EMPTY
EmptyG

(38,60)-(38,72)
EMPTY
EmptyG

(38,73)-(38,75)
EMPTY
EmptyG

*)
