:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

name_game :-
    nl,
    write('Hi. This is the "Name Game".'), nl,
    write('You can add, delete or move English letters to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    process_choice(Choice).

process_choice(1) :-
    !,
    findall(L, letter(L), Letters),
    write('Current letters: '),
    write(Letters), nl,
    menu.

process_choice(2) :-
    !,
    write('Enter a letter: '),
    read(L),
    assert(letter(L)),
    write('Letter added.'), nl,
    menu.

process_choice(3) :-
    !,
    write('Enter a letter: '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top.'), nl,
    menu.

process_choice(4) :-
    !,
    write('Enter a letter: '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl,
    menu.

process_choice(5) :-
    !,
    write('Enter the letter to delete: '),
    read(L),
    ( retract(letter(L)) ->
        write('Letter deleted.'), nl
    ;
        write('Letter not found.'), nl
    ),
    menu.

process_choice(6) :-
    !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

process_choice(7) :-
    !,
    write('Goodbye!'), nl.

process_choice(_) :-
    write('Invalid choice. Please choose 1-7.'), nl,
    menu.
