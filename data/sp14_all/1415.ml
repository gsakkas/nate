
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ((n mod 10) []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n x = if n = 0 then x else loop (n / 10) ((n mod 10) :: x) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(3,24)-(3,46)
EMPTY
EmptyG

(3,24)-(3,65)
EMPTY
EmptyG

(3,25)-(3,36)
let rec loop =
  fun n ->
    fun x ->
      if n = 0
      then x
      else loop (n / 10)
                ((n mod 10) :: x) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,37)-(3,45)
fun n ->
  fun x ->
    if n = 0
    then x
    else loop (n / 10)
              ((n mod 10) :: x)
LamG (LamG EmptyG)

(3,50)-(3,65)
(n mod 10) :: x
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(3,62)-(3,64)
match n with
| 0 -> [0]
| _ -> loop n []
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

*)
