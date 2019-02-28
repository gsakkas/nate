
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      "((" ^
        ((exprToString ex1) ^
           (")*(" ^
              ((exprToString ex1) ^
                 ("+" ^
                    ((exprToString ex2) ^
                       (")*(" ^
                          ((exprToString ex1) ^
                             ("+" ^
                                ((exprToString ex2 "+") ^
                                   ((exprToString ex3) ^
                                      (")*(" ^
                                         ((exprToString ex1) ^
                                            ("+" ^
                                               ((exprToString ex2 "+") ^
                                                  ((exprToString ex3 "+") ^
                                                     ((exprToString ex4) ^
                                                        (")*(" ^
                                                           ((exprToString ex1)
                                                              ^
                                                              ("+" ^
                                                                 ((exprToString
                                                                    ex2 "+")
                                                                    ^
                                                                    (
                                                                    (exprToString
                                                                    ex3 "+")
                                                                    ^
                                                                    ((exprToString
                                                                    ex4 "+")
                                                                    ^
                                                                    ((exprToString
                                                                    ex5) ^
                                                                    "))")))))))))))))))))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      "((" ^
        ((exprToString ex1) ^
           (")*(" ^
              ((exprToString ex1) ^
                 ("+" ^
                    ((exprToString ex2) ^
                       (")*(" ^
                          ((exprToString ex1) ^
                             ("+" ^
                                ((exprToString ex2) ^
                                   ("+" ^
                                      ((exprToString ex3) ^
                                         (")*(" ^
                                            ((exprToString ex1) ^
                                               ("+" ^
                                                  ((exprToString ex2) ^
                                                     ("+" ^
                                                        ((exprToString ex3) ^
                                                           ("+" ^
                                                              ((exprToString
                                                                  ex4)
                                                                 ^
                                                                 (")*(" ^
                                                                    (
                                                                    (exprToString
                                                                    ex1) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex2) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex3) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex4) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex5) ^
                                                                    "))")))))))))))))))))))))))))))));;

*)

(* changed spans
(39,33)-(39,55)
exprToString ex2
AppG (fromList [VarG])

(39,51)-(39,54)
"+" ^ (exprToString ex3 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ ("+" ^ (exprToString ex5 ^ "))")))))))))))))))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(44,48)-(44,70)
exprToString ex2
AppG (fromList [VarG])

(45,51)-(45,73)
"+"
LitG

(45,52)-(45,64)
(^)
VarG

(45,52)-(45,64)
exprToString ex3
AppG (fromList [VarG])

(45,69)-(45,72)
"+" ^ (exprToString ex4 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ ("+" ^ (exprToString ex5 ^ "))")))))))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(51,66)-(52,76)
exprToString ex2
AppG (fromList [VarG])

(55,68)-(56,76)
"+"
LitG

(55,69)-(55,81)
(^)
VarG

(55,69)-(55,81)
exprToString ex3
AppG (fromList [VarG])

(60,68)-(60,69)
"+"
LitG

(58,69)-(59,76)
(^)
VarG

(58,69)-(59,76)
exprToString ex4
AppG (fromList [VarG])

(59,68)-(59,71)
"+" ^ (exprToString ex5 ^ "))")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (39,33)-(39,51)) (Var (Just (39,34)-(39,46)) "exprToString") [Var (Just (39,47)-(39,50)) "ex2"]
App (Just (40,35)-(68,92)) (Var (Just (40,40)-(40,41)) "^") [Lit (Just (40,36)-(40,39)) (LS "+"),App (Just (41,38)-(68,91)) (Var (Just (41,58)-(41,59)) "^") [App (Just (41,39)-(41,57)) (Var (Just (41,40)-(41,52)) "exprToString") [Var (Just (41,53)-(41,56)) "ex3"],App (Just (42,41)-(68,90)) (Var (Just (42,48)-(42,49)) "^") [Lit (Just (42,42)-(42,47)) (LS ")*("),App (Just (43,44)-(68,89)) (Var (Just (43,64)-(43,65)) "^") [App (Just (43,45)-(43,63)) (Var (Just (43,46)-(43,58)) "exprToString") [Var (Just (43,59)-(43,62)) "ex1"],App (Just (44,47)-(68,88)) (Var (Just (44,52)-(44,53)) "^") [Lit (Just (44,48)-(44,51)) (LS "+"),App (Just (45,50)-(68,87)) (Var (Just (45,70)-(45,71)) "^") [App (Just (45,51)-(45,69)) (Var (Just (45,52)-(45,64)) "exprToString") [Var (Just (45,65)-(45,68)) "ex2"],App (Just (46,53)-(68,86)) (Var (Just (46,58)-(46,59)) "^") [Lit (Just (46,54)-(46,57)) (LS "+"),App (Just (47,56)-(68,85)) (Var (Just (47,76)-(47,77)) "^") [App (Just (47,57)-(47,75)) (Var (Just (47,58)-(47,70)) "exprToString") [Var (Just (47,71)-(47,74)) "ex3"],App (Just (48,59)-(68,84)) (Var (Just (48,64)-(48,65)) "^") [Lit (Just (48,60)-(48,63)) (LS "+"),App (Just (49,62)-(68,83)) (Var (Just (51,65)-(51,66)) "^") [App (Just (49,63)-(50,70)) (Var (Just (49,64)-(49,76)) "exprToString") [Var (Just (50,66)-(50,69)) "ex4"],App (Just (52,65)-(68,82)) (Var (Just (52,72)-(52,73)) "^") [Lit (Just (52,66)-(52,71)) (LS ")*("),App (Just (53,68)-(68,81)) (Var (Just (55,73)-(55,74)) "^") [App (Just (54,68)-(55,72)) (Var (Just (54,69)-(54,81)) "exprToString") [Var (Just (55,68)-(55,71)) "ex1"],App (Just (56,68)-(68,80)) (Var (Just (56,73)-(56,74)) "^") [Lit (Just (56,69)-(56,72)) (LS "+"),App (Just (57,68)-(68,79)) (Var (Just (58,73)-(58,74)) "^") [App (Just (57,69)-(58,72)) (Var (Just (57,70)-(57,82)) "exprToString") [Var (Just (58,68)-(58,71)) "ex2"],App (Just (59,68)-(68,78)) (Var (Just (59,73)-(59,74)) "^") [Lit (Just (59,69)-(59,72)) (LS "+"),App (Just (60,68)-(68,77)) (Var (Just (61,73)-(61,74)) "^") [App (Just (60,69)-(61,72)) (Var (Just (60,70)-(60,82)) "exprToString") [Var (Just (61,68)-(61,71)) "ex3"],App (Just (62,68)-(68,76)) (Var (Just (62,73)-(62,74)) "^") [Lit (Just (62,69)-(62,72)) (LS "+"),App (Just (63,68)-(68,75)) (Var (Just (64,73)-(64,74)) "^") [App (Just (63,69)-(64,72)) (Var (Just (63,70)-(63,82)) "exprToString") [Var (Just (64,68)-(64,71)) "ex4"],App (Just (65,68)-(68,74)) (Var (Just (65,73)-(65,74)) "^") [Lit (Just (65,69)-(65,72)) (LS "+"),App (Just (66,68)-(68,73)) (Var (Just (67,73)-(67,74)) "^") [App (Just (66,69)-(67,72)) (Var (Just (66,70)-(66,82)) "exprToString") [Var (Just (67,68)-(67,71)) "ex5"],Lit (Just (68,68)-(68,72)) (LS "))")]]]]]]]]]]]]]]]]]]]]
App (Just (45,51)-(45,69)) (Var (Just (45,52)-(45,64)) "exprToString") [Var (Just (45,65)-(45,68)) "ex2"]
Lit (Just (46,54)-(46,57)) (LS "+")
Var (Just (47,76)-(47,77)) "^"
App (Just (47,57)-(47,75)) (Var (Just (47,58)-(47,70)) "exprToString") [Var (Just (47,71)-(47,74)) "ex3"]
App (Just (48,59)-(68,84)) (Var (Just (48,64)-(48,65)) "^") [Lit (Just (48,60)-(48,63)) (LS "+"),App (Just (49,62)-(68,83)) (Var (Just (51,65)-(51,66)) "^") [App (Just (49,63)-(50,70)) (Var (Just (49,64)-(49,76)) "exprToString") [Var (Just (50,66)-(50,69)) "ex4"],App (Just (52,65)-(68,82)) (Var (Just (52,72)-(52,73)) "^") [Lit (Just (52,66)-(52,71)) (LS ")*("),App (Just (53,68)-(68,81)) (Var (Just (55,73)-(55,74)) "^") [App (Just (54,68)-(55,72)) (Var (Just (54,69)-(54,81)) "exprToString") [Var (Just (55,68)-(55,71)) "ex1"],App (Just (56,68)-(68,80)) (Var (Just (56,73)-(56,74)) "^") [Lit (Just (56,69)-(56,72)) (LS "+"),App (Just (57,68)-(68,79)) (Var (Just (58,73)-(58,74)) "^") [App (Just (57,69)-(58,72)) (Var (Just (57,70)-(57,82)) "exprToString") [Var (Just (58,68)-(58,71)) "ex2"],App (Just (59,68)-(68,78)) (Var (Just (59,73)-(59,74)) "^") [Lit (Just (59,69)-(59,72)) (LS "+"),App (Just (60,68)-(68,77)) (Var (Just (61,73)-(61,74)) "^") [App (Just (60,69)-(61,72)) (Var (Just (60,70)-(60,82)) "exprToString") [Var (Just (61,68)-(61,71)) "ex3"],App (Just (62,68)-(68,76)) (Var (Just (62,73)-(62,74)) "^") [Lit (Just (62,69)-(62,72)) (LS "+"),App (Just (63,68)-(68,75)) (Var (Just (64,73)-(64,74)) "^") [App (Just (63,69)-(64,72)) (Var (Just (63,70)-(63,82)) "exprToString") [Var (Just (64,68)-(64,71)) "ex4"],App (Just (65,68)-(68,74)) (Var (Just (65,73)-(65,74)) "^") [Lit (Just (65,69)-(65,72)) (LS "+"),App (Just (66,68)-(68,73)) (Var (Just (67,73)-(67,74)) "^") [App (Just (66,69)-(67,72)) (Var (Just (66,70)-(66,82)) "exprToString") [Var (Just (67,68)-(67,71)) "ex5"],Lit (Just (68,68)-(68,72)) (LS "))")]]]]]]]]]]]]
App (Just (57,69)-(58,72)) (Var (Just (57,70)-(57,82)) "exprToString") [Var (Just (58,68)-(58,71)) "ex2"]
Lit (Just (59,69)-(59,72)) (LS "+")
Var (Just (61,73)-(61,74)) "^"
App (Just (60,69)-(61,72)) (Var (Just (60,70)-(60,82)) "exprToString") [Var (Just (61,68)-(61,71)) "ex3"]
Lit (Just (62,69)-(62,72)) (LS "+")
Var (Just (64,73)-(64,74)) "^"
App (Just (63,69)-(64,72)) (Var (Just (63,70)-(63,82)) "exprToString") [Var (Just (64,68)-(64,71)) "ex4"]
App (Just (65,68)-(68,74)) (Var (Just (65,73)-(65,74)) "^") [Lit (Just (65,69)-(65,72)) (LS "+"),App (Just (66,68)-(68,73)) (Var (Just (67,73)-(67,74)) "^") [App (Just (66,69)-(67,72)) (Var (Just (66,70)-(66,82)) "exprToString") [Var (Just (67,68)-(67,71)) "ex5"],Lit (Just (68,68)-(68,72)) (LS "))")]]
*)

(* typed spans
(39,33)-(39,51)
(40,35)-(68,92)
(45,51)-(45,69)
(46,54)-(46,57)
(47,76)-(47,77)
(47,57)-(47,75)
(48,59)-(68,84)
(57,69)-(58,72)
(59,69)-(59,72)
(61,73)-(61,74)
(60,69)-(61,72)
(62,69)-(62,72)
(64,73)-(64,74)
(63,69)-(64,72)
(65,68)-(68,74)
*)

(* correct types
string
string
string
string
string -> string -> string
string
string
string
string
string -> string -> string
string
string
string -> string -> string
string
string
*)

(* bad types
string
string
string
string
expr -> string
expr -> string
string
string
string
expr -> string
expr -> string
string -> string -> string
string
string
expr
*)
