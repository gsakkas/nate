
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           (("<" exprToString e2) ^
              (" ? " ^
                 ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")"))))));;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(23,12)-(23,33)
(23,17)-(23,29)
*)

(* type error slice
(23,12)-(23,33)
(23,13)-(23,16)
*)

(* all spans
(11,21)-(25,77)
(12,2)-(25,77)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,50)
(15,24)-(15,25)
(15,14)-(15,23)
(15,26)-(15,50)
(15,44)-(15,45)
(15,27)-(15,43)
(15,28)-(15,40)
(15,41)-(15,42)
(15,46)-(15,49)
(16,16)-(16,52)
(16,26)-(16,27)
(16,16)-(16,25)
(16,28)-(16,52)
(16,46)-(16,47)
(16,29)-(16,45)
(16,30)-(16,42)
(16,43)-(16,44)
(16,48)-(16,51)
(18,6)-(18,67)
(18,10)-(18,11)
(18,6)-(18,9)
(18,12)-(18,67)
(18,30)-(18,31)
(18,13)-(18,29)
(18,14)-(18,26)
(18,27)-(18,28)
(18,32)-(18,66)
(18,37)-(18,38)
(18,33)-(18,36)
(18,39)-(18,65)
(18,57)-(18,58)
(18,40)-(18,56)
(18,41)-(18,53)
(18,54)-(18,55)
(18,59)-(18,64)
(19,21)-(19,66)
(19,39)-(19,40)
(19,21)-(19,38)
(19,22)-(19,34)
(19,35)-(19,37)
(19,41)-(19,66)
(19,46)-(19,47)
(19,42)-(19,45)
(19,48)-(19,65)
(19,49)-(19,61)
(19,62)-(19,64)
(21,6)-(25,77)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(25,77)
(22,27)-(22,28)
(22,9)-(22,26)
(22,10)-(22,22)
(22,23)-(22,25)
(23,11)-(25,76)
(23,34)-(23,35)
(23,12)-(23,33)
(23,13)-(23,16)
(23,17)-(23,29)
(23,30)-(23,32)
(24,14)-(25,75)
(24,21)-(24,22)
(24,15)-(24,20)
(25,17)-(25,74)
(25,36)-(25,37)
(25,18)-(25,35)
(25,19)-(25,31)
(25,32)-(25,34)
(25,38)-(25,73)
(25,45)-(25,46)
(25,39)-(25,44)
(25,47)-(25,72)
(25,66)-(25,67)
(25,48)-(25,65)
(25,49)-(25,61)
(25,62)-(25,64)
(25,68)-(25,71)
*)