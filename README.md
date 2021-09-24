
# [Linked-List](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/linked-lists)

<details open="open">
  <summary>Table Of Contents</summary>
  <ol>
    <li>
      <a href="#description">Description</a>
    </li>
    <li>
      <a href="#applications">Applications</a>
    </li>
    <li>
      <a href="#built-with">Built With</a>
    </li>
     <li>
      <a href="#what-i-learned">What I Learned</a>
    </li>
     <li>
      <a href="#acknowledgements">Acknowledgements</a>
    </li>
  </ol>
</details>

## Description
>In Computer Science one of the most basic and fundamental data structures is the linked list, which functions similarly to an array. 
>The principal benefit of a linked list over a conventional array is that the `Linked List` elements can easily be inserted or removed without reallocation of any other elements. In some programming languages the size of an array is a concern and one of the ways to overcome that problem and allow dynamically allocated data is using linked lists.<br/>
> -The Odin Project.

`Linked List` is a collection of what is called as `nodes`. There are many types of `Linked List` available,
  * Singly Linked List
  * Doubly Linked List
  * Circular Linked List
  
These are few types of `Linked List`. We are implementing `Singly Linked List` here (If I can I will implement other types in future). In `Singly Linked List` each `node` will contain one `data` and one `pointer` to the next `node` that follows. First node of a Linked List is called as a `head` node and the last one as a `tail` node.
In this implementation we have two classes one for represents the `node` which we will use to create nodes for the `Linked List` and the other one is to represent the whole `Linked List` with all of the operations defined on the `Linked List`.


Here are the methods implementd in the `Node` & `Linked List` classes

Method Name  | Description
------------ | -------------
`Node#value`   | `value` of the Node
`Node#next_node` | Points to the `next_node` of the Linked List
`LinkedList#append(value)` | Adds a new node containing `value` to the end of the `Linked List`
`LinkedList#prepend(value)` | Adds a new node containing `value` to the start of the `Linked List`
`LinkedList#insert_at(value, index)` | Inserts a `new node` with the provided `value` at the given `index`
`LinkedList#size` | Returns the `total numbers of nodes` in the `LinkedList`
`LinkedList#head` | Returns the `first node` in the `Linked List`
`LinkedList#tail` | Returns the `last node` in the `Linked List`
`LinkedList#at(index)` | Returns the `node` at the given `index`
`LinkedList#shift` | Removes the `first node` from the `Linked List`
`LinkedList#pop` | Removes the `last node` from the `Linked List`
`LinkedList#remove_at(index)` | Removes the `node` at the given `index`
`LinkedList#update_at(value, index)` | Updates the `value` at the given `index`
`LinkedList#contains?(value)` | Returns `true` if the passed in value is in the `Linked List` and otherwise returns `false`
`LinkedList#find(value)` | Returns the index of the `node` containing `value`, or `nil` if not found
`LinkedList#to_s` | Returns the `string` representation of the `Linked List`

## Applications
* Implementation of `stacks` and `queues`
* Implementation of `graphs` (`Adjacency list`)
* Music Player
* Web Browser - Previous and Next Page
* Image Viewer
* And so on....

## Built With
* Ruby

## What I Learned
* What is linked list
* How to create a linked list
* How to use a linked list
* Operations on a linked list
  
## Acknowledgements
* [The Odin Project](https://theodinproject.com)

[Move To Top](#linked-list)

