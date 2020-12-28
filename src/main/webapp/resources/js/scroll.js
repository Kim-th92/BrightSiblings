const container = document.getElementById('container');
const loading = document.querySelector('.loading');

getPost();
getPost();
getPost();

window.addEventListener('scroll', function () {
		const { scrollTop, scrollHeight, clientHeight } = document.documentElement;

		console.log({ scrollTop, scrollHeight, clientHeight });

		if (clientHeight + scrollTop >= scrollHeight - 5) {
			// show the loading animation
			showLoading();
		}
	});

function showLoading() {
	loading.classList.add('show');
	
	// load more data
	setTimeout(getPost, 1000)
}



function addDataToDOM(data) {
	const postElement = document.createElement('div');
	postElement.classList.add('feedWrap');

	container.appendChild(postElement);
	
	loading.classList.remove('show');
}

