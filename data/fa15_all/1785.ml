
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
       | Sine e1 ->
           "sin(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Cosine e1 ->
           "cos(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Average (e1,e2) ->
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times (e1,e2) ->
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh (e1,e2,e3,e4) ->
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
(12,2)-(37,85)
EMPTY
EmptyG

(12,8)-(12,9)
EMPTY
EmptyG

(13,10)-(13,12)
EMPTY
EmptyG

(15,13)-(15,14)
EMPTY
EmptyG

(16,18)-(16,41)
EMPTY
EmptyG

(16,22)-(16,23)
e
VarG

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

(19,44)-(19,69)
EMPTY
EmptyG

(19,49)-(19,50)
EMPTY
EmptyG

(19,51)-(19,68)
EMPTY
EmptyG

(19,52)-(19,64)
EMPTY
EmptyG

(19,65)-(19,67)
EMPTY
EmptyG

(21,44)-(21,69)
EMPTY
EmptyG

(21,49)-(21,50)
EMPTY
EmptyG

(21,51)-(21,68)
EMPTY
EmptyG

(21,52)-(21,64)
EMPTY
EmptyG

(21,65)-(21,67)
EMPTY
EmptyG

(25,44)-(25,72)
EMPTY
EmptyG

(25,52)-(25,53)
EMPTY
EmptyG

(25,54)-(25,71)
EMPTY
EmptyG

(25,55)-(25,67)
EMPTY
EmptyG

(25,68)-(25,70)
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

(37,52)-(37,77)
EMPTY
EmptyG

(37,57)-(37,58)
EMPTY
EmptyG

(37,59)-(37,76)
EMPTY
EmptyG

(37,60)-(37,72)
EMPTY
EmptyG

(37,73)-(37,75)
EMPTY
EmptyG

*)
