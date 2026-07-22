import React, { useState } from "react";

import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

function App() {

    const [page, setPage] = useState("book");

    // Method 1: Element Variable
    let component;

    if (page === "book") {
        component = <BookDetails />;
    }

    return (
        <div style={{ textAlign: "center" }}>

            <h1>Blogger App</h1>

            <button onClick={() => setPage("book")}>
                Books
            </button>

            <button onClick={() => setPage("blog")}>
                Blogs
            </button>

            <button onClick={() => setPage("course")}>
                Courses
            </button>

            <hr />

            {/* Method 1 : Element Variable */}
            {component}

            {/* Method 2 : Logical && */}
            {page === "blog" && <BlogDetails />}

            {/* Method 3 : Ternary Operator */}
            {
                page === "course"
                    ? <CourseDetails />
                    : null
            }

        </div>
    );
}

export default App;