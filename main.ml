(* Kai Geffen March 11 2017 *)
(* My version of the key-graph data type introduced in: *)
(* "Secure Group Communications Using Key Graphs" by Chung Kei Wong, Member, IEEE, Mohamed Gouda, and Simon S. Lam, Fellow, IEEE *)

(* ocamlc -o main main.ml; ./main *)

type user = string
type key = int
type userSet = user list
type keySet = key list
(* TODO(kgeffen) Consider removing if not needed *)
type userKeyPair = (user * key)
type userKeyRelation = userKeyPair list
type secureGroup = (userSet * keySet * userKeyRelation)


let _ = 
  print_string ("Hello world\n")