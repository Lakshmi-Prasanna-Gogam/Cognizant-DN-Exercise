package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private BookRepository repository;

    public BookService() {
        System.out.println("BookService object created.");
    }

    public void setRepository(BookRepository repository) {
        this.repository = repository;
    }

    public void addBook() {

        System.out.println("Inside BookService");

        repository.saveBook();

    }

}