// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


// Insert, Update, Read from array of structs
contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        // 1) if you only have only one field in struct update, this might be cheaper way
        todos[_index].text = _text;

        // 2) if you have multiple states to update, this way might be cheaper
        Todo storage todo = todos[_index]; // we can update the state variable
        todo.text = _text;

        // 35138 gas (this access to array at index - we're accessing the array 4 times)
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;

        // 34578 gas ( you access to the array only once)
        // Todo storage todo = todos[_index];
        // todo.text = _text;
        // todo.text = _text;
        // todo.text = _text;
        // todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool) {
        // storage - 29397
        // memory - 29480
        Todo storage todo = todos[_index]; // this does not copy, so cheaper
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}