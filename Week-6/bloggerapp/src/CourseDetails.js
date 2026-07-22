import React from "react";

function CourseDetails() {

    const courses = [
        {
            id: 1,
            name: "React JS",
            duration: "45 Days"
        },
        {
            id: 2,
            name: "Angular",
            duration: "40 Days"
        },
        {
            id: 3,
            name: "Node JS",
            duration: "35 Days"
        }
    ];

    return (
        <div>
            <h2>Course Details</h2>

            <ul>
                {
                    courses.map(course => (
                        <li key={course.id}>
                            {course.name} - {course.duration}
                        </li>
                    ))
                }
            </ul>
        </div>
    );
}

export default CourseDetails;