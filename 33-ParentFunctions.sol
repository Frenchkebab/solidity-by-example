// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    Calling parent functions
    - direct
    - super

      E
     / \
    F   G
     \ /
      H
*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo(); // method 1
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar(); // method 2
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo();
    }

    function bar() public override(F, G) {
        super.bar(); // this calls all parents (both F.bar, G.bar)
    }
}