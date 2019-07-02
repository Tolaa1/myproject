//global variables
const url = 'http://localhost:3000/gifs'
const gitPortfolioEl = document.querySelector('.Portfolio')
const formEl = document.querySelector('#btnNavigateToAddGif.btn.btn-success.btn-lg')
const comment = document.querySelector('commentEl')
//get all the gifs 
function getGifs(){
    return fetch(url)
      .then(resp => resp.json())
}


//add a single gif
const addGif = (gif) => {
  //console.log(gif)
  const gifDiv = document.createElement('div')
    gifDiv.classList.add('card')
    gifDiv.innerHTML = 
    `
        <img src="${gif.url}" class="card-img" /> <img
        <div class="desc text-center"> Title:${gif.title} </div>
        <div class='likes'>${gif.likes} Likes</div>
        <button class="like-btn">Like </button>
        <div>
          <input id="${gif.id}" class="comments" type="text" value="${gif.comment ? gif.comment : ''}"/> 
        </div>
        <button class="comment-btn">AddComment </button>
        
   `
   + 
   `
       <ul class='commentsList' id='myCommentList${gif.id}'>
       ${gif.comments.map(comment => {
           return `<li>${comment.content }</li>`
       }).join('')}
  
       </ul>
       <td style='text-align: center;'><button class='delete-btn'>DeleteComment</button></td>

       
   `
    
  gitPortfolioEl.append(gifDiv)
  

  const likeBtn = gifDiv.querySelector('.like-btn')
  const likesEl = gifDiv.querySelector('.likes')
  const commentBtn = gifDiv.querySelector('.comment-btn')
  const commentEl = gifDiv.querySelector('.comments')
  const ulElement = gifDiv.querySelector('.commentsList');


   const deleteBtn = gifDiv.querySelector('.delete-btn')
   deleteBtn.addEventListener('click', e => {
   let commentEl = event.target.parentElement.querySelector("li")
   commentEl.remove();
   
   //this is server side 

   })

  //  function deleteComment(newComment, ulElementId, commentEl){
  //   //add new comment to our list
  //     const  ul = document.getElementById(ulElementId);
  //     const li = document.createElement("li");
  //     li.
  //     ul.appendChild(li);
  // }

    commentBtn.addEventListener("click", function(event){
          event.preventDefault()
    

          const ourGifId = commentEl.id; 
          const myComment = commentEl.value;
          const ulCommentID = ulElement.id;

           if(myComment === '') 
           {
             alert("please enter comment"); 
            // return;
           }
           else {
            newComment(myComment, ourGifId, ulCommentID, commentEl);
           }
            
    });
      
      

  likeBtn.addEventListener('click', () => {
    gif.likes++
    updateGif(gif)
      .then(gif => likesEl.innerText = `${gif.likes} Likes`) 
      })
  
}


function newComment(comment, gifId, ulElementId, commentEl){
    //add new comment to list
    const url = 'http://localhost:3000/comments';

    fetch(url, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        "Content-Type": "application/json"
      },
      body: JSON.stringify({content : comment, gif_id : gifId, user_id : 1 })
    })
    .then(function(resp){ 
    })
    .then(function(resp){ 
      updateCommentsUl(comment, ulElementId, commentEl);
    })

}

function updateCommentsUl(newComment, ulElementId, commentEl){
    //add new comment to our list
      const  ul = document.getElementById(ulElementId);
      const li = document.createElement("li");
      li.appendChild(document.createTextNode(newComment));
      ul.appendChild(li);

  commentEl.value = "";
}




  function updateComments(comments) {

    for (var i = 0; i < comments.length; i++) {
      var comment = comments[i];
      $('#comments').append(
        '<li> <div id='+ i +'"+class="commentText"><p>' +
          comment.content +
          '</p> <span class="date sub-text">' +
          comment.created_at +
          '</span> </div> </li><hr />'
      );
    }
  } 
  

//add multiple gifs
const addGifs = (gifs) => {
  gifs.forEach(gif => addGif(gif))
}

  
// LIKE A Gif: PATCH
function updateGif(gif) {
  return fetch(url + `/${gif.id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(gif)
  }).then(resp => resp.json())

}



$( document ).ready(function() {

    //login
    $('#btnLogin').click(function(event) {
      event.preventDefault();
      onLogin();
    });
  
    //go to register page
    $('#btnNavigateToRegister').click(function(event) {
      event.preventDefault();
      document.location = 'register.html';
    });
  
    //register
    $('#btnRegister').click(function(event) {
      event.preventDefault();
      onRegister();
    });
  
    //delete gif btnDeleteGif
    $('#btnDeleteGif').click(function(event) {
      onDelete();
    });
  
    $('#btnNavigateToAddGif').click(function(event) {
      event.preventDefault();
      document.location = 'addgif.html';
    });
  

    $('#btnAddGif').click(function(event) {
      event.preventDefault();
      onAddGif();
      //alert("hello")
     // document.location = 'addgif.html';
    });


});





//GET user login
function onLogin() {
    const user_name = document.getElementById('username').value; 
    const password = document.getElementById('password').value;

  $('form[name=login]').attr('action', 'main.html');
  $('form[name=login]').submit();

  //validating
  if (user_name === '' || password === '') {
    alert('Please enter username or password');
    return;
  }

  const url = `http://localhost:3000/users/:id`;
  fetch(url, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({id: 2 })
  })
    .then(res => {
      alert("Welcome");
      document.location = 'main.html';      
     console.log(res)
    }
)
}
//delete gif from the server
function deleteGifFromServer(gif) {

	return fetch(url + `/${gif.id}`, {
		method: 'DELETE'
	}).then(resp => resp.json())
}

const  deleteContentfromCommment = comment => {
  debugger
  return fetch( `http://localhost:3000/comments` + `/${comment.id}`,{
    method: "DELETE"
  }).then(resp => resp.json())
}




//delete gif from the page
// function deleteGifFromThePage(gif) {
// 	const gifDiv = document.querySelector(`gif ${gif.id}`)
// 	gifDiv.remove()
// }
// function deleteGif(gif) {
// 	deleteGifFromServer(gif)
// 	deleteGifFromThePage(gif)
// }
// function onDelete() {
//   var result = confirm('Do you want to delete this gif?');
//   if (!result) {
//     //Logic to delete the item
//     return;
//   }
//   //run delete fetch
//}

function onAddGif() {
  const title = $('#gifTitle').val();
  const newgifurl = $('#gifUrl').val();
  const description = $('#gifDescription').val();

  if (title === '' || newgifurl === '' || description === '') {
    alert('Please enter gif details');
    return;
  }

  fetch(url, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      title: title,
      url: newgifurl,
      description: description,
      likes: 0
    })
    
  })
  .then(function(res){ 
  })
  .then(function(data){ 
    alert("Upload succesfull");
    document.location = 'main.html'; 
    //updateCommentsUl(comment, ulElementId, commentEl);

    //alert( JSON.stringify( data ) ) 
    //init();
    //location.reload()
  })



}

  //initiallizer
function init() {
  getGifs()
    .then(gifs => addGifs(gifs))
    deleteContentfromCommment();
   // onAddGif()
          
}
init();



  
