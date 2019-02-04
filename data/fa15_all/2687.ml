
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
  | Sine i -> "sin" ^ (exprToString i)
  | Cosine i -> "cos" ^ (exprToString i)
  | Average (i1,i2) -> ((exprToString i1) + (exprToString i2)) / 2;;


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
  | Sine i -> "sin" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Cosine i -> "cos" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ ((exprToString i2) ^ ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ (" * " ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (" : " ^ ((exprToString i3) ^ ")")))))));;

*)

(* changed spans
(12,2)-(17,66)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine i -> "sin" ^ ("(pi*" ^ (exprToString i ^ ")"))
| Cosine i -> "cos" ^ ("(pi*" ^ (exprToString i ^ ")"))
| Average (i1 , i2) -> "((" ^ (exprToString i1 ^ (" + " ^ (exprToString i2 ^ ")/2)")))
| Times (i1 , i2) -> exprToString i1 ^ (" * " ^ exprToString i2)
| Thresh (i1 , i2 , i3 , i4) -> "(" ^ (exprToString i1 ^ ("<" ^ (exprToString i2 ^ (" ? " ^ (exprToString i3 ^ (" : " ^ (exprToString i3 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(15,22)-(15,38)
"(pi*" ^ (exprToString i ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,16)-(16,40)
")"
LitG

(16,24)-(16,40)
"(pi*" ^ (exprToString i ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,23)-(17,62)
")"
LitG

(17,23)-(17,66)
EMPTY
EmptyG

(17,24)-(17,41)
"((" ^ (exprToString i1 ^ (" + " ^ (exprToString i2 ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,44)-(17,61)
" + " ^ (exprToString i2 ^ ")/2)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,65)-(17,66)
")/2)"
LitG

*)
