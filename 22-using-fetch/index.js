document.addEventListener("DOMContentLoaded", () => {
    // First Step: Getting the cohort data
    //    GET http://localhost:3000/cohorts
    //    save to variable
    //    console log data

    const COHORT_URI = 'http://localhost:3000/cohorts';
    const STUDENTS_URI = 'https://localhost:3000/students';

    let cohorts = [];

    ///// READING DATA

    // appends a new cohort name to ul
    function renderCohort(cohort) {
	const ul = document.querySelector("#cohorts");
	const li = document.createElement("li");

	li.innerText = cohort.name;

	ul.appendChild(li);
    }


    // appends a new cohort name to ul
    function renderStudent(student) {
	const ul = document.querySelector("#students");
	const li = document.createElement("li");
	const btn = document.createElement("button");

	li.innerText = student.name;
	btn.innerText = 'x';

	ul.appendChild(li);
	li.appendChild(btn);

	btn.addEventListener('click', function() {
	    const student_uri = `${STUDENTS_URI}/${student.id}`;
	    fetch(student, {
		'method': 'DELETE',
		'mode': 'cors'
	    });
	});
    }

    // return Promise
    fetch(COHORT_URI)
	.then((response) => {
	    return response.json(); // import
	})
        .then((data) => {
	    cohorts = data;
	    cohorts.forEach((el) => renderCohort(el));
	});

        // return Promise
    fetch(STUDENTS_URI)
	.then((response) => {
	    return response.json(); // import
	})
        .then((data) => {
	    cohorts = data;
	    cohorts.forEach((el) => renderStudent(el));
	});


    ///// Creating new students
    document.querySelector("#create-student").addEventListener('submit', (event) => {
	event.preventDefault();

	const name = document.querySelector("#create-student-name").value;
	if (name) {
	    fetch(STUDENTS_URI, {
		'method': 'POST',
		'headers': {
		    'Content-Type': 'application/json'
		},
		'body': JSON.stringify({ 'name': name })
	    }).then((response) => {
		return response.json();
	    }).then((student) => {
		renderStudent(student);
	    });
	    	}
    });
});
