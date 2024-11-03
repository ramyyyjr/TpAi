:- dynamic tache/4.

creer_tache(Id, Desc, Assign) :-
    \+ tache(Id, _, _, _),
    assertz(tache(Id, Desc, Assign, false)),
    format("T�che cr��e : ~w.~n", [Id]).

assigner_tache(Id, NouveauAssign) :-
    retract(tache(Id, Desc, _, Statut)),
    assertz(tache(Id, Desc, NouveauAssign, Statut)),
    format("T�che ~w assign�e � l�utilisateur : ~w.~n", [Id, NouveauAssign]).

marquer_terminee(Id) :-
    retract(tache(Id, Desc, Assign, _)),
    assertz(tache(Id, Desc, Assign, true)),
    format("T�che ~w marqu�e comme termin�e.~n", [Id]).

afficher_taches :-
    forall(tache(Id, Desc, Assign, Statut),
           (format("T�che ~w :~n- Description : ~w~n- Assign� : ~w~n- Statut de compl�tion : ~w~n~n",
                   [Id, Desc, Assign, Statut]))).

afficher_taches_assignee_a(Assign) :-
    format("T�ches assign�es � ~w :~n", [Assign]),
    forall(tache(Id, Desc, Assign, Statut),
           (format("T�che ~w :~n- Description : ~w~n- Statut de compl�tion : ~w~n~n",
                   [Id, Desc, Statut]))).

afficher_taches_terminees :-
    format("T�ches termin�es :~n"),
    forall(tache(Id, Desc, Assign, true),
           (format("T�che ~w :~n- Description : ~w~n- Assign� : ~w~n~n",
                   [Id, Desc, Assign]))).
