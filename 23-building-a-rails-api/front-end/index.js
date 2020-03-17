document.addEventListener("DOMContentLoaded", () => {

    document.querySelector('#new-author').addEventListener('submit', e => {
	e.preventDefault();
	const nameInput = document.querySelector('#name');
	const data = {name: nameInput.value};
	console.log(data);

	fetch('http://localhost:3000/authors', {
	    method: 'POST',
	    headers: {
		'Content-Type': 'application/json',
	    },
	    body: JSON.stringify(data)
	});
    });

	const wrapper = document.querySelector('#wrapper');

	let authors = [];

	function renderAuthor(author) {
		const div = document.createElement('div');
		div.setAttribute('id', `author-${author.id}`);

		const h1 = document.createElement('h1');
		h1.innerText = author.name;


		div.appendChild(h1);
	    //div.appendChild(ul);
	    wrapper.appendChild(div);

	    div.addEventListener('click', e => {
		console.log(author.books);
		const ul = document.createElement('ul');

		for (let i = 0; i < author.books.length; i++) {
			const li = document.createElement('li');
			li.innerText = author.books[i].title;
			ul.appendChild(li);
		}

		div.appendChild(ul);
	    });
	}

	fetch("http://localhost:3000/authors")
		.then(response => response.json())
		.then(data => {
			for (let i = 0; i < data.length; i++) {
				renderAuthor(data[i]);
			}
		})
		.catch(e => console.log(e));


});
