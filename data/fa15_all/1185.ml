
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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ (exprToString d ")" "/2)")))
  | Times (e,f) -> exprToString e "*" exprToString f
  | Thresh (g,h,i,j) ->
      "(" exprToString g "<" exprToString h "?" exprToString i ":"
        exprToString j ")";;


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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ ((exprToString d) ^ ")/2)")))
  | Times (e,f) -> (exprToString e) ^ ("*" ^ (exprToString f))
  | Thresh (g,h,i,j) ->
      "(" ^
        ((exprToString g) ^
           ("<" ^
              ((exprToString h) ^
                 ("?" ^ ((exprToString i) ^ (":" ^ ((exprToString j) ^ ")")))))));;

*)

(* changed spans
(18,40)-(18,66)
exprToString d ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,41)-(18,53)
exprToString d
AppG (fromList [VarG])

(18,56)-(18,59)
EMPTY
EmptyG

(18,60)-(18,65)
EMPTY
EmptyG

(19,19)-(19,31)
exprToString e ^ ("*" ^ exprToString f)
AppG (fromList [AppG (fromList [EmptyG])])

(19,19)-(19,52)
")/2)"
LitG

(19,34)-(19,37)
"*" ^ exprToString f
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,38)-(19,50)
exprToString f
AppG (fromList [VarG])

(21,6)-(21,9)
(^)
VarG

(21,6)-(22,26)
"(" ^ (exprToString g ^ ("<" ^ (exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,10)-(21,22)
exprToString g ^ ("<" ^ (exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")"))))))
AppG (fromList [AppG (fromList [EmptyG])])

(21,25)-(21,28)
"<" ^ (exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")")))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,29)-(21,41)
exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")"))))
AppG (fromList [AppG (fromList [EmptyG])])

(21,44)-(21,47)
"?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(21,48)-(21,60)
exprToString i ^ (":" ^ (exprToString j ^ ")"))
AppG (fromList [AppG (fromList [EmptyG])])

(21,63)-(21,66)
":" ^ (exprToString j ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(22,8)-(22,20)
exprToString j ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
