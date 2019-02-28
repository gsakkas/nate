
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ (("*" (exprToString tm3)) ^ ")"))));;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,tf) -> if tf = true then wwhile (f, num) else num;;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  wwhile
    ((let func b =
        let ans = f b in if b = ans then (ans, false) else (ans, true) in
      func), b);;

let _ = fixpoint (collatz, 9001);;

*)

(* changed spans
(13,21)-(39,75)
fun (f , b) ->
  (let ans = f b in
   match ans with
   | (num , tf) -> if tf = true
                   then wwhile (f , num)
                   else num)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(39,19)-(39,37)
fun n ->
  match n with
  | 1 -> 1
  | _ when (n mod 2) = 0 -> n / 2
  | _ -> (3 * n) + 1
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG),(Just EmptyG,EmptyG)]))

(39,19)-(39,37)
fun (f , b) ->
  wwhile (let func =
            fun b ->
              (let ans = f b in
               if b = ans
               then (ans , false)
               else (ans , true)) in
          func , b)
LamG (AppG (fromList [EmptyG]))

(39,40)-(39,72)
wwhile
VarG

(39,41)-(39,65)
(let func =
   fun b ->
     (let ans = f b in
      if b = ans
      then (ans , false)
      else (ans , true)) in
 func , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(39,42)-(39,45)
f
VarG

(39,46)-(39,64)
b
VarG

(39,46)-(39,64)
if b = ans
then (ans , false)
else (ans , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(39,46)-(39,64)
func
VarG

(39,46)-(39,64)
b
VarG

(39,68)-(39,71)
fixpoint
VarG

*)

(* changed exprs
Lam (Just (2,16)-(4,73)) (TuplePat (Just (2,16)-(2,19)) [VarPat (Just (2,16)-(2,17)) "f",VarPat (Just (2,18)-(2,19)) "b"]) (Let (Just (3,2)-(4,73)) NonRec [(VarPat (Just (3,6)-(3,9)) "ans",App (Just (3,12)-(3,15)) (Var (Just (3,12)-(3,13)) "f") [Var (Just (3,14)-(3,15)) "b"])] (Case (Just (4,2)-(4,73)) (Var (Just (4,8)-(4,11)) "ans") [(TuplePat (Just (4,20)-(4,26)) [VarPat (Just (4,20)-(4,23)) "num",VarPat (Just (4,24)-(4,26)) "tf"],Nothing,Ite (Just (4,31)-(4,73)) (Bop (Just (4,34)-(4,43)) Eq (Var (Just (4,34)-(4,36)) "tf") (Lit (Just (4,39)-(4,43)) (LB True))) (App (Just (4,49)-(4,64)) (Var (Just (4,49)-(4,55)) "wwhile") [Tuple (Just (4,56)-(4,64)) [Var (Just (4,57)-(4,58)) "f",Var (Just (4,60)-(4,63)) "num"]]) (Var (Just (4,70)-(4,73)) "num"))])) Nothing
Lam (Just (6,12)-(7,74)) (VarPat (Just (6,12)-(6,13)) "n") (Case (Just (7,2)-(7,74)) (Var (Just (7,8)-(7,9)) "n") [(LitPat (Just (7,17)-(7,18)) (LI 1),Nothing,Lit (Just (7,22)-(7,23)) (LI 1)),(WildPat (Just (7,26)-(7,27)),Just (Bop (Just (7,33)-(7,46)) Eq (Bop (Just (7,33)-(7,42)) Mod (Var (Just (7,34)-(7,35)) "n") (Lit (Just (7,40)-(7,41)) (LI 2))) (Lit (Just (7,45)-(7,46)) (LI 0))),Bop (Just (7,50)-(7,55)) Div (Var (Just (7,50)-(7,51)) "n") (Lit (Just (7,54)-(7,55)) (LI 2))),(WildPat (Just (7,58)-(7,59)),Nothing,Bop (Just (7,63)-(7,74)) Plus (Bop (Just (7,63)-(7,70)) Times (Lit (Just (7,64)-(7,65)) (LI 3)) (Var (Just (7,68)-(7,69)) "n")) (Lit (Just (7,73)-(7,74)) (LI 1)))]) Nothing
Lam (Just (9,14)-(13,15)) (TuplePat (Just (9,14)-(9,17)) [VarPat (Just (9,14)-(9,15)) "f",VarPat (Just (9,16)-(9,17)) "b"]) (App (Just (10,2)-(13,15)) (Var (Just (10,2)-(10,8)) "wwhile") [Tuple (Just (11,4)-(13,15)) [Let (Just (11,5)-(13,11)) NonRec [(VarPat (Just (11,10)-(11,14)) "func",Lam (Just (11,15)-(12,70)) (VarPat (Just (11,15)-(11,16)) "b") (Let (Just (12,8)-(12,70)) NonRec [(VarPat (Just (12,12)-(12,15)) "ans",App (Just (12,18)-(12,21)) (Var (Just (12,18)-(12,19)) "f") [Var (Just (12,20)-(12,21)) "b"])] (Ite (Just (12,25)-(12,70)) (Bop (Just (12,28)-(12,35)) Eq (Var (Just (12,28)-(12,29)) "b") (Var (Just (12,32)-(12,35)) "ans")) (Tuple (Just (12,41)-(12,53)) [Var (Just (12,42)-(12,45)) "ans",Lit (Just (12,47)-(12,52)) (LB False)]) (Tuple (Just (12,59)-(12,70)) [Var (Just (12,60)-(12,63)) "ans",Lit (Just (12,65)-(12,69)) (LB True)]))) Nothing)] (Var (Just (13,6)-(13,10)) "func"),Var (Just (13,13)-(13,14)) "b"]]) Nothing
Var (Just (10,2)-(10,8)) "wwhile"
Tuple (Just (11,4)-(13,15)) [Let (Just (11,5)-(13,11)) NonRec [(VarPat (Just (11,10)-(11,14)) "func",Lam (Just (11,15)-(12,70)) (VarPat (Just (11,15)-(11,16)) "b") (Let (Just (12,8)-(12,70)) NonRec [(VarPat (Just (12,12)-(12,15)) "ans",App (Just (12,18)-(12,21)) (Var (Just (12,18)-(12,19)) "f") [Var (Just (12,20)-(12,21)) "b"])] (Ite (Just (12,25)-(12,70)) (Bop (Just (12,28)-(12,35)) Eq (Var (Just (12,28)-(12,29)) "b") (Var (Just (12,32)-(12,35)) "ans")) (Tuple (Just (12,41)-(12,53)) [Var (Just (12,42)-(12,45)) "ans",Lit (Just (12,47)-(12,52)) (LB False)]) (Tuple (Just (12,59)-(12,70)) [Var (Just (12,60)-(12,63)) "ans",Lit (Just (12,65)-(12,69)) (LB True)]))) Nothing)] (Var (Just (13,6)-(13,10)) "func"),Var (Just (13,13)-(13,14)) "b"]
Var (Just (12,18)-(12,19)) "f"
Var (Just (12,20)-(12,21)) "b"
Ite (Just (12,25)-(12,70)) (Bop (Just (12,28)-(12,35)) Eq (Var (Just (12,28)-(12,29)) "b") (Var (Just (12,32)-(12,35)) "ans")) (Tuple (Just (12,41)-(12,53)) [Var (Just (12,42)-(12,45)) "ans",Lit (Just (12,47)-(12,52)) (LB False)]) (Tuple (Just (12,59)-(12,70)) [Var (Just (12,60)-(12,63)) "ans",Lit (Just (12,65)-(12,69)) (LB True)])
Var (Just (13,6)-(13,10)) "func"
Var (Just (13,13)-(13,14)) "b"
Var (Just (15,8)-(15,16)) "fixpoint"
*)

(* typed spans
(2,16)-(4,73)
(6,12)-(7,74)
(9,14)-(13,15)
(10,2)-(10,8)
(11,4)-(13,15)
(12,18)-(12,19)
(12,20)-(12,21)
(12,25)-(12,70)
(13,6)-(13,10)
(13,13)-(13,14)
(15,8)-(15,16)
*)

(* correct types
(int -> (int * bool) * int) -> int
int -> int
(int -> int * int) -> int
(int -> (int * bool) * int) -> int
(int -> (int * bool) * int)
int -> int
int
(int * bool)
int -> (int * bool)
int
(int -> int * int) -> int
*)

(* bad types
expr -> string
string
string
string
string
string
string
string
string
string
string
*)
