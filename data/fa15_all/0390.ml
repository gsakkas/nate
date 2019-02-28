
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,s) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString s) ^ ")")))))))
  | Trip (x,y,z) ->
      "((" ^
        ((exprToString x) ^
           ("%30.0)" ^ (exprToString ^ ("%" ^ ((exprToString z) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,s) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString s) ^ ")")))))))
  | Trip (x,y,z) ->
      "((" ^
        ((exprToString x) ^
           ("%30.0)" ^ ((exprToString y) ^ ("%" ^ ((exprToString z) ^ ")")))));;

*)

(* changed spans
(30,24)-(30,36)
exprToString y
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (30,24)-(30,40)) (Var (Just (30,25)-(30,37)) "exprToString") [Var (Just (30,38)-(30,39)) "y"]
*)

(* typed spans
(30,24)-(30,40)
*)

(* correct types
string
*)

(* bad types
expr -> string
*)
