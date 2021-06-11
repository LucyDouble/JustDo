/**
 * 
 */
ClassicEditor 
	
    .create( document.querySelector('#editor1'))
    .then( editor => { 
        console.log( editor ); 
    } ) 
    .catch( error => { 
        console.error( error ); 

    } );



