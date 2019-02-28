
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

let rec exprToString e =
  match e with
  | VarX  -> buildX
  | VarY  -> buildY
  | Sine s -> Sine (exprToString s);;


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
  | VarX  -> Format.sprintf "x"
  | VarY  -> Format.sprintf "y"
  | Sine e' -> (Format.sprintf "sin(pi*") ^ ((exprToString e') ^ ")")
  | Cosine e' -> (Format.sprintf "cos(pi*") ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      (Format.sprintf "((") ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      (Format.sprintf "") ^ ((exprToString e1) ^ ("*" ^ (exprToString e2)))
  | Thresh (a,b,a_less,b_less) ->
      (Format.sprintf "(") ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^
                    ((exprToString a_less) ^
                       (":" ^ ((exprToString b_less) ^ ")")))))));;

*)

(* changed spans
(16,2)-(19,35)
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (12,2)-(29,65)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,App (Just (13,13)-(13,31)) (Var (Just (13,13)-(13,27)) "Format.sprintf") [Lit (Just (13,28)-(13,31)) (LS "x")]),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,App (Just (14,13)-(14,31)) (Var (Just (14,13)-(14,27)) "Format.sprintf") [Lit (Just (14,28)-(14,31)) (LS "y")]),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "e'")),Nothing,App (Just (15,15)-(15,69)) (Var (Just (15,42)-(15,43)) "^") [App (Just (15,15)-(15,41)) (Var (Just (15,16)-(15,30)) "Format.sprintf") [Lit (Just (15,31)-(15,40)) (LS "sin(pi*")],App (Just (15,44)-(15,69)) (Var (Just (15,63)-(15,64)) "^") [App (Just (15,45)-(15,62)) (Var (Just (15,46)-(15,58)) "exprToString") [Var (Just (15,59)-(15,61)) "e'"],Lit (Just (15,65)-(15,68)) (LS ")")]]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "e'")),Nothing,App (Just (16,17)-(16,71)) (Var (Just (16,44)-(16,45)) "^") [App (Just (16,17)-(16,43)) (Var (Just (16,18)-(16,32)) "Format.sprintf") [Lit (Just (16,33)-(16,42)) (LS "cos(pi*")],App (Just (16,46)-(16,71)) (Var (Just (16,65)-(16,66)) "^") [App (Just (16,47)-(16,64)) (Var (Just (16,48)-(16,60)) "exprToString") [Var (Just (16,61)-(16,63)) "e'"],Lit (Just (16,67)-(16,70)) (LS ")")]]),(ConPat (Just (17,4)-(17,18)) "Average" (Just (TuplePat (Just (17,13)-(17,18)) [VarPat (Just (17,13)-(17,15)) "e1",VarPat (Just (17,16)-(17,18)) "e2"])),Nothing,App (Just (18,6)-(19,66)) (Var (Just (18,28)-(18,29)) "^") [App (Just (18,6)-(18,27)) (Var (Just (18,7)-(18,21)) "Format.sprintf") [Lit (Just (18,22)-(18,26)) (LS "((")],App (Just (19,8)-(19,66)) (Var (Just (19,27)-(19,28)) "^") [App (Just (19,9)-(19,26)) (Var (Just (19,10)-(19,22)) "exprToString") [Var (Just (19,23)-(19,25)) "e1"],App (Just (19,29)-(19,65)) (Var (Just (19,34)-(19,35)) "^") [Lit (Just (19,30)-(19,33)) (LS "+"),App (Just (19,36)-(19,64)) (Var (Just (19,55)-(19,56)) "^") [App (Just (19,37)-(19,54)) (Var (Just (19,38)-(19,50)) "exprToString") [Var (Just (19,51)-(19,53)) "e2"],Lit (Just (19,57)-(19,63)) (LS ")/2)")]]]]),(ConPat (Just (20,4)-(20,16)) "Times" (Just (TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "e1",VarPat (Just (20,14)-(20,16)) "e2"])),Nothing,App (Just (21,6)-(21,75)) (Var (Just (21,26)-(21,27)) "^") [App (Just (21,6)-(21,25)) (Var (Just (21,7)-(21,21)) "Format.sprintf") [Lit (Just (21,22)-(21,24)) (LS "")],App (Just (21,28)-(21,75)) (Var (Just (21,47)-(21,48)) "^") [App (Just (21,29)-(21,46)) (Var (Just (21,30)-(21,42)) "exprToString") [Var (Just (21,43)-(21,45)) "e1"],App (Just (21,49)-(21,74)) (Var (Just (21,54)-(21,55)) "^") [Lit (Just (21,50)-(21,53)) (LS "*"),App (Just (21,56)-(21,73)) (Var (Just (21,57)-(21,69)) "exprToString") [Var (Just (21,70)-(21,72)) "e2"]]]]),(ConPat (Just (22,4)-(22,29)) "Thresh" (Just (TuplePat (Just (22,12)-(22,29)) [VarPat (Just (22,12)-(22,13)) "a",VarPat (Just (22,14)-(22,15)) "b",VarPat (Just (22,16)-(22,22)) "a_less",VarPat (Just (22,23)-(22,29)) "b_less"])),Nothing,App (Just (23,6)-(29,65)) (Var (Just (23,27)-(23,28)) "^") [App (Just (23,6)-(23,26)) (Var (Just (23,7)-(23,21)) "Format.sprintf") [Lit (Just (23,22)-(23,25)) (LS "(")],App (Just (24,8)-(29,65)) (Var (Just (24,26)-(24,27)) "^") [App (Just (24,9)-(24,25)) (Var (Just (24,10)-(24,22)) "exprToString") [Var (Just (24,23)-(24,24)) "a"],App (Just (25,11)-(29,64)) (Var (Just (25,16)-(25,17)) "^") [Lit (Just (25,12)-(25,15)) (LS "<"),App (Just (26,14)-(29,63)) (Var (Just (26,32)-(26,33)) "^") [App (Just (26,15)-(26,31)) (Var (Just (26,16)-(26,28)) "exprToString") [Var (Just (26,29)-(26,30)) "b"],App (Just (27,17)-(29,62)) (Var (Just (27,22)-(27,23)) "^") [Lit (Just (27,18)-(27,21)) (LS "?"),App (Just (28,20)-(29,61)) (Var (Just (28,43)-(28,44)) "^") [App (Just (28,21)-(28,42)) (Var (Just (28,22)-(28,34)) "exprToString") [Var (Just (28,35)-(28,41)) "a_less"],App (Just (29,23)-(29,60)) (Var (Just (29,28)-(29,29)) "^") [Lit (Just (29,24)-(29,27)) (LS ":"),App (Just (29,30)-(29,59)) (Var (Just (29,53)-(29,54)) "^") [App (Just (29,31)-(29,52)) (Var (Just (29,32)-(29,44)) "exprToString") [Var (Just (29,45)-(29,51)) "b_less"],Lit (Just (29,55)-(29,58)) (LS ")")]]]]]]]])]
*)

(* typed spans
(12,2)-(29,65)
*)

(* correct types
*)

(* bad types
unit -> expr
*)
