document.addEventListener('DOMContentLoaded', () => {

    // Grab needed elements
    const div = document.getElementById('wrapper');
    const p = document.getElementById('section');
    const label = document.getElementById('count');
    const btn = document.getElementById('incrementBtn');

    let intervalId = null;

    function traceCalled(tagName) {
	console.log("I've been called from the", tagName);
    }

    function incrementCount() {
	const current_count = parseInt(label.innerText);
	label.innerText = current_count + 1;
    }

    function startTimer() {
	intervalId = setInterval(incrementCount, 500);
    }

    function stopTimer() {
	clearInterval(intervalId);
	intervalId = null;
    }

    btn.addEventListener('click', function() {
	if (intervalId) {
	    stopTimer();
	    btn.innerText = "Start Timer";
	} else {
	    startTimer();
	    btn.innerText = "Stop Timer";
	}
    });

    function incrementLi(e) {
	e.target.innerText++;
    }

    document.querySelector("ul").addEventListener('click', incrementLi);

    const form = document.querySelector("form");
    const input = document.querySelector("input#name");
    const greeting = document.querySelector("label#greeting");
    form.addEventListener('submit', function(e) {
	e.preventDefault();
	greeting.innerText = `Hi, ${input.value}!`;
	input.value = "";
    });
});
