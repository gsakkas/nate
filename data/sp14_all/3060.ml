
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
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      ("(" exprToString var7) ^
        ("<" ^
           ((exprToString var8) ^
              (" ? " ^
                 ((exprToString var9) ^ (" : " ^ ((exprToString var0) ^ ")"))))));;


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
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      "(" ^
        ((exprToString var7) ^
           ("<" ^
              ((exprToString var8) ^
                 (" ? " ^
                    ((exprToString var9) ^
                       (" : " ^ ((exprToString var0) ^ ")")))))));;

*)

(* changed spans
(21,6)-(21,29)
"("
LitG

(21,6)-(21,29)
exprToString var7 ^ ("<" ^ (exprToString var8 ^ (" ? " ^ (exprToString var9 ^ (" : " ^ (exprToString var0 ^ ")"))))))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (21,6)-(21,9)) (LS "(")
App (Just (22,8)-(27,65)) (Var (Just (22,29)-(22,30)) "^") [App (Just (22,9)-(22,28)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,27)) "var7"],App (Just (23,11)-(27,64)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(27,63)) (Var (Just (24,35)-(24,36)) "^") [App (Just (24,15)-(24,34)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,33)) "var8"],App (Just (25,17)-(27,62)) (Var (Just (25,24)-(25,25)) "^") [Lit (Just (25,18)-(25,23)) (LS " ? "),App (Just (26,20)-(27,61)) (Var (Just (26,41)-(26,42)) "^") [App (Just (26,21)-(26,40)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,39)) "var9"],App (Just (27,23)-(27,60)) (Var (Just (27,30)-(27,31)) "^") [Lit (Just (27,24)-(27,29)) (LS " : "),App (Just (27,32)-(27,59)) (Var (Just (27,53)-(27,54)) "^") [App (Just (27,33)-(27,52)) (Var (Just (27,34)-(27,46)) "exprToString") [Var (Just (27,47)-(27,51)) "var0"],Lit (Just (27,55)-(27,58)) (LS ")")]]]]]]]
*)

(* typed spans
(21,6)-(21,9)
(22,8)-(27,65)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
