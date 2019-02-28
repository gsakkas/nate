
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     match t with
     | [] -> [h]
     | _ ->
         [(h * i) / 10] @
           (mulByDigit i
              [(let (h2::[])::t2 = t in [h2 + ((h * i) mod 10)] @ t2)]));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(12,72)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(4,7)-(4,9)
EMPTY
EmptyG

(10,11)-(10,12)
x
VarG

(11,12)-(11,22)
EMPTY
EmptyG

(12,41)-(12,43)
EMPTY
EmptyG

(12,48)-(12,49)
x
VarG

(12,66)-(12,68)
x'
VarG

*)

(* typed spans
(3,2)-(7,63)
(6,8)-(6,9)
(7,12)-(7,13)
(7,29)-(7,31)
*)

(* typed spans
int list
int
int
int
*)

(* typed spans
int list
int
int
int list list
*)
